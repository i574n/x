param([string[]] $Path = @((Join-Path $PSScriptRoot '../apps/sim/frames/src'), (Join-Path $PSScriptRoot '../apps/sim/split/src')))
$ErrorActionPreference = 'Stop'
$files = @($Path | ForEach-Object { Get-ChildItem $_ -Recurse -Filter *.gleam -File })
$lines, $armsCompactable, $letReturns = 0, 0, 0
foreach ($file in $files) {
    $text = @(Get-Content -LiteralPath $file.FullName)
    $lines += $text.Count
    for ($i = 0; $i + 2 -lt $text.Count; $i++) {
        $head, $body, $close = $text[$i], $text[$i + 1], $text[$i + 2]
        if ($head -match '->\s*\{\s*$' -and $close -match '^\s*\}\s*$' -and $body.Trim() -and $body.Trim() -notmatch '^let ') { $armsCompactable++ }
        if ($head -match '^\s*let (v\d+) = ' -and $body.Trim() -eq $Matches[1] -and $close -match '^\s*\}\s*$') { $letReturns++ }
    }
}
$saved = 2 * $armsCompactable + $letReturns
"gleam-compact-census / $($files.Count) modules, $lines lines"
"gleam-compact-census / single-expression arms $armsCompactable (2 lines each), let-then-return $letReturns (1 line each)"
"gleam-compact-census / compactable $saved lines ($([math]::Round(100 * $saved / [math]::Max(1, $lines), 1))%)"
