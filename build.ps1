$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$root = $PSScriptRoot
$sharedFiles = @()
$sharedFiles += Get-Item (Join-Path $root 'hide-gradient.css')
$iconDir = Join-Path $root 'icons'
if (Test-Path $iconDir) {
    $sharedFiles += Get-ChildItem -Path $iconDir -File -Recurse |
        Where-Object { $_.Name -match '^icon-(16|32|48|96|128)\.png$' }
}

function New-ExtensionArchive {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ManifestPath,

        [Parameter(Mandatory = $true)]
        [string]$OutputPath
    )

    if (Test-Path $OutputPath) {
        Remove-Item $OutputPath -Force
    }

    $zip = [System.IO.Compression.ZipFile]::Open($OutputPath, 'Create')
    try {
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
            $zip,
            $ManifestPath,
            'manifest.json',
            'Optimal'
        ) | Out-Null

        foreach ($file in $sharedFiles) {
            $entry = $file.FullName.Substring($root.Length).TrimStart('\', '/').Replace('\', '/')
            [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
                $zip,
                $file.FullName,
                $entry,
                'Optimal'
            ) | Out-Null
        }
    }
    finally {
        $zip.Dispose()
    }

    Write-Output "Built $OutputPath"
}

New-ExtensionArchive `
    -ManifestPath (Join-Path $root 'manifest.json') `
    -OutputPath (Join-Path $root 'extension-firefox.zip')

New-ExtensionArchive `
    -ManifestPath (Join-Path $root 'manifest.chrome.json') `
    -OutputPath (Join-Path $root 'extension-chrome.zip')
