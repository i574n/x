param(
    [Parameter(Mandatory)] [string] $BenchDir,
    [string] $Source = (Join-Path $PSScriptRoot '../apps/client/wire.spi'),
    [int] $Rounds = 7,
    [int] $Repeat = 5,
    [string[]] $Arms = @('base', 'base-aa', 'thin16', 'nolto16')
)
$ErrorActionPreference = 'Stop'
$sourcePath = (Resolve-Path $Source).Path
foreach ($arm in $Arms) { if (-not (Test-Path (Join-Path $BenchDir "target-$arm/release/xc.exe"))) { throw "cargo-profile-cpu / no xc.exe for arm $arm under $BenchDir" } }
$rows = Join-Path $BenchDir 'cpu-rows.tsv'
"round`tarm`tcpu_ms`texit" | Set-Content $rows

function Measure-Cpu([string] $Exe) {
    $total = 0.0
    foreach ($i in 1..$Repeat) {
        $info = [Diagnostics.ProcessStartInfo]::new($Exe)
        foreach ($a in 'post-thread', '--dry-run', $sourcePath) { $info.ArgumentList.Add($a) }
        $info.RedirectStandardOutput = $true; $info.RedirectStandardError = $true; $info.UseShellExecute = $false
        $p = [Diagnostics.Process]::Start($info)
        $null = $p.StandardOutput.ReadToEnd(); $null = $p.StandardError.ReadToEnd()
        $p.WaitForExit()
        if ($p.ExitCode) { return [pscustomobject]@{ Ms = -1; Exit = $p.ExitCode } }
        $total += $p.TotalProcessorTime.TotalMilliseconds
    }
    [pscustomobject]@{ Ms = [math]::Round($total, 1); Exit = 0 }
}

$cpu = @{}
$failed = 0
foreach ($round in 1..$Rounds) {
    $order = @(0..($Arms.Count - 1) | ForEach-Object { $Arms[($_ + $round) % $Arms.Count] })
    foreach ($arm in $order) {
        $m = Measure-Cpu (Join-Path $BenchDir "target-$arm/release/xc.exe")
        $cpu["$round/$arm"] = $m.Ms
        "$round`t$arm`t$($m.Ms)`t$($m.Exit)" | Add-Content $rows
        if ($m.Exit) { $failed++ }
    }
    "cargo-profile-cpu / round ${round}: " + (($Arms | ForEach-Object { "$_ $($cpu["$round/$_"]) ms" }) -join ', ')
}
foreach ($arm in $Arms | Where-Object { $_ -ne 'base' }) {
    $ratios = @(1..$Rounds | ForEach-Object { $cpu["$_/$arm"] / $cpu["$_/base"] } | Sort-Object)
    "cargo-profile-cpu / cpu $arm/base median $([math]::Round($ratios[[int][math]::Floor($ratios.Count / 2)], 3)) over $Rounds rounds ($Repeat runs each)"
}
"cargo-profile-cpu / failed runs: $failed; trust a verdict only if base-aa/base reads within 1.05"
exit ($failed -gt 0 ? 1 : 0)
