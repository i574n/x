param(
    [ValidateSet('all', 'client', 'sim', 'regen')] [string] $Part = 'all',
    [switch] $Accept,
    [string] $Out,
    [string[]] $Notebooks = @(),
    [int] $ParallelNotebooks = 0,
    [int] $BenchRounds = 0
)
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'common.ps1')
Assert-SpiralBeside
. (Join-Path $SpiralRoot 'scripts/core.ps1')
$client = Join-Path $XRoot 'apps/client'
$sim = Join-Path $XRoot 'apps/sim'
if ($env:SPIRAL_COMPILER_DLL) { "x verify / compiler $((Get-FileHash $env:SPIRAL_COMPILER_DLL).Hash.Substring(0, 12)) (SPIRAL_COMPILER_DLL)" }

function Get-NotebookList([string] $BuildScript) {
    $text = [IO.File]::ReadAllText($BuildScript)
    $at = $text.IndexOf('Invoke-SpiralTests')
    if ($at -lt 0) { throw "x verify / no Invoke-SpiralTests in $BuildScript" }
    $open = $text.IndexOf('@(', $at)
    $close = $text.IndexOf(')', $open)
    [regex]::Matches($text.Substring($open, $close - $open), '"([^"]+)"') | ForEach-Object { $_.Groups[1].Value }
}

function Invoke-ParallelNotebooks([string] $AppDir, [string[]] $Modules, [int] $Throttle) {
    $here, $spiral, $started = $PSScriptRoot, $SpiralRoot, (Get-Date)
    $lines = @($Modules | ForEach-Object -ThrottleLimit $Throttle -Parallel {
        $run = ". '$using:here/common.ps1'; . '$using:spiral/scripts/core.ps1'; . '$using:spiral/lib/spiral/lib.ps1'; Invoke-SpiralTests '$using:AppDir' @('$_')"
        pwsh -NoProfile -Command $run 2>&1 | ForEach-Object { "$_" }
    })
    $seconds = [int]((Get-Date) - $started).TotalSeconds
    Write-Host "x verify / $($Modules.Count) notebooks in $seconds s at parallelism $Throttle"
    $totals = @($lines | Select-String -Pattern '^spiral-tests total ' | ForEach-Object { $_.Line })
    if ($totals.Count -lt $Modules.Count) { throw "x verify / only $($totals.Count) of $($Modules.Count) notebooks printed a spiral-tests total" }
    Assert-SpiralTotals $lines
    [pscustomobject]@{ Seconds = $seconds; Totals = ($totals | Sort-Object) -join "`n" }
}

function Invoke-NotebookBench([string[]] $Modules, [int] $Parallel, [int] $Rounds) {
    $reference, $ratios = $null, @()
    foreach ($round in 1..$Rounds) {
        $arms = if ($round % 2) { @(1, $Parallel) } else { @($Parallel, 1) }
        $seconds = @{}
        foreach ($throttle in $arms) {
            $cpu = [int](Get-CimInstance Win32_Processor | Measure-Object LoadPercentage -Average).Average
            $run = Invoke-ParallelNotebooks $client $Modules $throttle
            if ($null -eq $reference) { $reference = $run.Totals }
            elseif ($run.Totals -ne $reference) { throw "x verify / bench round $round at parallelism ${throttle}: totals differ from round 1's sequential arm" }
            $seconds[$throttle] = $run.Seconds
            "x verify / bench round $round / parallelism $throttle / $($run.Seconds) s / cpu $cpu% at start"
        }
        $ratios += $seconds[$Parallel] / [double] $seconds[1]
        "x verify / bench round $round / ratio $([math]::Round($ratios[-1], 3))"
    }
    $median = ($ratios | Sort-Object)[[int][math]::Floor($ratios.Count / 2)]
    "x verify / bench median ratio $([math]::Round($median, 3)) over $Rounds rounds at parallelism $Parallel (adopt if <= 0.6)"
}

function Invoke-Step([string] $Label, [scriptblock] $Step) {
    & $Step | Out-Host
    $code = $LASTEXITCODE
    Write-Host "x verify / $Label exit $code"
    $code
}

if ($Part -eq 'regen') {
    if (!$Out) { throw 'x verify / -Part regen needs -Out for the regenerated .rs' }
    . (Join-Path $SpiralRoot 'lib/spiral/lib.ps1')
    New-Item -ItemType Directory -Force $Out | Out-Null
    $failed = 0
    foreach ($manifest in Get-ChildItem $client -Recurse -Depth 1 -Filter Cargo.toml) {
        $text = [IO.File]::ReadAllText($manifest.FullName)
        if ($text -notmatch '(?m)^\[package\.metadata\.spiral\]\s*\r?\nentry = "([^"]+)"\s*\r?\noutput = "([^"]+)"') { continue }
        $crate = Split-Path $manifest.DirectoryName -Leaf
        $target = Join-Path $Out "$crate.rs"
        if (BuildSpiral (Join-Path $manifest.DirectoryName $Matches[1]) $target "x/apps/client/$crate") { "x verify / regen $crate $(@(Get-Content $target).Count)" }
        else { $failed++; "x verify / regen $crate RUST-FAILED" }
    }
    "x verify / regen failed: $failed"
    exit $failed
}

if ($Notebooks) {
    $modules = ($Notebooks | ForEach-Object { "'$_'" }) -join ', '
    $run = ". '$PSScriptRoot/common.ps1'; . '$SpiralRoot/scripts/core.ps1'; . '$SpiralRoot/lib/spiral/lib.ps1'; Invoke-SpiralTests '$client' @($modules)"
    $lines = @(pwsh -NoProfile -Command $run 2>&1 | ForEach-Object { "$_" })
    $lines | Where-Object { $_ -match '^spiral-tests |ETY-|FatalError' }
    Assert-SpiralTotals $lines
    return
}

if ($BenchRounds -gt 0) {
    if ($ParallelNotebooks -lt 2) { throw 'x verify / -BenchRounds needs -ParallelNotebooks 2 or more' }
    $env:SPIRAL_CELLS_MEMO = '0'
    Invoke-NotebookBench (Get-NotebookList (Join-Path $client 'build.ps1')) $ParallelNotebooks $BenchRounds
    exit 0
}

$withClient = $Part -ne 'sim'
$withSim = $Part -ne 'client'
if (!$withClient -and !$withSim) { throw "x verify / part '$Part' selects nothing to build" }
if ($withSim) {
    Push-Location $sim
    mix deps.get *> $null
    Pop-Location
}
if ($Accept -and $withSim) { $null = Invoke-Step 'sim accept' { pwsh -NoProfile -File (Join-Path $sim 'build.ps1') -Accept -fast 1 } }
if ($Accept -and $withClient) {
    $null = Invoke-Step 'client build before accepting' { pwsh -NoProfile -File (Join-Path $client 'build.ps1') -fast 1 }
    $exe = Join-Path (Get-XCargoTargetDir) "release/xc$(_exe)"
    if (!(Test-Path $exe)) { throw "x verify / no xc binary at $exe to accept the e2e tutorial with" }
    $null = Invoke-Step 'e2e accept' { pwsh -NoProfile -File (Join-Path $client 'e2e/e2e.ps1') -Exe $exe -WorkDir (Join-Path (Get-XTargetDir client) 'e2e-accept') -Accept }
}
$clientFast = if ($ParallelNotebooks -gt 0) { @('-fast', '1') } else { @() }
$clientCode = if ($withClient) { Invoke-Step 'client build' { pwsh -NoProfile -File (Join-Path $client 'build.ps1') @clientFast } } else { 0 }
if ($withClient -and $ParallelNotebooks -gt 0 -and $clientCode -eq 0) {
    $null = Invoke-ParallelNotebooks $client (Get-NotebookList (Join-Path $client 'build.ps1')) $ParallelNotebooks
}
$simCode = if ($withSim) { Invoke-Step 'sim build' { pwsh -NoProfile -File (Join-Path $sim 'build.ps1') } } else { 0 }
if ($Out) {
    New-Item -ItemType Directory -Force $Out | Out-Null
    robocopy (Join-Path $XRoot 'apps') (Join-Path $Out 'apps') *.rs *.gleam *.json *.jsonl *.txt README.md /S /XD target node_modules deps _build /NFL /NDL /NJH /NJS /NP | Out-Null
    Copy-Item (Join-Path $XRoot 'Cargo.lock') $Out
    "x verify / outputs saved to ${Out}: $(@(Get-ChildItem $Out -Recurse -File).Count) files"
}
exit [Math]::Max($clientCode, $simCode)
