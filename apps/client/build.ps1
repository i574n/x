param(
    $fast
)
$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot '../../scripts/common.ps1')
Assert-SpiralBeside
. (Join-Path $SpiralRoot 'scripts/core.ps1')
. (Join-Path $SpiralRoot 'lib/spiral/lib.ps1')
Set-Location $PSScriptRoot

if (!(BuildSpiral "client.spi" "client.rs" "x/apps/client")) {
    throw "RUST-FAILED x/apps/client / compile"
}
{ cargo build --release --package client } | Invoke-Block -Location $XRoot
$exe = Join-Path (Get-XCargoTargetDir) "release/xc$(_exe)"

{ pwsh -NoProfile -File e2e/e2e.ps1 -Exe $exe -WorkDir (Join-Path (Get-XTargetDir client) 'e2e') } | Invoke-Block

if (!$fast) {
    Invoke-SpiralTests $PSScriptRoot @("prelude", "posts", "cli", "oauth1", "x_api")
}

Write-Output "RUST-OK x/apps/client / $exe"
