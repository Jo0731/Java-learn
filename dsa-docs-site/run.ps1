# DSA Learning Hub - PowerShell Server Launcher

Write-Host ""
Write-Host " ====================================" -ForegroundColor Cyan
Write-Host "  DSA Learning Hub - Local Server" -ForegroundColor Cyan
Write-Host " ====================================" -ForegroundColor Cyan
Write-Host ""

# Change to the directory where this script lives
Set-Location -Path $PSScriptRoot

$port = 8000
$url  = "http://localhost:$port"

# --- Try Python ---
$python = $null
if (Get-Command python  -ErrorAction SilentlyContinue) { $python = "python"  }
elseif (Get-Command python3 -ErrorAction SilentlyContinue) { $python = "python3" }

if ($python) {
    Write-Host " [OK] $python found. Starting server on $url" -ForegroundColor Green
    Write-Host ""
    Write-Host " Press Ctrl+C to stop." -ForegroundColor Yellow
    Write-Host ""

    # Auto-open browser after 1 second
    Start-Job -ScriptBlock {
        param($u)
        Start-Sleep 1
        Start-Process $u
    } -ArgumentList $url | Out-Null

    & $python -m http.server $port
    exit
}

# --- Try Node / npx serve ---
if (Get-Command node -ErrorAction SilentlyContinue) {
    $port = 3000
    $url  = "http://localhost:$port"
    Write-Host " [OK] Node.js found. Starting server on $url" -ForegroundColor Green
    Write-Host ""
    Write-Host " Press Ctrl+C to stop." -ForegroundColor Yellow
    Write-Host ""

    Start-Job -ScriptBlock {
        param($u)
        Start-Sleep 2
        Start-Process $u
    } -ArgumentList $url | Out-Null

    npx -y serve . -p $port
    exit
}

# --- Nothing found ---
Write-Host " [ERROR] Python and Node.js were NOT found." -ForegroundColor Red
Write-Host ""
Write-Host " Install one of these and try again:" -ForegroundColor White
Write-Host "   Python  -> https://www.python.org/downloads/" -ForegroundColor Cyan
Write-Host "   Node.js -> https://nodejs.org/" -ForegroundColor Cyan
Write-Host ""
Read-Host "Press Enter to close"
