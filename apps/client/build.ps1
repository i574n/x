param(
    $fast
)
$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot '../../scripts/common.ps1')
Assert-SpiralBeside
. (Join-Path $SpiralRoot 'scripts/core.ps1')
. (Join-Path $SpiralRoot 'lib/spiral/lib.ps1')
Set-Location $PSScriptRoot

foreach ($manifest in Get-ChildItem $PSScriptRoot -Recurse -Depth 1 -Filter Cargo.toml) {
    $text = [IO.File]::ReadAllText($manifest.FullName)
    if ($text -match '(?m)^\[package\.metadata\.spiral\]\s*\r?\nentry = "([^"]+)"\s*\r?\noutput = "([^"]+)"') {
        $crate = Split-Path $manifest.DirectoryName -Leaf
        $entry = Join-Path $manifest.DirectoryName $Matches[1]
        $output = Join-Path $manifest.DirectoryName $Matches[2]
        if (!(BuildSpiral $entry $output "x/apps/client/$crate")) { throw "RUST-FAILED x/apps/client/$crate / compile" }
    }
}
{ pwsh -NoProfile -File (Join-Path $XRoot 'scripts/gate.ps1') } | Invoke-Block
$spiral = Ensure-SpiralCompiler | Select-Object -Last 1
& $spiral.Dotnet $spiral.Compiler --x-compat $PSScriptRoot | ForEach-Object { "x/apps/client / $_" }
{ cargo build --release } | Invoke-Block -Location $XRoot
$exe = Join-Path (Get-XCargoTargetDir) "release/xc$(_exe)"

{ pwsh -NoProfile -File e2e/e2e.ps1 -Exe $exe -WorkDir (Join-Path (Get-XTargetDir client) 'e2e') } | Invoke-Block

if (!$fast) {
    Invoke-SpiralTests $PSScriptRoot @("prelude", "posts", "cli", "oauth1", "wire", "transport")
}

Write-Output "RUST-OK x/apps/client / $exe"
