# Деплой портфолио на GitHub Pages
# Репозиторий: arinanira104-sketch/portfolio

$REPO_URL = "https://github.com/arinanira104-sketch/portfolio.git"

Set-Location $PSScriptRoot

Write-Host "=== Инициализация git ===" -ForegroundColor Cyan
git init
git branch -M main

Write-Host "=== Добавляю файлы ===" -ForegroundColor Yellow
git add .

Write-Host "=== Создаю коммит ===" -ForegroundColor Yellow
$date = Get-Date -Format "yyyy-MM-dd HH:mm"
git commit -m "Portfolio update $date"

Write-Host "=== Подключаю репозиторий ===" -ForegroundColor Yellow
git remote remove origin 2>$null
git remote add origin $REPO_URL

Write-Host "=== Отправляю на GitHub ===" -ForegroundColor Yellow
git push -f origin main

Write-Host ""
Write-Host "=== Готово! ===" -ForegroundColor Green
Write-Host "Сайт: https://arinanira104-sketch.github.io/portfolio/" -ForegroundColor Cyan
