param(
    [Parameter(Mandatory)] [string] $Source,
    [Parameter(Mandatory)] [string] $Entry,
    [int] $Limit = 1000
)
$ErrorActionPreference = 'Stop'
$Source = (Resolve-Path $Source).Path
$srcDir = Split-Path $Source
$module = [IO.Path]::GetFileNameWithoutExtension($Source)
$exports = @([regex]::Matches([IO.File]::ReadAllText($Entry), '(?:!!!!Export\(|(?<![\w''])export)\s*"(\w+)"') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique)
if (!$exports) { throw "gleam-modules / $Entry exports nothing (no export), so there is no public surface to keep in $module" }

$lines = [IO.File]::ReadAllLines($Source)
$items = [Collections.Generic.List[object]]::new()
$attributes = [Collections.Generic.List[string]]::new()
$current = $null
foreach ($line in $lines) {
    if ($line -match '^@\s?\w' -and $line -notmatch '^@.*\)\s*(pub )?fn \w+\(') { if ($current) { $items.Add($current); $current = $null }; $attributes.Add($line); continue }
    $kind = $null; $name = $null
    if ($line -match '^import ') { $kind = 'import' }
    elseif ($line -match '^(pub )?(opaque )?type (\w+)') { $kind = 'type'; $name = $Matches[3] }
    elseif ($line -match '^(pub )?const (\w+)') { $kind = 'const'; $name = $Matches[2] }
    elseif ($line -match '^(?:@.*\)\s*)?(pub )?fn (\w+)\(') { $kind = 'fn'; $name = $Matches[2] }
    if ($kind) {
        if ($current) { $items.Add($current) }
        $current = [pscustomobject]@{ Kind = $kind; Name = $name; Lines = [Collections.Generic.List[string]]::new() }
        foreach ($attribute in $attributes) { $current.Lines.Add($attribute) }
        $attributes.Clear()
    }
    if ($current) { $current.Lines.Add($line) } elseif ($line.Trim()) { throw "gleam-modules / text before the first item in ${Source}: $line" }
}
if ($current) { $items.Add($current) }

$imports = @($items | Where-Object Kind -eq 'import' | ForEach-Object { $_.Lines[0].Trim() } | Sort-Object -Unique)
$typeItems = @($items | Where-Object { $_.Kind -in 'type', 'const' })
$fns = @($items | Where-Object Kind -eq 'fn')
$typeNames = @($typeItems | Where-Object Kind -eq 'type' | ForEach-Object Name)
$constNames = @($typeItems | Where-Object Kind -eq 'const' | ForEach-Object Name)
$builtins = @('Int', 'String', 'Bool', 'Float', 'List', 'Nil', 'BitArray', 'Result', 'Ok', 'Error', 'True', 'False')
$constructors = @(@(foreach ($t in ($typeItems | Where-Object Kind -eq 'type')) {
    if (($t.Lines -join "`n") -match '(?s)\{(.*)\}') {
        foreach ($row in ($Matches[1] -split "`n" | ForEach-Object Trim | Where-Object { $_ })) {
            $depth = 0; $token = ''
            for ($i = 0; $i -le $row.Length; $i++) {
                $ch = if ($i -lt $row.Length) { $row[$i] } else { ' ' }
                if ($ch -eq '(') { if ($depth -eq 0 -and $token -match '^[A-Z]') { $token }; $token = ''; $depth++ }
                elseif ($ch -eq ')') { $depth--; $token = '' }
                elseif ($depth -eq 0 -and [char]::IsWhiteSpace($ch)) { if ($token -match '^[A-Z]') { $token }; $token = '' }
                elseif ($depth -eq 0) { $token += $ch }
            }
        }
    }
}) | Where-Object { $_ -notin $builtins } | Sort-Object -Unique)

$byName = @{}; foreach ($f in $fns) { $byName[$f.Name] = $f }
foreach ($e in $exports) { if (!$byName.ContainsKey($e)) { throw "gleam-modules / export $e of $Entry is not a function in $Source" } }
$edges = @{}
foreach ($f in $fns) {
    $text = ($f.Lines | Select-Object -Skip 1) -join "`n"
    $edges[$f.Name] = @([regex]::Matches($text, '\b([a-z_][a-z0-9_]*)\b') | ForEach-Object { $_.Groups[1].Value } | Where-Object { $byName.ContainsKey($_) -and $_ -ne $f.Name } | Sort-Object -Unique)
}

$script:counter = 0; $script:stack = [Collections.Generic.Stack[string]]::new(); $script:onStack = @{}; $script:index = @{}; $script:low = @{}; $script:components = [Collections.Generic.List[object]]::new()
function Connect([string] $v) {
    $script:index[$v] = $script:counter; $script:low[$v] = $script:counter; $script:counter++
    $script:stack.Push($v); $script:onStack[$v] = $true
    foreach ($w in $edges[$v]) {
        if (!$script:index.ContainsKey($w)) { Connect $w; $script:low[$v] = [Math]::Min($script:low[$v], $script:low[$w]) }
        elseif ($script:onStack[$w]) { $script:low[$v] = [Math]::Min($script:low[$v], $script:index[$w]) }
    }
    if ($script:low[$v] -eq $script:index[$v]) {
        $members = [Collections.Generic.List[string]]::new()
        do { $w = $script:stack.Pop(); $script:onStack[$w] = $false; $members.Add($w) } while ($w -ne $v)
        $script:components.Add($members)
    }
}
foreach ($f in $fns) { if (!$script:index.ContainsKey($f.Name)) { Connect $f.Name } }

$callers = @{}
foreach ($f in $fns) { foreach ($c in $edges[$f.Name]) { if (!$callers[$c]) { $callers[$c] = [Collections.Generic.List[string]]::new() }; $callers[$c].Add($f.Name) } }
$top = [Collections.Generic.HashSet[string]]::new()
$queue = [Collections.Generic.Queue[string]]::new(); foreach ($e in $exports) { $queue.Enqueue($e) }
while ($queue.Count) { $n = $queue.Dequeue(); if ($top.Add($n)) { foreach ($c in @($callers[$n])) { if ($c) { $queue.Enqueue($c) } } } }

$budget = $Limit - $imports.Count - 40
$parts = [Collections.Generic.List[object]]::new(); $fill = 0; $part = [Collections.Generic.List[string]]::new()
foreach ($component in $script:components) {
    $members = @($component | Where-Object { !$top.Contains($_) })
    if (!$members) { continue }
    $size = ($members | ForEach-Object { $byName[$_].Lines.Count + 1 } | Measure-Object -Sum).Sum
    if ($fill + $size -gt $budget -and $part.Count) { $parts.Add($part); $part = [Collections.Generic.List[string]]::new(); $fill = 0 }
    foreach ($m in $members) { $part.Add($m) }
    $fill += $size
}
if ($part.Count) { $parts.Add($part) }
$placement = @{}
for ($k = 0; $k -lt $parts.Count; $k++) { foreach ($m in $parts[$k]) { $placement[$m] = "$module/part$($k + 1)" } }
foreach ($m in $top) { $placement[$m] = $module }

function Publish([string] $text) { [regex]::Replace($text, '(?m)^((?:@[^\n]*?\)\s*)?)(?!pub )((opaque )?type |const |fn )', '$1pub $2') }
function Get-UsedImports([string] $text) {
    @($imports | Where-Object {
        $path, $names = ($_ -replace '^import\s+', '') -split '\.\{', 2
        $alias = ($path -split '/')[-1].Trim()
        $unqualified = @(if ($names) { $names.TrimEnd('}', ' ') -split ',' | ForEach-Object { ($_ -replace '^\s*type\s+', '').Trim() } | Where-Object { $_ } })
        $text -match "\b$([regex]::Escape($alias))\." -or @($unqualified | Where-Object { $text -match "\b$([regex]::Escape($_))\b" }).Count
    })
}

$partsDir = Join-Path $srcDir $module
Remove-Item -LiteralPath $partsDir -Recurse -Force -ErrorAction Ignore
New-Item -ItemType Directory -Force $partsDir | Out-Null
$typeBody = ($typeItems | ForEach-Object { Publish ($_.Lines -join "`n") }) -join "`n`n"
[IO.File]::WriteAllText((Join-Path $partsDir 'types.gleam'), ((@(Get-UsedImports $typeBody) -join "`n") + "`n`n" + $typeBody + "`n").TrimStart("`n"))

function Write-Module([string] $modulePath, [string[]] $names) {
    $uses = @{}
    foreach ($n in $names) { foreach ($c in $edges[$n]) { $h = $placement[$c]; if ($h -ne $modulePath) { if (!$uses[$h]) { $uses[$h] = [Collections.Generic.HashSet[string]]::new() }; [void]$uses[$h].Add($c) } } }
    $bodyText = ($names | ForEach-Object { $byName[$_].Lines -join "`n" }) -join "`n"
    $words = [Collections.Generic.HashSet[string]]::new([string[]]@([regex]::Matches($bodyText, '\b[A-Za-z_][A-Za-z0-9_]*\b') | ForEach-Object Value))
    $usedTypes = @(@($typeNames | Where-Object { $words.Contains($_) } | ForEach-Object { "type $_" }) + @($constructors + $constNames | Where-Object { $words.Contains($_) }))
    $head = @(Get-UsedImports $bodyText) + @(if ($usedTypes) { "import $module/types.{" + ($usedTypes -join ', ') + "}" }) + @($uses.Keys | Sort-Object | ForEach-Object { "import $_.{" + ((@($uses[$_]) | Sort-Object) -join ', ') + "}" })
    $body = ($names | ForEach-Object { Publish ($byName[$_].Lines -join "`n") }) -join "`n`n"
    $file = if ($modulePath -eq $module) { $Source } else { Join-Path $srcDir "$modulePath.gleam" }
    [IO.File]::WriteAllText($file, ($head -join "`n") + "`n`n" + $body + "`n")
    [pscustomobject]@{ Module = $modulePath; Functions = $names.Count; Lines = [IO.File]::ReadAllLines($file).Count }
}
$report = @(for ($k = 0; $k -lt $parts.Count; $k++) { Write-Module "$module/part$($k + 1)" @($parts[$k]) })
$report += Write-Module $module @($fns | Where-Object { $top.Contains($_.Name) } | ForEach-Object Name)
$report += [pscustomobject]@{ Module = "$module/types"; Functions = 0; Lines = [IO.File]::ReadAllLines((Join-Path $partsDir 'types.gleam')).Count }
$over = @($report | Where-Object Lines -gt $Limit)
Write-Output "gleam-modules / $module / $($lines.Count) generated lines -> $($report.Count) modules (largest $(($report | Measure-Object Lines -Maximum).Maximum) lines, $($exports.Count) exports kept in $module)"
if ($over) { throw "gleam-modules / $(($over | ForEach-Object { "$($_.Module) $($_.Lines)" }) -join ', ') over $Limit lines" }
