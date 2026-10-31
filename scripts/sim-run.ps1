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
$stub = $null
if ($entry -eq 'cli_serve') {
    if ($RunArgs.Count -lt 4) { throw "xsim / usage: sim-run.ps1 serve WORLD PORTFILE LOG" }
    $stubPort = Join-Path $build "stub-port-$PID.txt"
    Remove-Item $stubPort -ErrorAction Ignore
    $stub = Start-Process pwsh -ArgumentList '-NoProfile', '-File', (Join-Path $XRoot 'apps/client/e2e/stub.ps1'), $RunArgs[1], $stubPort, $RunArgs[3] -PassThru -NoNewWindow
    $deadline = (Get-Date).AddSeconds(60)
    while (!(Test-Path $stubPort) -or !(Get-Content $stubPort -ErrorAction Ignore)) { if ((Get-Date) -gt $deadline) { throw "xsim / stub.ps1 gave no port" }; Start-Sleep -Milliseconds 100 }
    $RunArgs = @($RunArgs[0..3]) + @((Get-Content $stubPort).Trim())
}
try { erl -noshell @codePath -eval "halt(xsim_frames:$entry(<<>>))" -extra @RunArgs; $code = $LASTEXITCODE }
finally { if ($stub -and !$stub.HasExited) { Stop-Process -Id $stub.Id -Force -ErrorAction Ignore } }
exit $code
