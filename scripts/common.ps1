$XRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$SpiralRoot = [IO.Path]::GetFullPath((Join-Path $XRoot '../spiral'))

function Assert-SpiralBeside {
    if (!(Test-Path (Join-Path $SpiralRoot 'lib/spiral/lib.ps1'))) {
        throw "x builds against spiral cloned beside it, expected at ${SpiralRoot}: run pwsh scripts/init.ps1"
    }
}

function Get-XTargetDir([Parameter(Mandatory)] [string] $Name) {
    $dir = Join-Path $XRoot "target/build/$Name"
    New-Item -ItemType Directory -Force $dir | Out-Null
    $dir
}

function Get-XCargoTargetDir {
    (cargo metadata --format-version 1 --no-deps --manifest-path (Join-Path $XRoot 'Cargo.toml') | ConvertFrom-Json).target_directory
}

function Invoke-SpiralTests([Parameter(Mandatory)] [string] $AppDir, [Parameter(Mandatory)] [string[]] $Modules) {
    $notebooks = Join-Path (Get-XTargetDir (Split-Path $AppDir -Leaf)) 'notebooks'
    New-Item -ItemType Directory -Force $notebooks | Out-Null
    $saved = $env:SPIRAL_KINO_COMPILER, $env:SPIRAL_KINO_WARM
    $env:SPIRAL_KINO_COMPILER, $env:SPIRAL_KINO_WARM = 'process', '0'
    try {
        foreach ($module in $Modules) {
            $runner = Join-Path $SpiralRoot 'apps/kino/spi/run_notebook.ps1'
            { pwsh -NoProfile -File $runner --path (Join-Path $AppDir "$module.spi") --output-path (Join-Path $notebooks "$module.spi.ipynb") --no-html } | Invoke-Block
        }
    } finally {
        $env:SPIRAL_KINO_COMPILER, $env:SPIRAL_KINO_WARM = $saved
    }
}
