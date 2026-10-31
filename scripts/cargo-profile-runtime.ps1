param(
    [Parameter(Mandatory)] [string] $BenchDir,
    [int] $Rounds = 5,
    [string[]] $Arms = @('base', 'base-aa', 'thin16', 'nolto16')
)
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'common.ps1')
$e2e = Join-Path $XRoot 'apps/client/e2e/e2e.ps1'
foreach ($arm in $Arms) { if (-not (Test-Path (Join-Path $BenchDir "target-$arm/release/xc.exe"))) { throw "cargo-profile-runtime / no xc.exe for arm $arm under $BenchDir" } }
$rows = Join-Path $BenchDir 'runtime-rows.tsv'
"round`tarm`tseconds`texit" | Set-Content $rows
$seconds = @{}
$failed = 0
foreach ($round in 1..$Rounds) {
    $order = @(0..($Arms.Count - 1) | ForEach-Object { $Arms[($_ + $round) % $Arms.Count] })
    foreach ($arm in $order) {
        $work = Join-Path $BenchDir "e2e-$arm-$round"
        $started = Get-Date
        pwsh -NoProfile -File $e2e -Exe (Join-Path $BenchDir "target-$arm/release/xc.exe") -WorkDir $work *> (Join-Path $BenchDir "e2e-$arm-$round.log")
        $code = $LASTEXITCODE
        $seconds["$round/$arm"] = [math]::Round(((Get-Date) - $started).TotalSeconds, 2)
        "$round`t$arm`t$($seconds["$round/$arm"])`t$code" | Add-Content $rows
        if ($code) { $failed++ }
    }
    "cargo-profile-runtime / round ${round}: " + (($Arms | ForEach-Object { "$_ $($seconds["$round/$_"]) s" }) -join ', ')
}
foreach ($arm in $Arms | Where-Object { $_ -ne 'base' }) {
    $ratios = @(1..$Rounds | ForEach-Object { $seconds["$_/$arm"] / $seconds["$_/base"] } | Sort-Object)
    "cargo-profile-runtime / e2e $arm/base median $([math]::Round($ratios[[int][math]::Floor($ratios.Count / 2)], 3)) over $Rounds rounds"
}
"cargo-profile-runtime / e2e runs that failed: $failed (any failure disqualifies its arm); trust a verdict only if base-aa/base reads within 1.05"
exit ($failed -gt 0 ? 1 : 0)
