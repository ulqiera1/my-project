# Complete Git + GitHub Setup Script
# Usage: .\complete-setup.ps1

Write-Host "Complete Git + GitHub Setup" -ForegroundColor Green
Write-Host "==========================" -ForegroundColor Green

# Step 1: Initialize Git if needed
if (-not (Test-Path ".git")) {
    Write-Host "Step 1: Initializing Git repository..." -ForegroundColor Cyan
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
    
    # Add and commit
    git add .
    git commit -m "Initial commit"
    Write-Host "Git repository initialized!" -ForegroundColor Green
} else {
    Write-Host "Step 1: Git repository already exists" -ForegroundColor Yellow
}

# Step 2: Check for existing remote
$remotes = git remote
if ($remotes -contains "origin") {
    Write-Host "Step 2: Remote 'origin' already exists!" -ForegroundColor Yellow
    Write-Host "Current remotes:" -ForegroundColor Cyan
    git remote -v
    Write-Host "Setup complete! GPT-5 should work now." -ForegroundColor Green
    exit
}

# Step 3: Setup GitHub
Write-Host "Step 2: GitHub Setup Required" -ForegroundColor Cyan
Write-Host ""
Write-Host "Please follow these steps:" -ForegroundColor White
Write-Host "1. Go to https://github.com and sign in" -ForegroundColor White
Write-Host "2. Click 'New repository' or '+' -> 'New repository'" -ForegroundColor White
Write-Host "3. Enter repository name (e.g., 'my-project')" -ForegroundColor White
Write-Host "4. Make it public or private" -ForegroundColor White
Write-Host "5. DO NOT check 'Add README', 'Add .gitignore', or 'Choose license'" -ForegroundColor White
Write-Host "6. Click 'Create repository'" -ForegroundColor White
Write-Host "7. Copy the repository URL (https://github.com/username/repo-name.git)" -ForegroundColor White
Write-Host ""

$repoUrl = Read-Host "Enter the GitHub repository URL"

if ($repoUrl -eq "") {
    Write-Host "Error: Repository URL is required!" -ForegroundColor Red
    Write-Host "You can run this script again later to add GitHub." -ForegroundColor Yellow
    exit
}

# Add remote and push
Write-Host "Adding remote origin..." -ForegroundColor Cyan
git remote add origin $repoUrl

Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
git push -u origin master

Write-Host ""
Write-Host "Complete setup finished!" -ForegroundColor Green
Write-Host "Now GPT-5 and other AI modes will work in Cursor!" -ForegroundColor Green
