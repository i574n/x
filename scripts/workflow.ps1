param([switch] $Xc)
$ErrorActionPreference = "Stop"

if ($Xc) {
    Push-Location (Join-Path $PSScriptRoot '..')
    try {
        cargo build --release --package xc
        if ($LASTEXITCODE -ne 0) { throw "workflow.ps1 / xc build failed (exit code $LASTEXITCODE)" }
        $help = & (Join-Path 'target' 'release' 'xc') --help
        if ($LASTEXITCODE -ne 0 -or !($help -match '^usage: xc timeline')) { throw "workflow.ps1 / xc --help failed: $help" }
    }
    finally { Pop-Location }
    return
}

pwsh (Join-Path $PSScriptRoot 'init.ps1')
if ($LASTEXITCODE -ne 0) { throw "workflow.ps1 / init failed (exit code $LASTEXITCODE)" }
pwsh (Join-Path $PSScriptRoot 'build.ps1')
if ($LASTEXITCODE -ne 0) { throw "workflow.ps1 / build failed (exit code $LASTEXITCODE)" }
