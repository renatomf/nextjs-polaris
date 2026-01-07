# PowerShell script to sync Windows system clock
# Run this as Administrator to fix Clerk clock skew issues

Write-Host "Syncing system clock..." -ForegroundColor Yellow

try {
    # Stop the time service
    Stop-Service w32time -ErrorAction SilentlyContinue
    
    # Start the time service
    Start-Service w32time -ErrorAction SilentlyContinue
    
    # Force resync
    w32tm /resync
    
    Write-Host "✓ Clock sync completed!" -ForegroundColor Green
    Write-Host "Current time: $(Get-Date)" -ForegroundColor Cyan
} catch {
    Write-Host "✗ Error syncing clock. Try running as Administrator." -ForegroundColor Red
    Write-Host "Or manually run: w32tm /resync" -ForegroundColor Yellow
}
