param(
    [string] $Root = (Join-Path $PSScriptRoot '..'),
    [int] $Limit = 1000,
    [switch] $Enforce,
    [string] $Compiler
)
$ErrorActionPreference = "Stop"

if ($Compiler) {
    . (Join-Path $PSScriptRoot 'common.ps1')
    Assert-SpiralBeside
    $Compiler = (Resolve-Path $Compiler).Path
    $bundle = Join-Path $SpiralRoot 'apps/compiler/tmp'
    $toolchain = & { . (Join-Path $bundle 'scripts/env.ps1'); [pscustomobject]@{ PackageDir = Get-SpiralPackageDir; Dotnet = Resolve-SpiralDotnet } }
    $env:SPIRAL_COMPILER_PACKAGE_DIR = $toolchain.PackageDir
    $candidates = Get-XTargetDir 'gate-candidate'
    Write-Output "gate / candidate compiler $Compiler ($((Get-Item $Compiler).LastWriteTime.ToString('yyyy-MM-dd HH:mm')))"
}

function Get-CandidateOutput([string] $Crate, [string] $Entry) {
    $output = Join-Path $candidates "$Crate.rs"
    Remove-Item $output -ErrorAction Ignore
    $process = Start-Process -FilePath $toolchain.Dotnet -ArgumentList (@($Compiler, '--backend', 'Rust', $Entry, $output) | ForEach-Object { "`"$_`"" }) -NoNewWindow -PassThru -RedirectStandardOutput "$output.log" -RedirectStandardError "$output.err"
    $null = $process.Handle
    if (!$process.WaitForExit(600000)) { $process.Kill($true); throw "gate / $Crate / candidate compile timed out after 600 s" }
    if ($process.ExitCode -ne 0 -or !(Test-Path $output)) { throw "gate / $Crate / candidate compile failed (exit $($process.ExitCode)), see $output.err" }
    $output
}

$crates = foreach ($manifest in Get-ChildItem (Join-Path $Root 'apps') -Recurse -Filter Cargo.toml) {
    $text = [IO.File]::ReadAllText($manifest.FullName)
    if ($text -match '(?m)^\[package\.metadata\.spiral\]\s*\r?\nentry = "([^"]+)"\s*\r?\noutput = "([^"]+)"') {
        $crate = Split-Path $manifest.DirectoryName -Leaf
        $output = Join-Path $manifest.DirectoryName $Matches[2]
        $entry = Join-Path $manifest.DirectoryName $Matches[1]
        $identical = $null
        if ($Compiler) {
            $candidate = Get-CandidateOutput $crate $entry
            $identical = (Test-Path $output) -and [IO.File]::ReadAllText($candidate) -ceq [IO.File]::ReadAllText($output)
            $output = $candidate
        }
        $lines = if (Test-Path $output) { @(Get-Content $output).Count } else { -1 }
        [pscustomobject]@{ Crate = $crate; Output = $Matches[2]; Lines = $lines; Within = $lines -ge 0 -and $lines -le $Limit; Identical = $identical }
    }
}
$crates | Sort-Object Lines -Descending | ForEach-Object {
    $same = if ($null -eq $_.Identical) { '' } elseif ($_.Identical) { ' identical to tree' } else { ' DIFFERS from tree' }
    Write-Output ("gate / {0,-10} {1,6} lines {2}{3}" -f $_.Crate, $_.Lines, $(if ($_.Within) { 'ok' } else { "OVER $Limit" }), $same)
}
$over = @($crates | Where-Object { !$_.Within })
$differs = @($crates | Where-Object { $_.Identical -eq $false })
Write-Output "gate / $($crates.Count) crates, $($over.Count) over $Limit generated Rust lines$(if ($Compiler) { ", $($differs.Count) differing from the tree under the candidate" })"
if ($Enforce -and !$crates) { throw "gate / no crate with [package.metadata.spiral] entry/output found under $Root/apps, so nothing was measured" }
if ($Enforce -and $over.Count) { throw "gate / $($over.Count) crate(s) over $Limit lines: $(($over | ForEach-Object Crate) -join ', ')" }

$dataFiles = @('postability/tlds.txt', 'Cargo.lock', 'apps/sim/frames/manifest.toml')
$repoFiles = @(git -C $Root -c core.quotepath=off ls-files --cached --others --exclude-standard) |
    Where-Object { $_ -notmatch '^lab/' -and $_ -notmatch '\.(spi|spir)$' -and $dataFiles -notcontains $_ -and (Test-Path -LiteralPath (Join-Path $Root $_) -PathType Leaf) } |
    Sort-Object -Unique
$files = foreach ($file in $repoFiles) { [pscustomobject]@{ File = $file; Lines = [IO.File]::ReadAllLines((Join-Path $Root $file)).Count } }
$overFiles = @($files | Where-Object { $_.Lines -gt $Limit } | Sort-Object Lines -Descending)
$overFiles | ForEach-Object { Write-Output ("gate / file {0} {1} lines OVER {2}" -f $_.File, $_.Lines, $Limit) }
Write-Output "gate / $(@($files).Count) files in every language but Spiral (data files exempt: $($dataFiles -join ', ')), $($overFiles.Count) over $Limit lines"
if ($Enforce -and !$files) { throw "gate / git listed no files under $Root, so no file was measured" }
if ($Enforce -and $overFiles.Count) { throw "gate / $($overFiles.Count) file(s) over $Limit lines: $(($overFiles | ForEach-Object File) -join ', ')" }
