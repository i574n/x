param(
    $fast,
    [switch] $Accept
)
$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot '../../scripts/common.ps1')
Assert-SpiralBeside
. (Join-Path $SpiralRoot 'scripts/core.ps1')
Set-Location $PSScriptRoot

$bundle = Join-Path $SpiralRoot 'apps/compiler/tmp'
$toolchain = & {
    . (Join-Path $bundle 'scripts/env.ps1')
    [pscustomobject]@{ PackageDir = Get-SpiralPackageDir; Dotnet = Resolve-SpiralDotnet; Dll = Get-SpiralCompilerDll 'single-flight' }
}
$env:SPIRAL_COMPILER_PACKAGE_DIR = $toolchain.PackageDir
$env:SPIRAL_DOTNET = $toolchain.Dotnet
$env:SPIRAL_COMPILER_DLL = $toolchain.Dll
$env:SPIRAL_WORKSPACE_ROOT = (Resolve-Path $bundle).Path
$scoopErlang = Join-Path $HOME 'scoop/apps/erlang/current/bin'
if (Test-Path $scoopErlang) { $env:PATH = "$scoopErlang$([IO.Path]::PathSeparator)$env:PATH" }

{ mix deps.get } | Invoke-Block
{ mix test } | Invoke-Block

$client = Join-Path $XRoot 'apps/client'
$fixtures = Join-Path $client 'e2e'
$fresh = Join-Path (Get-XTargetDir sim) 'worlds'
New-Item -ItemType Directory -Force $fresh | Out-Null
$worlds = @(
    @{ Name = 'sim-small'; Args = @('--spi', (Join-Path $client 'prelude.spi'), '--cells', '3', '--id-base', '3000000', '--user-id', '500', '--username', 'spiralposts') },
    @{ Name = 'sim-stress'; Args = @('--spi', (Join-Path $client 'posts.spi'), '--seed', '7', '--edits', '3', '--personas', 'editor=2+breaker=1', '--id-base', '4000000', '--user-id', '501', '--username', 'spiralstress') },
    @{ Name = 'sim-lost'; Args = @('--spi', (Join-Path $client 'prelude.spi'), '--cells', '3', '--lost', '1', '--base-time', '2026-08-01T08:00:00Z', '--id-base', '5000000', '--user-id', '502', '--username', 'spirallost') },
    @{ Name = 'sim-gap'; Args = @('--spi', (Join-Path $client 'prelude.spi'), '--lost-cells', '1', '--id-base', '6000000', '--user-id', '503', '--username', 'spiralgap') }
)
function Confirm-Fixture([string] $Name, [string] $Dir = $fixtures) {
    $fixture = Join-Path $Dir $Name
    $shown = [IO.Path]::GetRelativePath($XRoot, $fixture).Replace('\', '/')
    if ($Accept) { Copy-Item (Join-Path $fresh $Name) $fixture; Write-Output "xsim / accepted $shown" }
    elseif (!(Test-Path $fixture) -or [IO.File]::ReadAllText((Join-Path $fresh $Name)) -cne [IO.File]::ReadAllText($fixture)) { throw "xsim / $Name differs from $shown; rerun apps/sim/build.ps1 -Accept and review the diff" }
}
foreach ($w in $worlds) {
    $world, $expected = (Join-Path $fresh "$($w.Name).world.json"), (Join-Path $fresh "$($w.Name).expected.json")
    $argv = @('xsim.world') + $w.Args + @('--out', $world, '--expected', $expected)
    & mix @argv
    if ($LASTEXITCODE -ne 0) { throw "mix xsim.world / $($w.Name) / exit $LASTEXITCODE" }
    foreach ($kind in 'world', 'expected') { Confirm-Fixture "$($w.Name).$kind.json" }
}
$argv = @('xsim.frames', '--file', (Join-Path $client 'oauth1.spi'), '--out', (Join-Path $fresh 'thread-oauth1.expected.json'))
& mix @argv
if ($LASTEXITCODE -ne 0) { throw "mix xsim.frames / exit $LASTEXITCODE" }
Confirm-Fixture 'thread-oauth1.expected.json'
$streams = Join-Path $PSScriptRoot 'fixtures'
$argv = @('xsim.events', '--spi', (Join-Path $client 'prelude.spi'), '--seed', '3', '--users', '3', '--edits', '2', '--personas', 'fickle=1+editor=1', '--frames', '--out', (Join-Path $fresh 'prelude.events.jsonl'), '--expected', (Join-Path $fresh 'prelude.final.json'))
& mix @argv
if ($LASTEXITCODE -ne 0) { throw "mix xsim.events / exit $LASTEXITCODE" }
foreach ($name in 'prelude.events.jsonl', 'prelude.final.json') { Confirm-Fixture $name $streams }

$lib = Join-Path $SpiralRoot 'lib/spiral'
$corpus = Get-ChildItem $lib -Recurse -Filter *.spi |
    Where-Object { $_.FullName -notmatch '[\\/](target|bench)[\\/]' -and (Select-String -LiteralPath $_.FullName -Pattern '^test ' -Quiet) } |
    ForEach-Object { $_.FullName }
$list = Join-Path (Get-XTargetDir sim) "corpus-$PID.txt"
[IO.File]::WriteAllText($list, ($corpus -join "`n") + "`n")
{ mix xsim.run --spi-file $list --schedules 2 --users 3 --edits 3 --breaking 1 --churn 2 --frames --duplicates 0.15 --personas lurker=2+fickle=3+editor=2+breaker=2 } | Invoke-Block
Remove-Item $list -ErrorAction Ignore

if (!$fast) {
    $env:SPIRAL_CELLS_COMPILER_PORT = '13950'
    try {
        { mix xsim.run --spi (Join-Path $lib 'math.spi') --cells 3 --users 2 --edits 0 --schedules 1 --executor cells --max-concurrency 2 } | Invoke-Block
    } finally {
        if ($IsWindows) {
            $daemon = Get-NetTCPConnection -LocalPort 13950 -State Listen -ErrorAction Ignore | Select-Object -ExpandProperty OwningProcess -Unique
            foreach ($id in $daemon) { Get-CimInstance Win32_Process -Filter "ParentProcessId=$id" | ForEach-Object { Stop-Process -Id $_.ProcessId -Force -ErrorAction Ignore }; Stop-Process -Id $id -Force -ErrorAction Ignore }
        } elseif (Get-Command fuser -ErrorAction Ignore) {
            fuser -k 13950/tcp 2>$null
        }
        $env:SPIRAL_CELLS_COMPILER_PORT = $null
    }
}
