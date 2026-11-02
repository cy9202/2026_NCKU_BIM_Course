# Build the add-in and make a zip for other computers. The target computer only needs Revit.
param(
    [ValidateSet('2027','2024')][string]$RevitVersion = '2024',
    [string]$Dotnet = 'dotnet',
    [string]$RevitDirectory = "C:\Program Files\Autodesk\Revit $RevitVersion"
)
$ErrorActionPreference = 'Stop'
& (Join-Path $PSScriptRoot 'build.ps1') -RevitVersion $RevitVersion -Dotnet $Dotnet -RevitDirectory $RevitDirectory
$framework = if ($RevitVersion -eq '2027') { 'net10.0-windows' } else { 'net48' }
$dll = Join-Path $PSScriptRoot "bin\$RevitVersion\Release\$framework\Group3.EgressExporter.dll"
$name = "EgressExporter-Revit$RevitVersion"
$dist = Join-Path $PSScriptRoot 'dist'
$folder = Join-Path $dist $name
if (Test-Path -LiteralPath $folder) { Remove-Item -LiteralPath $folder -Recurse -Force }
[IO.Directory]::CreateDirectory($folder) | Out-Null
Copy-Item -LiteralPath $dll -Destination $folder
Copy-Item -LiteralPath (Join-Path $PSScriptRoot 'install.ps1') -Destination $folder
Copy-Item -LiteralPath (Join-Path $PSScriptRoot '使用說明.txt') -Destination $folder
$bat = "@echo off`r`npowershell -NoProfile -ExecutionPolicy Bypass -File `"%~dp0install.ps1`" -RevitVersion $RevitVersion`r`npause`r`n"
[IO.File]::WriteAllText((Join-Path $folder 'install.bat'), $bat, [Text.Encoding]::ASCII)
$zip = Join-Path $dist "$name.zip"
if (Test-Path -LiteralPath $zip) { Remove-Item -LiteralPath $zip -Force }
Compress-Archive -Path (Join-Path $folder '*') -DestinationPath $zip
Write-Output "Package: $zip"
