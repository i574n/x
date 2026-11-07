param(
    [Parameter(Mandatory)] [string] $Exe,
    [string[]] $Repos = @(),
    [int] $Batch = 150,
    [string] $Tsv
)
$ErrorActionPreference = 'Stop'
$Repos = @($Repos | ForEach-Object { $_ -split ',' } | Where-Object { $_ })
if (-not $Repos) { $Repos = @(Split-Path $PSScriptRoot -Parent) }
function Get-RepoLine($group) {
    $cells = ($group | Measure-Object Cells -Sum).Sum
    $spilled = ($group | Measure-Object Spilled -Sum).Sum
    $clean = @($group | Where-Object { $_.Spilled -eq 0 }).Count
    '{0}: files {1}, files with every cell in one post {2}, cells {3}, cells over one post {4}, posts {5}' -f $group[0].Repo, @($group).Count, $clean, $cells, $spilled, ($group | Measure-Object Posts -Sum).Sum
}
$rows = [Collections.Generic.List[object]]::new()
foreach ($repo in $Repos) {
    $root = (Resolve-Path $repo).Path
    $repoRows = @(
    $files = @(git -C $root ls-files --cached --others --exclude-standard '*.spi' | Where-Object { $_ -notmatch '(^|/)(target|e2e)/' } | Sort-Object -Unique | ForEach-Object { Join-Path $root $_ } | Where-Object { Test-Path -LiteralPath $_ })
    for ($i = 0; $i -lt $files.Count; $i += $Batch) {
        $chunk = @($files[$i..([Math]::Min($files.Count, $i + $Batch) - 1)])
        $current = $null; $cells = 0; $spilled = 0; $posts = 0
        foreach ($line in & $Exe post-thread --dry-run @chunk) {
            if ($line.StartsWith('=== ')) {
                if ($current) { [pscustomobject]@{ Repo = Split-Path $root -Leaf; File = $current; Cells = $cells; Spilled = $spilled; Posts = $posts } }
                $current = [IO.Path]::GetRelativePath($root, $line.Substring(4)); $cells = 0; $spilled = 0; $posts = 0
            } elseif ($line -match '^c\d+ (\d+)/(\d+)$') {
                $posts++
                if ($Matches[1] -eq '1') { $cells++; if ($Matches[2] -ne '1') { $spilled++ } }
            }
        }
        if ($current) { [pscustomobject]@{ Repo = Split-Path $root -Leaf; File = $current; Cells = $cells; Spilled = $spilled; Posts = $posts } }
    }
    )
    if ($repoRows) { Get-RepoLine $repoRows; $rows.AddRange($repoRows) } else { "$(Split-Path $root -Leaf): no .spi files" }
}
if ($Tsv) { $rows | ConvertTo-Csv -Delimiter "`t" -NoTypeInformation | Set-Content $Tsv }
$worst = @($rows | Where-Object { $_.Spilled -gt 0 } | Sort-Object Spilled -Descending | Select-Object -First 10)
if ($worst) { 'worst files:'; $worst | ForEach-Object { "    $($_.Repo)/$($_.File): $($_.Spilled) of $($_.Cells) cells over one post" } }
