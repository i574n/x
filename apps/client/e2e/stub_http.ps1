$reasons = @{ 200 = "OK"; 201 = "Created"; 400 = "Bad Request"; 401 = "Unauthorized"; 402 = "Payment Required"; 403 = "Forbidden"; 404 = "Not Found"; 422 = "Unprocessable Entity"; 429 = "Too Many Requests"; 500 = "Internal Server Error"; 502 = "Bad Gateway"; 503 = "Service Unavailable" }

function Read-Request([IO.Stream] $Stream) {
    $head = [Collections.Generic.List[byte]]::new()
    while ($head.Count -lt 4 -or $head[$head.Count - 4] -ne 13 -or $head[$head.Count - 3] -ne 10 -or $head[$head.Count - 2] -ne 13 -or $head[$head.Count - 1] -ne 10) {
        $b = $Stream.ReadByte()
        if ($b -lt 0) { return $null }
        $head.Add([byte]$b)
    }
    $lines = [Text.Encoding]::ASCII.GetString($head.ToArray()) -split "`r`n" | Where-Object { $_ }
    $method, $target = ($lines[0] -split " ")[0, 1]
    $headers = @{}
    foreach ($line in $lines | Select-Object -Skip 1) { $k, $v = $line -split ":", 2; $headers[$k.Trim()] = $v.Trim() }
    $length = [int]($headers["Content-Length"] ?? 0)
    $body = [byte[]]::new($length)
    $read = 0
    while ($read -lt $length) {
        $n = $Stream.Read($body, $read, $length - $read)
        if ($n -le 0) { break }
        $read += $n
    }
    $path, $query = ($target -split "#", 2)[0] -split "\?", 2
    [pscustomobject]@{ Method = $method; Path = $path; RawQuery = [string]$query; Headers = $headers; Raw = [Text.Encoding]::UTF8.GetString($body, 0, $read) }
}

function Send-Response([IO.Stream] $Stream, [int] $Status, [string] $Body) {
    $data = [Text.Encoding]::UTF8.GetBytes($Body)
    $head = [Text.Encoding]::ASCII.GetBytes("HTTP/1.1 $Status $($reasons[$Status] ?? 'Status')`r`nContent-Type: application/json; charset=utf-8`r`nContent-Length: $($data.Length)`r`nConnection: close`r`n`r`n")
    $Stream.Write($head, 0, $head.Length)
    $Stream.Write($data, 0, $data.Length)
}

function Start-StubServer([string] $PortPath, [scriptblock] $Handle) {
    $server = [Net.Sockets.TcpListener]::new([Net.IPAddress]::Loopback, 0)
    $server.Start()
    [IO.File]::WriteAllText($PortPath, [string]$server.LocalEndpoint.Port)
    while ($true) {
        $client = $server.AcceptTcpClient()
        try {
            $stream = $client.GetStream()
            $request = Read-Request $stream
            if ($request) {
                $status, $body = & $Handle $request
                Send-Response $stream $status $body
            }
        }
        catch { [Console]::Error.WriteLine("$([IO.Path]::GetFileName($MyInvocation.PSCommandPath)): $_") }
        finally { $client.Dispose() }
    }
}
