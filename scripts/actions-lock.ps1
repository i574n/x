param([string] $Root = (Join-Path $PSScriptRoot '..'))
$ErrorActionPreference = "Stop"

$workflows = Join-Path $Root '.github/workflows'
$lockPath = Join-Path $workflows 'actions.lock'
if (!(Test-Path $lockPath)) { Write-Output "actions-lock / no actions.lock, nothing to check"; return }

$locked = @{}
$current = $null
foreach ($line in Get-Content $lockPath) {
    if ($line -match "^\S") { $current = $null; $section = $line.TrimEnd(':') }
    if ($section -ne 'workflows') { continue }
    if ($line -match "^\s{4}'([^']+)':\s*$") { $current = $Matches[1]; $locked[$current] = [Collections.Generic.List[string]]::new() }
    elseif ($current -and $line -match "^\s+-\s*'([^']+)'") { $locked[$current].Add($Matches[1]) }
}

$checks = foreach ($file in Get-ChildItem $workflows -Filter *.yml) {
    $key = ".github/workflows/$($file.Name)"
    $used = @(Select-String -Path $file.FullName -Pattern '^\s*-?\s*uses:\s*([^\s#]+)' | ForEach-Object { $_.Matches[0].Groups[1].Value.Trim("'", '"') } |
        Where-Object { $_ -notmatch '^(\./|docker://)' } | Sort-Object -Unique)
    $have = @(if ($locked.ContainsKey($key)) { $locked[$key] | Sort-Object -Unique })
    $missing = @($used | Where-Object { $have -notcontains $_ })
    $stale = @($have | Where-Object { $used -notcontains $_ })
    [pscustomobject]@{ Key = $key; Used = $used.Count; Problem = if ($missing.Count -or $stale.Count) { "$key missing [$($missing -join ', ')] stale [$($stale -join ', ')]" } }
}
if (!$checks) { throw "actions-lock / no workflow under $workflows, so nothing was checked" }
$checks | Where-Object { !$_.Problem } | ForEach-Object { Write-Output "actions-lock / $($_.Key) / $($_.Used) actions locked" }
$problems = @($checks | Where-Object Problem | ForEach-Object Problem)
if ($problems.Count) { throw "actions-lock / $($problems -join '; '); run gh actions-lock and commit the lock with the workflow change, or GitHub fails the run at startup" }
