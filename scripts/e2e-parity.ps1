param([Parameter(Mandatory)] [string] $Exe, [string] $WorkDir = (Join-Path ([IO.Path]::GetTempPath()) "xc-e2e-parity-$PID"))
$ErrorActionPreference = 'Stop'
$e2e = Join-Path $PSScriptRoot '../apps/client/e2e/e2e.ps1'
$fields = 'method', 'path', 'query', 'authorized', 'context', 'body'

function Invoke-E2e([string] $Server) {
    $dir = Join-Path $WorkDir $Server
    New-Item -ItemType Directory -Force $dir | Out-Null
    $env:XSIM_SERVER = if ($Server -eq 'sim') { 'sim' } else { '' }
    $started = Get-Date
    $out = @(pwsh -NoProfile -File $e2e -Exe $Exe -WorkDir $dir 2>&1 | ForEach-Object { "$_" })
    [pscustomobject]@{ Exit = $LASTEXITCODE; Seconds = [int]((Get-Date) - $started).TotalSeconds; Rows = @(Get-Content (Join-Path $dir 'requests.jsonl') -ErrorAction Ignore | Where-Object { $_ } | ForEach-Object { $_ | ConvertFrom-Json }); Tail = @($out | Select-Object -Last 4) }
}

function Get-Row($Row) { ($fields | ForEach-Object { "$_=$(if ($null -eq $Row.$_) { '' } else { $Row.$_ })" }) -join ' | ' }

$stub = Invoke-E2e 'stub'
$sim = Invoke-E2e 'sim'
Remove-Item Env:XSIM_SERVER -ErrorAction Ignore
"e2e-parity / exits stub $($stub.Exit) sim $($sim.Exit); rows stub $($stub.Rows.Count) sim $($sim.Rows.Count)"
$differences = 0
for ($i = 0; $i -lt [Math]::Max($stub.Rows.Count, $sim.Rows.Count); $i++) {
    $a = if ($i -lt $stub.Rows.Count) { Get-Row $stub.Rows[$i] } else { '(none)' }
    $b = if ($i -lt $sim.Rows.Count) { Get-Row $sim.Rows[$i] } else { '(none)' }
    if ($a -cne $b) {
        $differences++
        if ($differences -le 10) { "e2e-parity / row $i differs`n  stub: $a`n  sim:  $b" }
    }
}
"e2e-parity / $differences differing row(s)"
"x_e2e_wall_seconds{server=`"stub`"} $($stub.Seconds)"
"x_e2e_wall_seconds{server=`"sim`"} $($sim.Seconds)"
"x_e2e_parity_differing_rows $differences"
if ($stub.Exit -or $sim.Exit) { 'e2e-parity / an e2e run failed; its last lines:'; $stub.Tail + $sim.Tail | ForEach-Object { "  $_" } }
exit ([int]($differences -gt 0 -or $stub.Exit -ne 0 -or $sim.Exit -ne 0))
