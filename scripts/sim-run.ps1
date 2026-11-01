$RunArgs = @($args)
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'common.ps1')
Assert-SpiralBeside
$scoopErlang = Join-Path $HOME 'scoop/apps/erlang/current/bin'
if (Test-Path $scoopErlang) { $env:PATH = "$scoopErlang$([IO.Path]::PathSeparator)$env:PATH" }

$frames = Join-Path $XRoot 'apps/sim/frames/build/dev/erlang'
if (!(Test-Path (Join-Path $frames 'xsim_frames/ebin/xsim_frames.beam'))) { throw "xsim / no frames build at $frames; run apps/sim/build.ps1 first" }
$build = Get-XTargetDir 'sim-cells'
$env:MIX_BUILD_PATH = $build
Push-Location (Join-Path $SpiralRoot 'apps/cells')
try {
    foreach ($step in 'deps.get', 'compile') {
        $out = @(mix $step 2>&1 | ForEach-Object { "$_" })
        if ($LASTEXITCODE) { $out | Select-Object -Last 20 | ForEach-Object { [Console]::Error.WriteLine($_) }; throw "xsim / mix $step failed in spiral/apps/cells" }
    }
} finally { Pop-Location; Remove-Item Env:MIX_BUILD_PATH }

New-Item -ItemType Directory -Force $build | Out-Null
$probe = Join-Path $build 'elixir-lib.exs'
[IO.File]::WriteAllText($probe, "IO.write(:code.lib_dir(:elixir))`n")
$elixirLib = Split-Path (elixir $probe)
if (!$elixirLib) { throw "xsim / elixir did not report its lib dir" }
$paths = @(Join-Path $build 'consolidated') + @(Get-ChildItem (Join-Path $elixirLib '*/ebin'), (Join-Path $build 'lib/*/ebin'), (Join-Path $frames '*/ebin') -Directory).FullName
$codePath = @($paths | Where-Object { (Test-Path $_) -and $_ -notmatch '[\\/]mix[\\/]ebin$' } | ForEach-Object { '-pa', $_ })
$entry = if ($RunArgs.Count -and $RunArgs[0] -in 'events', 'world', 'frames', 'thread_run', 'diff', 'serve') { "cli_$($RunArgs[0])" } else { 'cli_run' }
if ($entry -eq 'cli_serve' -and $RunArgs.Count -lt 4) { throw "xsim / usage: sim-run.ps1 serve WORLD PORTFILE LOG" }
erl -noshell @codePath -eval "halt(xsim_frames:$entry(<<>>))" -extra @RunArgs
exit $LASTEXITCODE
