# Define the URLs and their respective file paths
$files = @(
    @{ url = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"; path = "libs/font-awesome.css" },
    @{ url = "https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"; path = "libs/poppins-font.css" },
    @{ url = "https://unpkg.com/aos@next/dist/aos.css"; path = "libs/aos.css" },
    @{ url = "https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"; path = "libs/emailjs.min.js" }
)

# Create directories if they don't exist
$dirs = @("libs")
foreach ($dir in $dirs) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir
    }
}

# Download files
foreach ($file in $files) {
    $url = $file.url
    $path = $file.path

    # Download the file
    Write-Host "Downloading $url to $path"
    Invoke-WebRequest -Uri $url -OutFile $path
}

Write-Host "Downloads complete!"
