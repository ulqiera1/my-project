# Simple Git Setup Script
# Usage: .\simple-git-setup.ps1

Write-Host "Setting up Git repository..." -ForegroundColor Green

# Check if Git repository already exists
if (Test-Path ".git") {
    Write-Host "Warning: Git repository already exists!" -ForegroundColor Yellow
    exit
}

# Initialize Git
Write-Host "Initializing Git..." -ForegroundColor Cyan
git init

# Create simple .gitignore
Write-Host "Creating .gitignore..." -ForegroundColor Cyan
@"
node_modules/
.env
*.log
.DS_Store
Thumbs.db
.vscode/
.idea/
"@ | Out-File -FilePath ".gitignore" -Encoding UTF8

# Add all files
Write-Host "Adding files..." -ForegroundColor Cyan
git add .

# Create first commit
Write-Host "Creating first commit..." -ForegroundColor Cyan
git commit -m "Initial commit"

Write-Host "Done! Git repository is ready." -ForegroundColor Green
Write-Host "GPT-5 will now work in Cursor!" -ForegroundColor Green
