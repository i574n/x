param([Parameter(ValueFromRemainingArguments)] [string[]] $ShellArgs = @())
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'common.ps1')
Assert-SpiralBeside
. (Join-Path $SpiralRoot 'scripts/core.ps1')
$bundle = Join-Path $SpiralRoot 'apps/compiler/tmp'
$toolchain = & {
    . (Join-Path $SpiralRoot 'apps/compiler/scripts/env.ps1')
    [pscustomobject]@{ PackageDir = Get-SpiralPackageDir; Dotnet = Resolve-SpiralDotnet; Dll = Get-SpiralCompilerDll 'single-flight' }
}
$env:SPIRAL_COMPILER_PACKAGE_DIR = $toolchain.PackageDir
$env:SPIRAL_DOTNET = $toolchain.Dotnet
$env:SPIRAL_COMPILER_DLL = $toolchain.Dll
$env:SPIRAL_WORKSPACE_ROOT = (Resolve-Path $bundle).Path
$scoopErlang = Join-Path $HOME 'scoop/apps/erlang/current/bin'
if (Test-Path $scoopErlang) { $env:PATH = "$scoopErlang$([IO.Path]::PathSeparator)$env:PATH" }
. (Join-Path $SpiralRoot 'lib/spiral/lib.ps1')

$package = Get-XTargetDir 'sim-shell'
$entry = Join-Path $XRoot 'apps/sim/spi/xsim_shell_entry.spi'
@'
name = "xsim_shell"
version = "0.1.0"
target = "erlang"

[dependencies]
gleam_stdlib = ">= 1.0.5 and < 2.0.0"
gleam_time = ">= 1.0.0 and < 2.0.0"
gleam_erlang = ">= 1.3.0 and < 2.0.0"
gleam_otp = ">= 1.3.0 and < 2.0.0"
envoy = ">= 1.2.0 and < 2.0.0"
gary = ">= 1.1.0 and < 2.0.0"
gtempo = ">= 7.4.0 and < 8.0.0"
'@ | Set-Content (Join-Path $package 'gleam.toml')
if (!(BuildSpiral $entry (Join-Path $package 'src/xsim_shell.gleam') 'x/apps/sim/shell' -Backend Gleam)) { throw "GLEAM-FAILED x/apps/sim/shell / compile" }
Push-Location $package
try { gleam run --target erlang -- @ShellArgs }
finally { Pop-Location }
exit $LASTEXITCODE
