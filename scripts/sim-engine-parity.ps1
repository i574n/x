param([switch] $ExpectFail, [Parameter(ValueFromRemainingArguments)] [string[]] $RunArgs = @())
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'common.ps1')
$sim = Join-Path $XRoot 'apps/sim'
$scoopErlang = Join-Path $HOME 'scoop/apps/erlang/current/bin'
if (Test-Path $scoopErlang) { $env:PATH = "$scoopErlang$([IO.Path]::PathSeparator)$env:PATH" }

function Get-XsimLines([string[]] $Prefix) {
    Push-Location $sim
    try { $out = @(mix xsim.run @Prefix @RunArgs 2>&1 | ForEach-Object { "$_" }) }
    finally { Pop-Location }
    [pscustomobject]@{ Exit = $LASTEXITCODE; Lines = @($out | Where-Object { $_ -match '^(XSIM |  memo |  daemon )' }); Tail = @($out | Where-Object { $_ -notmatch 'os_mon|^\s*$' } | Select-Object -Last 8) }
}

function ConvertTo-Fields([string] $Line) {
    $fields = [ordered]@{}
    foreach ($pair in ($Line.Trim() -split ' ' | Where-Object { $_.Contains('=') })) { $k, $v = $pair -split '=', 2; $fields[$k] = $v }
    $fields
}

$a = Get-XsimLines @()
$b = Get-XsimLines @()
$s = Get-XsimLines @('--engine', 'spiral')
"sim-engine-parity / exits elixir $($a.Exit) / elixir $($b.Exit) / spiral $($s.Exit); lines $($a.Lines.Count) / $($b.Lines.Count) / $($s.Lines.Count)"
$wanted = $ExpectFail ? 1 : 0
if (@(@($a.Exit, $b.Exit, $s.Exit) | Where-Object { $_ -ne $wanted }).Count -gt 0) {
    foreach ($run in @(@('elixir', $a), @('elixir', $b), @('spiral', $s)) | Where-Object { $_[1].Exit -ne $wanted }) { "sim-engine-parity / $($run[0]) exited $($run[1].Exit); its last lines:"; $run[1].Tail | ForEach-Object { "  $_" } }
    "sim-engine-parity / VOID: every engine had to exit $wanted, so nothing was compared"
    exit 2
}
if ($a.Lines.Count -eq 0) { "sim-engine-parity / VOID: no XSIM lines, so nothing was compared"; exit 2 }
if ($a.Lines.Count -ne $b.Lines.Count) { throw "sim-engine-parity / the two elixir runs printed different line counts; the A/A itself is unstable" }
if ($s.Lines.Count -ne $a.Lines.Count) { "sim-engine-parity / DIFFERENT line count"; $s.Lines | Select-Object -First 3; exit 1 }
$unstable = [Collections.Generic.HashSet[string]]::new()
for ($i = 0; $i -lt $a.Lines.Count; $i++) {
    $fa, $fb = (ConvertTo-Fields $a.Lines[$i]), (ConvertTo-Fields $b.Lines[$i])
    foreach ($k in $fa.Keys) { if ($fa[$k] -ne $fb[$k]) { $null = $unstable.Add($k) } }
}
$differences = 0
for ($i = 0; $i -lt $a.Lines.Count; $i++) {
    $fa, $fs = (ConvertTo-Fields $a.Lines[$i]), (ConvertTo-Fields $s.Lines[$i])
    foreach ($k in $fa.Keys) {
        if ($unstable.Contains($k) -or $fa[$k] -eq $fs[$k]) { continue }
        $differences++
        "sim-engine-parity / line $i field $k elixir=$($fa[$k]) spiral=$($fs[$k])"
    }
    foreach ($k in $fs.Keys) { if (-not $fa.Contains($k)) { $differences++; "sim-engine-parity / line $i field $k only in spiral" } }
}
"sim-engine-parity / excluded by the A/A (differ between the two elixir runs): $(@($unstable) -join ', ')"
"sim-engine-parity / $differences difference(s) on stable fields"
exit ($differences -gt 0 ? 1 : 0)
