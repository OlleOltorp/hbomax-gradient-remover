$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$root = $PSScriptRoot
$out = Join-Path $root 'extension.zip'

if (Test-Path $out) {
    Remove-Item $out -Force
}

$files = @()
$files += Get-Item (Join-Path $root 'manifest.json')
$files += Get-Item (Join-Path $root 'hide-gradient.css')
$iconDir = Join-Path $root 'icons'
if (Test-Path $iconDir) {
    $files += Get-ChildItem -Path $iconDir -File -Recurse
}

$zip = [System.IO.Compression.ZipFile]::Open($out, 'Create')
try {
    foreach ($file in $files) {
        $entry = $file.FullName.Substring($root.Length).TrimStart('\', '/').Replace('\', '/')
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $file.FullName, $entry, 'Optimal') | Out-Null
        Write-Output $entry
    }
}
finally {
    $zip.Dispose()
}

Write-Output "Built $out"
