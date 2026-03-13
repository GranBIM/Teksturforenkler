# ═══════════════════════════════════════════════════════════════
#  push-teksturforenkler.ps1
#  Kjør dette scriptet fra Teksturforenkler-mappen for å laste
#  opp endringer til GitHub.
# ═══════════════════════════════════════════════════════════════

Set-Location $PSScriptRoot

# Fikser "dubious ownership"-feil på nettverksstasjoner (G:\)
git config --global --add safe.directory ($PSScriptRoot -replace '\\','/')

Write-Host ""
Write-Host "Følgende filer lastes opp:" -ForegroundColor Cyan
git status --short

Write-Host ""
$bekreft = Read-Host "Fortsett? (j/n)"
if ($bekreft -ne "j") {
    Write-Host "Avbrutt." -ForegroundColor Yellow
    exit
}

Write-Host ""
$melding = Read-Host "Beskriv hva du laster opp (f.eks. 'Oppdatert UI - 2026-03-13')"
if ([string]::IsNullOrWhiteSpace($melding)) {
    $melding = "Oppdatering $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
}

Write-Host ""
Write-Host "Laster opp..." -ForegroundColor Cyan

git add .
git commit -m "$melding"
git push

Write-Host ""
Write-Host "✅ Ferdig! Siden oppdateres på GitHub Pages innen 1-2 minutter." -ForegroundColor Green
Write-Host "   https://granbim.github.io/Teksturforenkler/" -ForegroundColor Green
Write-Host ""
