param(
    [Parameter(Mandatory)] [string] $Label,
    [ValidateSet('verify', 'sim')] [string] $Mode = 'verify',
    [string] $MirrorName = $(if ($Mode -eq 'verify') { 'xqueue1' } else { 'xqueue3' }),
    [string] $Core,
    [int] $TimeoutMs = $(if ($Mode -eq 'verify') { 28800000 } else { 14400000 }),
    [ValidateSet('all', 'client', 'sim')] [string] $Part = 'all',
    [switch] $NoAccept
)
$ErrorActionPreference = 'Stop'
$org = Join-Path $PSScriptRoot '../../i574n.github/scripts'
$nodeLocal = "$(pwsh -NoProfile -File (Join-Path $org 'remote.ps1') node run '$env:LOCALAPPDATA' 2>&1 | Select-Object -Last 1)".Trim()
if ($nodeLocal -notmatch '^[A-Za-z]:\\') { throw "x node-run / could not read the node's LOCALAPPDATA, got: $nodeLocal" }
$dll = Join-Path $nodeLocal 'spiral-bin\bin\single-flight\SpiralCompiler\Release\net11.0\SpiralCompiler.dll'
$freed = @'
foreach ($d in '{mirror}\spiral\target', '{mirror}\x\target') {
    if ((Test-Path $d) -and -not @(Get-ChildItem $d -Recurse -Directory -Force -ErrorAction SilentlyContinue | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint }).Count) { Remove-Item -LiteralPath $d -Recurse -Force -ErrorAction SilentlyContinue; "freed build output $d" }
}
'@
$land = @()
if ($Mode -eq 'verify') {
    $machine = (Get-Content ~/.config/remote-machines.json -Raw | ConvertFrom-Json -AsHashtable)['laptop']
    $out = Join-Path $machine.stage (($Label -replace '^x-verify', 'xv') + '-out')
    $land = @('-LandRepos', 'x,spiral')
    $command = @'
. '{mirror}\x\scripts\common.ps1'
foreach ($tree in '{mirror}\x\apps\client', '{mirror}\x\apps\sim\spi') {
    try { Assert-CellBudget $tree $tree 6>&1 | Select-Object -Last 3 } catch { "$_"; 'cell-budget RED or unattested, verify not started'; exit 1 }
}
pwsh -NoProfile -File {mirror}\x\scripts\verify.ps1 -Part PART ACCEPT -Out OUTDIR
$code = $LASTEXITCODE
FREED
exit $code
'@.Replace('OUTDIR', $out).Replace('PART', $Part).Replace('ACCEPT', $(if ($NoAccept) { '' } else { '-Accept' }))
} else {
    $command = @'
$x = '{mirror}\x'
pwsh -NoProfile -File "$x\apps\sim\build.ps1" -Ladder '1:1:1' *> '{mirror}\e2e-sim-build.log'
'x node-run / sim build exit ' + $LASTEXITCODE
Get-Content '{mirror}\e2e-sim-build.log' | Select-String -Pattern '^x_\w+\{' | ForEach-Object { $_.Line }
if ($LASTEXITCODE) { Get-Content '{mirror}\e2e-sim-build.log' | Select-String -Pattern 'Error|error' -Context 0,3 | Select-Object -First 6; exit 1 }
pwsh -NoProfile -File "$x\apps\client\build.ps1" -fast 1 *> '{mirror}\e2e-client-build.log'
'x node-run / client build exit ' + $LASTEXITCODE
if ($LASTEXITCODE) { Get-Content '{mirror}\e2e-client-build.log' -Tail 12; exit 1 }
. "$x\scripts\common.ps1"
$exe = Join-Path (Get-XCargoTargetDir) 'release/xc.exe'
$o = @(pwsh -NoProfile -File "$x\apps\client\e2e\e2e.ps1" -Exe $exe -WorkDir '{mirror}\e2e-sim' 2>&1 | ForEach-Object { "$_" })
$code = $LASTEXITCODE
$o | Where-Object { $_ -match 'x e2e / (\d+ requests|FAILED)|RUST-OK|RUST-FAILED|did not|exited before|Exception' } | Select-Object -Last 25
$o | Where-Object { $_ -match '^xsim serve / answered ' } | ForEach-Object { ($_ -replace '^xsim serve / answered ', '') -replace '/2/users/\d+/', '/2/users/<id>/' -replace '/2/tweets/\d+$', '/2/tweets/<id>' } | Group-Object | ForEach-Object { '  ' + $_.Count + ' x ' + $_.Name }
'x node-run / sim exit ' + $code
FREED
exit $code
'@
}
$command = $command.Replace('FREED', $freed)
$coreCheck = if ($Core) { @('-RequireCore', $Core) } else { @() }
foreach ($try in 1..4) {
    $o = @(pwsh -NoProfile -File (Join-Path $org 'node-proof.ps1') -MirrorName $MirrorName -Label $Label @coreCheck -CompilerDll $dll -TimeoutMs $TimeoutMs @land -Command $command 2>&1 | ForEach-Object { "$_" })
    $o | Where-Object { $_ -match 'REMOTE-SYNC-OK|manifest|job start' }
    if (($o -join ' ') -match 'job start ok') { break }
    "try $try failed:"; $o | Select-Object -Last 8 | ForEach-Object { "  $_" }
}
if ($Mode -eq 'verify') { "x node-run / outputs land from $out with: node-proof.ps1 -Land $Label -From '$out' -Repo x [-Apply]" }
