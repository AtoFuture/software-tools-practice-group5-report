param(
    [string]$ServerHost = "127.0.0.1",
    [int]$SshPort = 2222,
    [string]$RemoteUser = "hdu"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ProjectRoot = $PSScriptRoot
$HexoCommand = Join-Path $ProjectRoot "node_modules\.bin\hexo.cmd"
$PublicDirectory = Join-Path $ProjectRoot "public"
$ReportIndex = Join-Path $PublicDirectory "report\index.html"
$RemoteDirectory = "web-report-release"
$RemoteTarget = "${RemoteUser}@${ServerHost}:~/$RemoteDirectory"

function Assert-NativeSuccess {
    param([string]$Step)

    if ($LASTEXITCODE -ne 0) {
        throw "$Step failed. Exit code: $LASTEXITCODE"
    }
}

Write-Host "===== 1. Check local project ====="

if (-not (Test-Path $HexoCommand)) {
    throw "Local Hexo was not found: $HexoCommand"
}

Set-Location $ProjectRoot

Write-Host "Project root: $ProjectRoot"
Write-Host "Hexo command: $HexoCommand"

Write-Host "===== 2. Build static site ====="

& $HexoCommand clean
Assert-NativeSuccess "Hexo clean"

& $HexoCommand generate
Assert-NativeSuccess "Hexo generate"

if (-not (Test-Path $ReportIndex)) {
    throw "Generated report was not found: $ReportIndex"
}

Write-Host "Generated report: $ReportIndex"

Write-Host "===== 3. Clean remote staging directory ====="

& ssh -p $SshPort "${RemoteUser}@${ServerHost}" `
    "rm -rf ~/$RemoteDirectory"

Assert-NativeSuccess "Remote cleanup"

Write-Host "===== 4. Upload public directory ====="

& scp -P $SshPort -r $PublicDirectory $RemoteTarget
Assert-NativeSuccess "SCP upload"

Write-Host "===== 5. Deploy to Nginx ====="

$RemoteCommand = 'set -euo pipefail; STAGE="$HOME/web-report-release"; TARGET="/var/www/html"; test -f "$STAGE/report/index.html"; sudo mkdir -p "$TARGET"; sudo find "$TARGET" -mindepth 1 -maxdepth 1 -exec rm -rf -- {} +; sudo cp -a "$STAGE/." "$TARGET/"; sudo find "$TARGET" -type d -exec chmod 755 {} +; sudo find "$TARGET" -type f -exec chmod 644 {} +; sudo nginx -t; sudo systemctl reload nginx; test -f "$TARGET/report/index.html"; echo "Nginx deployment completed."; ls -lh "$TARGET/report/index.html"'

& ssh -tt -p $SshPort "${RemoteUser}@${ServerHost}" $RemoteCommand
Assert-NativeSuccess "Remote deployment"

Write-Host "===== 6. Verify HTTP response ====="

& curl.exe `
    --fail `
    --silent `
    --show-error `
    --head `
    "http://127.0.0.1:8080/report/"
Assert-NativeSuccess "HTTP verification"

Write-Host ""
Write-Host "Deployment succeeded."
Write-Host "Open: http://127.0.0.1:8080/report/"
