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

function Get-XCiZigPin {
    $ci = [IO.File]::ReadAllText((Join-Path $XRoot '.github/workflows/ci.yml'))
    if ($ci -match 'setup-zig@\S+\s+with:(?:\s+(?!version:)[\w-]+:[^\r\n]*)*\s+version:\s*"?([^"\s]+)"?') { $Matches[1] }
}

function Invoke-SpiralTests([Parameter(Mandatory)] [string] $AppDir, [Parameter(Mandatory)] [string[]] $Modules) {
    $notebooks = Join-Path (Get-XTargetDir (Split-Path $AppDir -Leaf)) 'notebooks'
    New-Item -ItemType Directory -Force $notebooks | Out-Null
    $saved = $env:SPIRAL_CELLS_COMPILER, $env:SPIRAL_CELLS_WARM
    $env:SPIRAL_CELLS_COMPILER, $env:SPIRAL_CELLS_WARM = 'process', '0'
    $zig = $env:SPIRAL_ZIG ? $env:SPIRAL_ZIG : (Get-Command zig -CommandType Application -ErrorAction Ignore | Select-Object -First 1).Source
    $zigVersion = $zig ? (& $zig version) : 'none'
    $zigPin = Get-XCiZigPin
    Write-Host "x/scripts/common.ps1 / Cells zig $zigVersion"
    if ($zigPin -and $zigVersion -ne $zigPin) { Write-Host "x/scripts/common.ps1 / Cells zig $zigVersion is not ci.yml's ${zigPin}: set SPIRAL_ZIG to a $zigPin zig to test what CI runs" }
    try {
        foreach ($module in $Modules) {
            $runner = Join-Path $SpiralRoot 'apps/cells/spi/run_notebook.ps1'
            { pwsh -NoProfile -File $runner --path (Join-Path $AppDir "$module.spi") --output-path (Join-Path $notebooks "$module.spi.ipynb") --no-html } | Invoke-Block
        }
    } finally {
        $env:SPIRAL_CELLS_COMPILER, $env:SPIRAL_CELLS_WARM = $saved
    }
}
