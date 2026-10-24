param(
    [Parameter(Mandatory)] [string] $Source,
    [int] $Limit = 1000
)
$ErrorActionPreference = 'Stop'
$Source = (Resolve-Path $Source).Path
$dir = Split-Path $Source
$stem = [IO.Path]::GetFileNameWithoutExtension($Source)
Get-ChildItem $dir -Filter "${stem}_part*.rs" | Remove-Item
$lines = [IO.File]::ReadAllLines($Source)
if ($lines.Count -le $Limit) {
    Write-Output "rust-modules / $stem / $($lines.Count) generated lines, within $Limit, kept as one file"
    return
}

$items = [Collections.Generic.List[object]]::new()
$attributes = [Collections.Generic.List[string]]::new()
$current = $null
foreach ($line in $lines) {
    if ($line -match '^#\[' ) { if ($current) { $items.Add($current); $current = $null }; $attributes.Add($line); continue }
    if ($line -match '^\S' -and $line -notmatch '^[\}\)\]]') {
        if ($current) { $items.Add($current) }
        $kind = switch -Regex ($line) { '^#!\[' { 'inner'; break } '^use ' { 'use'; break } '^(pub fn |fn main\()' { 'export'; break } '^fn ' { 'fn'; break } default { 'type' } }
        $current = [pscustomobject]@{ Kind = $kind; Lines = [Collections.Generic.List[string]]::new() }
        foreach ($attribute in $attributes) { $current.Lines.Add($attribute) }
        $attributes.Clear()
    }
    if ($current) { $current.Lines.Add($line) } elseif ($line.Trim()) { throw "rust-modules / text before the first item in ${Source}: $line" }
}
if ($current) { $items.Add($current) }
if ($attributes.Count) { throw "rust-modules / attributes at the end of $Source with no item" }

$root = @($items | Where-Object { $_.Kind -ne 'fn' })
$functions = @($items | Where-Object { $_.Kind -eq 'fn' })
$budget = $Limit - 4
$parts = [Collections.Generic.List[object]]::new(); $part = [Collections.Generic.List[object]]::new(); $fill = 0
foreach ($f in $functions) {
    if ($f.Lines.Count + 2 -gt $budget) { throw "rust-modules / one function in $Source has $($f.Lines.Count) lines, over the $Limit-line limit on its own" }
    if ($fill + $f.Lines.Count + 1 -gt $budget -and $part.Count) { $parts.Add($part); $part = [Collections.Generic.List[object]]::new(); $fill = 0 }
    $part.Add($f); $fill += $f.Lines.Count + 1
}
if ($part.Count) { $parts.Add($part) }

$names = for ($k = 1; $k -le $parts.Count; $k++) { "${stem}_part$k" }
for ($k = 0; $k -lt $parts.Count; $k++) {
    $body = foreach ($f in $parts[$k]) { (($f.Lines -join "`n") -replace '(?m)^fn ', 'pub(crate) fn ') }
    [IO.File]::WriteAllText((Join-Path $dir "$($names[$k]).rs"), "use super::*;`n`n" + ($body -join "`n") + "`n")
}
$head = @($root | Where-Object { $_.Kind -in 'inner', 'use' } | ForEach-Object { $_.Lines -join "`n" })
$modules = @($names | ForEach-Object { "mod $_;" }) + @($names | ForEach-Object { "use $_::*;" })
$rest = @($root | Where-Object { $_.Kind -notin 'inner', 'use' } | ForEach-Object { $_.Lines -join "`n" })
[IO.File]::WriteAllText($Source, (@($head) + @($modules) + @($rest) -join "`n") + "`n")
$sizes = @($Source) + @($names | ForEach-Object { Join-Path $dir "$_.rs" }) | ForEach-Object { [IO.File]::ReadAllLines($_).Count }
Write-Output "rust-modules / $stem / $($lines.Count) generated lines -> root $($sizes[0]) + $($parts.Count) part(s) ($(($sizes | Select-Object -Skip 1) -join ', ') lines)"
if ($sizes | Where-Object { $_ -gt $Limit }) { throw "rust-modules / $stem / a file is still over $Limit lines: $($sizes -join ', ')" }
