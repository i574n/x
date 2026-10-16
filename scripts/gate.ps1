param(
    [string] $Root = (Join-Path $PSScriptRoot '..'),
    [int] $Limit = 1000,
    [switch] $Enforce
)
$ErrorActionPreference = "Stop"

$crates = foreach ($manifest in Get-ChildItem (Join-Path $Root 'apps') -Recurse -Filter Cargo.toml) {
    $text = [IO.File]::ReadAllText($manifest.FullName)
    if ($text -match '(?m)^\[package\.metadata\.spiral\]\s*\r?\nentry = "([^"]+)"\s*\r?\noutput = "([^"]+)"') {
        $output = Join-Path $manifest.DirectoryName $Matches[2]
        $lines = if (Test-Path $output) { @(Get-Content $output).Count } else { -1 }
        [pscustomobject]@{ Crate = Split-Path $manifest.DirectoryName -Leaf; Output = $Matches[2]; Lines = $lines; Within = $lines -ge 0 -and $lines -le $Limit }
    }
}
$crates | Sort-Object Lines -Descending | ForEach-Object { Write-Output ("gate / {0,-10} {1,6} lines {2}" -f $_.Crate, $_.Lines, $(if ($_.Within) { 'ok' } else { "OVER $Limit" })) }
$over = @($crates | Where-Object { !$_.Within })
Write-Output "gate / $($crates.Count) crates, $($over.Count) over $Limit generated Rust lines"
if ($Enforce -and $over.Count) { throw "gate / $($over.Count) crate(s) over $Limit lines: $(($over | ForEach-Object Crate) -join ', ')" }
