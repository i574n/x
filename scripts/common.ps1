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

function Assert-SpiralTotals([Parameter(Mandatory)] [AllowEmptyCollection()] [AllowEmptyString()] [string[]] $Lines) {
    $totals = @($Lines | Select-String -Pattern '^spiral-tests total (\{.*\})$' | ForEach-Object { $_.Matches[0].Groups[1].Value | ConvertFrom-Json })
    if (!$totals) { throw 'x/scripts/common.ps1 / no spiral-tests total line: the notebooks did not run' }
    foreach ($t in $totals) {
        if ($t.failed -ne 0 -or $t.unsupported -ne 0 -or $t.not_run -ne 0 -or $t.passed -ne $t.executed -or ($t.discovered -gt 0 -and $t.executed -eq 0)) {
            throw "x/scripts/common.ps1 / spiral-tests total failed=$($t.failed) passed=$($t.passed) executed=$($t.executed) unsupported=$($t.unsupported) not_run=$($t.not_run)"
        }
    }
    "x/scripts/common.ps1 / $($totals.Count) notebook total(s): every executed test passed"
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
    $failed = [Collections.Generic.List[string]]::new()
    try {
        foreach ($module in $Modules) {
            $runner = Join-Path $SpiralRoot 'apps/cells/spi/run_notebook.ps1'
            pwsh -NoProfile -File $runner --path (Join-Path $AppDir "$module.spi") --output-path (Join-Path $notebooks "$module.spi.ipynb") --no-html
            $passed = $LASTEXITCODE -eq 0
            if (!$passed) { $failed.Add($module) }
            Write-Host "x/scripts/common.ps1 / notebook $module $(if ($passed) { 'passed' } else { 'FAILED' })"
        }
    } finally {
        $env:SPIRAL_CELLS_COMPILER, $env:SPIRAL_CELLS_WARM = $saved
    }
    if ($failed.Count) { throw "x/scripts/common.ps1 / $($failed.Count) of $($Modules.Count) notebooks failed: $($failed -join ', ')" }
    Write-Host "x/scripts/common.ps1 / all $($Modules.Count) notebooks passed"
}
