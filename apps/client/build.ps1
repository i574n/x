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
{ pwsh -NoProfile -File (Join-Path $XRoot 'scripts/gate.ps1') -Enforce } | Invoke-Block
$spiral = Ensure-SpiralCompiler | Select-Object -Last 1
function Get-XCompatFindings([string] $Path) {
    $report = @(& $spiral.Dotnet $spiral.Compiler --x-compat $Path)
    $code = $LASTEXITCODE
    $report | ForEach-Object { "x/apps/client / $_" } | Write-Host
    if ($code -ne 0) { throw "X-COMPAT x/apps/client / x-compat exited $code for $Path (2: files without a postability profile)" }
    $counted = $report | Select-String -Pattern 'x-compat report: (\d+) finding' | Select-Object -Last 1
    if (!$counted) { throw "X-COMPAT x/apps/client / no x-compat report line for $Path" }
    [int] $counted.Matches[0].Groups[1].Value
}
$findings = Get-XCompatFindings $PSScriptRoot
if ($findings -gt 0) { throw "X-COMPAT x/apps/client / $findings finding(s), see the report above" }
{ cargo build --release } | Invoke-Block -Location $XRoot
$exe = Join-Path (Get-XCargoTargetDir) "release/xc$(_exe)"

{ pwsh -NoProfile -File e2e/e2e.ps1 -Exe $exe -WorkDir (Join-Path (Get-XTargetDir client) 'e2e') } | Invoke-Block

$sources = Get-ChildItem $PSScriptRoot -Recurse -Filter *.spi | Where-Object { $_.FullName -notmatch '[\\/]target[\\/]' }
$postable = foreach ($source in $sources) {
    $preview = & $exe post-thread --dry-run $source.FullName
    $spilled = @(for ($i = 0; $i -lt $preview.Count - 1; $i++) { if ($preview[$i] -match '^c\d+ 1/(\d+)$' -and $Matches[1] -ne '1') { $preview[$i + 1].Trim() } })
    [pscustomobject]@{ File = [IO.Path]::GetRelativePath($PSScriptRoot, $source.FullName).Replace('\', '/'); Posts = [int](($preview | Select-Object -Last 1) -replace '^--- (\d+) posts.*', '$1'); Spilled = $spilled }
}
foreach ($p in $postable | Where-Object { $_.Spilled.Count }) { "x/apps/client / postable: $($p.File) cells over one post: $($p.Spilled -join ' | ')" }
$spilledFiles = @($postable | Where-Object { $_.Spilled.Count }).Count
"x/apps/client / postable: $(($postable | Measure-Object Posts -Sum).Sum) posts for $($postable.Count) files, $spilledFiles with cells over one post"
if ($spilledFiles -gt 0) { throw "POSTABLE x/apps/client / $spilledFiles file(s) with cells over one post, see the lines above" }

if (!$fast) {
    Invoke-SpiralTests $PSScriptRoot @("prelude", "exsss", "paging", "glyphs", "protocol", "splitter", "events", "final_state", "personas", "scenario", "schedule", "world", "invariants", "posts", "reading", "cli", "oauth1", "wire", "transport", "locate/locate", "assemble/assemble", "frames/frames", "simframes/simframes", "jsonl/jsonl", "digest/digest", "view/view", "token/token", "args/args", "checks/checks", "thread/thread", "write/write", "refs/refs", "users/users", "fetch/fetch", "net/net", "api/api", "chain/chain", "cells/cells", "preview/preview", "select/select", "timeline/timeline", "resume/resume", "xc/xc")
}

Write-Output "RUST-OK x/apps/client / $exe"
