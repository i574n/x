param(
    $fast
)
$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot 'common.ps1')
Assert-SpiralBeside
. (Join-Path $SpiralRoot 'scripts/core.ps1')
$fastArgs = $fast ? @('-fast', $fast) : @()

{ pwsh (Join-Path $XRoot 'apps/client/build.ps1') @fastArgs } | Invoke-Block
{ pwsh (Join-Path $XRoot 'apps/sim/build.ps1') @fastArgs } | Invoke-Block
