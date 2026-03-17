#!/bin/bash

# ============================================================
# Newman Test Runner — api-testing-portfolio
# Usage: ./run-tests.sh
# ============================================================

COLLECTION="postman/api-testing-collection.json"
ENVIRONMENT="postman/api-testing-environment2.json"
REPORT_DIR="newman"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

echo "Starting Newman test run at $TIMESTAMP"

newman run "$COLLECTION" \
  --environment "$ENVIRONMENT" \
  --reporters "cli,htmlextra" \
  --reporter-htmlextra-export "$REPORT_DIR/report-$TIMESTAMP.html" \
  --delay-request 300 \
  --bail

EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
  echo "All tests passed."
else
  echo "One or more tests failed. Exit code: $EXIT_CODE"
fi

exit $EXIT_CODE

# ── QA Live API Tests (Data-Driven) ───────────────────────────────────────────
echo "Running QA Live API Tests (Data-Driven)..."
newman run postman/qa-live-api-tests.postman_collection.json \
  --environment postman/qa-live-api-env.postman_environment.json \
  --iteration-data data/test-data.json \
  --reporters "cli,htmlextra" \
  --reporter-htmlextra-export reports/qa-live-api-newman-report.html