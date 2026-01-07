# Fix Clerk Clock Skew Issue
Write-Host "=== Fixing Clerk Clock Skew Issue ===" -ForegroundColor Cyan
Write-Host ""

# Step 1: Sync system clock
Write-Host "Step 1: Syncing system clock..." -ForegroundColor Yellow
try {
    Stop-Service w32time -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 1
    Start-Service w32time -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
    $result = w32tm /resync 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Clock synced successfully!" -ForegroundColor Green
    } else {
        Write-Host "Clock sync may require Administrator privileges" -ForegroundColor Yellow
        Write-Host "Run this command as Administrator: w32tm /resync" -ForegroundColor Yellow
    }
} catch {
    Write-Host "Error syncing clock. Try running as Administrator: w32tm /resync" -ForegroundColor Red
}

Write-Host ""
Write-Host "Step 2: Clear browser cookies for localhost" -ForegroundColor Yellow
Write-Host "Step 3: Restart your dev server (npm run dev)" -ForegroundColor Yellow
Write-Host ""
Write-Host "Current system time: $(Get-Date)" -ForegroundColor Green
