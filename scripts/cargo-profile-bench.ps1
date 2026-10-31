param(
    [int] $Rounds = 5,
    [string] $Touch = 'apps/client/xc/xc.rs',
    [string] $Out = (Join-Path ([IO.Path]::GetTempPath()) 'x-cargo-profile-bench'),
    [string[]] $Arms = @('base', 'base-aa', 'thin16', 'thin16-lld', 'nolto16')
)
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'common.ps1')
$settings = @{
    'base' = @()
    'base-aa' = @()
    'thin16' = @('--config', 'profile.release.lto="thin"', '--config', 'profile.release.codegen-units=16')
    'thin16-lld' = @('--config', 'profile.release.lto="thin"', '--config', 'profile.release.codegen-units=16', '--config', 'target.x86_64-pc-windows-msvc.linker="rust-lld"')
    'nolto16' = @('--config', 'profile.release.lto=false', '--config', 'profile.release.codegen-units=16')
}
foreach ($arm in $Arms) { if (-not $settings.ContainsKey($arm)) { throw "cargo-profile-bench / unknown arm $arm" } }
$touched = Join-Path $XRoot $Touch
if (-not (Test-Path -LiteralPath $touched)) { throw "cargo-profile-bench / no $Touch to touch" }
New-Item -ItemType Directory -Force $Out | Out-Null
$rows = Join-Path $Out 'rows.tsv'
"round`tarm`tphase`tseconds`texit`tcpu_at_start" | Set-Content $rows

function Invoke-Arm([string] $Arm, [string] $Phase, [int] $Round) {
    $target = Join-Path $Out "target-$Arm"
    $cpu = [int](Get-CimInstance Win32_Processor | Measure-Object LoadPercentage -Average).Average
    $started = Get-Date
    Push-Location $XRoot
    try { cargo build --release --target-dir $target @($settings[$Arm]) *> (Join-Path $Out "$Arm-$Phase-$Round.log") }
    finally { Pop-Location }
    $code = $LASTEXITCODE
    $seconds = [math]::Round(((Get-Date) - $started).TotalSeconds, 2)
    "$Round`t$Arm`t$Phase`t$seconds`t$code`t$cpu" | Add-Content $rows
    if ($code) { throw "cargo-profile-bench / $Arm $Phase round $Round exit $code (log in $Out)" }
    $seconds
}

foreach ($arm in $Arms) { $null = Invoke-Arm $arm 'cold' 0; "cargo-profile-bench / cold $arm done" }
$touchSeconds = @{}
foreach ($round in 1..$Rounds) {
    $order = @(0..($Arms.Count - 1) | ForEach-Object { $Arms[($_ + $round) % $Arms.Count] })
    foreach ($arm in $order) {
        (Get-Item -LiteralPath $touched).LastWriteTime = Get-Date
        $touchSeconds["$round/$arm"] = Invoke-Arm $arm 'touch' $round
    }
    "cargo-profile-bench / round ${round}: " + (($Arms | ForEach-Object { "$_ $($touchSeconds["$round/$_"]) s" }) -join ', ')
}
foreach ($arm in $Arms | Where-Object { $_ -ne 'base' }) {
    $ratios = @(1..$Rounds | ForEach-Object { $touchSeconds["$_/$arm"] / $touchSeconds["$_/base"] } | Sort-Object)
    $median = $ratios[[int][math]::Floor($ratios.Count / 2)]
    "cargo-profile-bench / touch $arm/base median $([math]::Round($median, 3)) over $Rounds rounds"
}
"cargo-profile-bench / rows in $rows; trust a verdict only if base-aa/base reads within 1.05"
