# ============================================================
# Newman Test Runner — api-testing-portfolio
# Usage: .\run-tests.ps1
# ============================================================

$Collection  = "postman/api-testing-collection.json"
$Environment = "postman/api-testing-environment2.json"
$ReportDir   = "newman"
$Timestamp   = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

Write-Host "Starting Newman test run at $Timestamp"

newman run $Collection --environment $Environment --reporters "cli,htmlextra" --reporter-htmlextra-export "$ReportDir/report-$Timestamp.html" --delay-request 300 --bail

if ($LASTEXITCODE -eq 0) {
  Write-Host "All tests passed."
} else {
  Write-Host "One or more tests failed. Exit code: $LASTEXITCODE"
}

exit $LASTEXITCODE

# ── QA Live API Tests (Data-Driven) ───────────────────────────────────────────
Write-Host "Running QA Live API Tests (Data-Driven)..." -ForegroundColor Cyan
newman run postman/qa-live-api-tests.postman_collection.json `
  --environment postman/qa-live-api-env.postman_environment.json `
  --iteration-data data/test-data.json `
  --reporters "cli,htmlextra" `
  --reporter-htmlextra-export reports/qa-live-api-newman-report.html