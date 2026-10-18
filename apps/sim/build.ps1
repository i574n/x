param(
    $fast,
    [switch] $Bless
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
    @{ Name = 'sim-lost'; Args = @('--spi', (Join-Path $client 'prelude.spi'), '--cells', '3', '--lost', '1', '--id-base', '5000000', '--user-id', '502', '--username', 'spirallost') }
)
foreach ($w in $worlds) {
    $world, $expected = (Join-Path $fresh "$($w.Name).world.json"), (Join-Path $fresh "$($w.Name).expected.json")
    $argv = @('xsim.world') + $w.Args + @('--out', $world, '--expected', $expected)
    & mix @argv
    if ($LASTEXITCODE -ne 0) { throw "mix xsim.world / $($w.Name) / exit $LASTEXITCODE" }
    foreach ($kind in 'world', 'expected') {
        $name = "$($w.Name).$kind.json"
        $fixture = Join-Path $fixtures $name
        if ($Bless) { Copy-Item (Join-Path $fresh $name) $fixture; Write-Output "xsim.world / blessed apps/client/e2e/$name" }
        elseif (!(Test-Path $fixture) -or [IO.File]::ReadAllText((Join-Path $fresh $name)) -cne [IO.File]::ReadAllText($fixture)) { throw "xsim.world / $name differs from apps/client/e2e/$name; rerun apps/sim/build.ps1 -Bless and review the diff" }
    }
}

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
