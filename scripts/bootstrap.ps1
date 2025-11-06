[CmdletBinding()]
param(
  [string]$Version = '1.0.0',
  [string]$ConfigPath = "$PSScriptRoot\..\.bootstrap.psd1"
)

$ErrorActionPreference = 'Stop'
$cacheRoot = Join-Path $env:USERPROFILE ".flutter-bootstrap\$Version"
$module    = Join-Path $cacheRoot "BootstrapTools.psm1"

if (-not (Test-Path $module)) {
  Write-Host "Downloading Flutter Bootstrap Tools v$Version..."
  $zipUrl = "https://github.com/<OWNER_OR_ORG>/flutter-bootstrap-tools/releases/download/v$Version/flutter-bootstrap-tools_$Version.zip"
  $zip    = Join-Path $env:TEMP "flutter-bootstrap-tools_$Version.zip"
  Invoke-WebRequest $zipUrl -OutFile $zip
  Expand-Archive -Path $zip -DestinationPath $cacheRoot -Force
}

Import-Module $module -Force
$config = Import-PowerShellDataFile -Path $ConfigPath
Invoke-FlutterBootstrap -Config $config -RepoRoot (Resolve-Path "$PSScriptRoot\..").Path
