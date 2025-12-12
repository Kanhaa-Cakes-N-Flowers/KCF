# PowerShell deployment script for GitHub Pages
$ErrorActionPreference = "Stop"

# Ensure we're on main branch
$currentBranch = git branch --show-current
if ($currentBranch -ne "main") {
    Write-Host "Switching to main branch from $currentBranch..."
    git checkout main
}

# Build the project
Write-Host "Building project..."
npm run build

# Create a temporary directory for deployment
$tempDir = "temp-gh-pages"
if (Test-Path $tempDir) {
    Remove-Item -Recurse -Force $tempDir
}
New-Item -ItemType Directory -Path $tempDir | Out-Null

# Copy dist contents to temp directory
Write-Host "Copying dist files..."
Copy-Item -Path "dist\*" -Destination $tempDir -Recurse -Force

# Initialize git in temp directory
Set-Location $tempDir
git init
git add .
git commit -m "Deploy to GitHub Pages"

# Add remote if it doesn't exist
$remoteUrl = git -C .. remote get-url origin
git remote add origin $remoteUrl 2>$null

# Force push to gh-pages branch
Write-Host "Deploying to GitHub Pages..."
$currentBranch = git branch --show-current
git push -f origin ${currentBranch}:gh-pages

# Cleanup
Set-Location ..
Remove-Item -Recurse -Force $tempDir

Write-Host "Deployment successful!"

