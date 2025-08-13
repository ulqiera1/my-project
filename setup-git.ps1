# Скрипт для автоматической настройки Git репозитория
# Использование: .\setup-git.ps1

Write-Host "🚀 Настройка Git репозитория..." -ForegroundColor Green

# Проверяем, есть ли уже Git репозиторий
if (Test-Path ".git") {
    Write-Host "⚠️  Git репозиторий уже существует в этой папке!" -ForegroundColor Yellow
    exit
}

# Инициализируем Git
Write-Host "📁 Инициализация Git репозитория..." -ForegroundColor Cyan
git init

# Копируем .gitignore если его нет
if (-not (Test-Path ".gitignore")) {
    Write-Host "📄 Создание .gitignore..." -ForegroundColor Cyan
    
    # Создаем базовый .gitignore
    @"
# Dependencies
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Runtime data
pids
*.pid
*.seed
*.pid.lock

# Coverage directory used by tools like istanbul
coverage/

# nyc test coverage
.nyc_output

# Grunt intermediate storage
.grunt

# Bower dependency directory
bower_components

# node-waf configuration
.lock-wscript

# Compiled binary addons
build/Release

# Dependency directories
jspm_packages/

# TypeScript cache
*.tsbuildinfo

# Optional npm cache directory
.npm

# Optional eslint cache
.eslintcache

# Microbundle cache
.rpt2_cache/
.rts2_cache_cjs/
.rts2_cache_es/
.rts2_cache_umd/

# Optional REPL history
.node_repl_history

# Output of 'npm pack'
*.tgz

# Yarn Integrity file
.yarn-integrity

# dotenv environment variables file
.env
.env.test
.env.local
.env.production

# parcel-bundler cache
.cache
.parcel-cache

# Next.js build output
.next

# Nuxt.js build / generate output
.nuxt
dist

# Gatsby files
.cache/
public

# Storybook build outputs
.out
.storybook-out

# Temporary folders
tmp/
temp/

# Logs
logs
*.log

# IDE files
.vscode/
.idea/
*.swp
*.swo
*~

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# PyInstaller
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
.hypothesis/
.pytest_cache/

# Jupyter Notebook
.ipynb_checkpoints

# pyenv
.python-version

# celery beat schedule file
celerybeat-schedule

# SageMath parsed files
*.sage.py

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# Spyder project settings
.spyderproject
.spyderworkspace

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/
.dmypy.json
dmypy.json
"@ | Out-File -FilePath ".gitignore" -Encoding UTF8
}

# Добавляем все файлы
Write-Host "📦 Добавление файлов в Git..." -ForegroundColor Cyan
git add .

# Создаем первый коммит
Write-Host "💾 Создание первого коммита..." -ForegroundColor Cyan
git commit -m "Initial commit"

Write-Host "✅ Git репозиторий успешно настроен!" -ForegroundColor Green
Write-Host "🎉 Теперь GPT-5 и другие режимы нейросети будут работать в Cursor!" -ForegroundColor Green
