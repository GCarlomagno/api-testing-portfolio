# 🔌 API Testing Portfolio Project
![API Tests](https://github.com/GCarlomagno/api-testing-portfolio/actions/workflows/api-tests.yml/badge.svg)
**Test Cycle Version:** 1.5
**Test Execution Period:** 2026-03-08 – 2026-03-19
**Tester:** GCarlomagno

---

## 📌 Project Overview
This repository demonstrates a structured API testing cycle executed against public REST APIs (JSONPlaceholder and DummyJSON) and a live custom REST API deployed on a personal VPS.

The objective of this test cycle is to validate API endpoint behavior across positive and negative scenarios, including status code validation, response structure verification, request body validation, dynamic request chaining, and data-driven testing using Newman iteration data files.

The project includes full QA documentation artifacts:
- Structured API Test Cases
- Postman Collections with automated test scripts
- Execution Evidence (screenshots)
- Newman CLI execution and HTML reports
- Reusable run scripts for local and CI execution
- Data-driven test execution using `--iteration-data`

All artifacts follow standardized documentation conventions to simulate real project-level QA execution.

---

## 🛠 APIs Under Test

### JSONPlaceholder
A free public REST API used for testing and prototyping. Used to validate GET and POST request scenarios, response validation, and negative/error handling.

### DummyJSON
A free public REST API supporting persistent-style POST and DELETE responses. Used to validate dynamic request chaining across multiple endpoints.

### QA Live API
A live custom REST API built and deployed as part of this portfolio at `https://api.testacode.com`. Supports full CRUD operations with real SQLite persistence. Used to validate data-driven testing, request chaining, and negative scenarios against a real live backend.

- **Swagger UI:** https://api.testacode.com/docs
- **Source code:** https://github.com/GCarlomagno/qa-live-api

---

## 🧪 Testing Scope

### Included
- GET request validation (list and single resource)
- POST request validation with request body
- PUT request validation (full replacement)
- PATCH request validation (partial update)
- DELETE request validation
- Status code verification (200, 201, 404, 409, 422)
- Response structure and field validation
- Negative testing (invalid resource, 404 handling)
- Validation error testing (422 Unprocessable Entity)
- Response data matching (sent data vs returned data)
- Dynamic request chaining using Postman collection variables
- Data-driven testing using Newman `--iteration-data`
- Automated Collection Runner execution
- Newman CLI execution and HTML report generation
- Reusable shell and PowerShell run scripts

### Excluded
- Authentication and authorization testing
- Performance and load testing
- Security testing

---

## 🔍 Testing Approach
Testing was performed using a structured manual and automated API testing methodology including:
- Endpoint validation using Postman
- Automated test scripts using Postman post-response scripting (pm.test)
- Dynamic data passing between requests using `pm.collectionVariables`
- Data-driven testing using Newman `--iteration-data` with `data/test-data.json`
- Positive scenario validation
- Negative and edge case testing
- Response body structure and field verification
- Collection Runner for automated sequential execution
- Newman CLI for terminal-based execution
- Reusable run scripts for consistent local and CI execution
- Execution evidence captured via screenshots

---

## 🚀 Running Tests via Newman CLI

### Prerequisites
- [Node.js](https://nodejs.org) v18+
- Newman: `npm install -g newman`
- Newman HTML Reporter: `npm install -g newman-reporter-htmlextra`

### Option 1 — Run script (recommended)

**Windows (PowerShell):**
```powershell
.\run-tests.ps1
```

**Linux / CI:**
```bash
./run-tests.sh
```

### Option 2 — Run JSONPlaceholder collection manually
```bash
newman run postman/api-testing-collection.json \
  -e postman/api-testing-environment2.json \
  --reporters "cli,htmlextra" \
  --reporter-htmlextra-export reports/jsonplaceholder-report.html
```

### Option 3 — Run QA Live API collection (data-driven)
```bash
newman run postman/qa-live-api-tests.postman_collection.json \
  --environment postman/qa-live-api-env.postman_environment.json \
  --iteration-data data/test-data.json \
  --reporters "cli,htmlextra" \
  --reporter-htmlextra-export reports/qa-live-api-newman-report.html
```

This runs the full collection 3 times — once per row in `data/test-data.json`.

---

## ⚙️ CI Integration

This project uses GitHub Actions to automatically run the Newman test suite on every push to `main`.

**Workflow file:** `.github/workflows/api-tests.yml`
**Runner:** `ubuntu-latest`
**Trigger:** Push to `main`, pull requests, manual dispatch
**Collection:** QA Live API (data-driven, 3 iterations, 87 assertions)
**Artifact:** HTML report uploaded on every run (pass or fail)

Pushes to `evidence/`, `docs/`, and `*.md` files are ignored to avoid unnecessary runs.

### Viewing results
1. Go to the [Actions tab](https://github.com/GCarlomagno/api-testing-portfolio/actions)
2. Click any workflow run
3. Click the `api-tests` job to see step-by-step logs
4. Scroll to the bottom of the run summary to download the HTML report artifact

---

## ⚠️ Known Issues

### Postman 12 Collection Runner — Silent Failure Bug
In Postman 12.1.1, unsaved requests fail silently in the Collection Runner with misleading errors such as "empty URL", while working correctly with manual Send.

**Workaround:** Always press `CTRL+S` on each request after any change before running the Collection Runner or exporting the collection.

---

## 📂 Repository Structure
- `/data/` — Iteration data files for Newman data-driven runs
- `/docs/` — API test case documentation
- `/evidence/` — Screenshots of test execution results
- `/postman/` — Exported Postman collections and environment files
- `/reports/` — Newman HTML execution reports
- `run-tests.ps1` — Reusable Newman run script for Windows
- `run-tests.sh` — Reusable Newman run script for Linux/CI
- `/.github/workflows/` — GitHub Actions pipeline files

---

## 🎯 Skills Demonstrated
- REST API testing with Postman
- Full CRUD request validation (GET, POST, PUT, PATCH, DELETE)
- Status code verification (200, 201, 404, 409, 422)
- Response body structure validation
- Negative testing and error handling
- Validation error testing (422)
- Conflict error testing (409)
- Automated assertions using Postman scripting
- Dynamic request chaining using collection variables
- Data-driven testing using Newman `--iteration-data`
- Collection Runner execution and validation
- Newman CLI execution and HTML report generation
- Reusable run scripts for local and CI execution
- Test case documentation for API scenarios
- Execution evidence collection
- Live API deployment and testing against real persistence
- CI integration using GitHub Actions (automated Newman execution on push)

---

## 🧪 Test Execution Results

### JSONPlaceholder Collection
| Metric | Result |
|--------|--------|
| Total Test Cases Designed | 7 |
| Total Test Cases Executed | 7 |
| Passed | 7 |
| Failed | 0 |
| Defects Identified | 0 |

### QA Live API Collection (Data-Driven)
| Metric | Result |
|--------|--------|
| Total Test Cases Designed | 9 |
| Total Test Cases Executed | 9 |
| Iterations | 3 |
| Total Assertions | 87 |
| Passed | 87 |
| Failed | 0 |
| Defects Identified | 0 |

---

## 📑 Test Cases

### JSONPlaceholder Collection
| Test Case ID | Endpoint | Type | Status |
|-------------|----------|------|--------|
| TC-API-001 | GET /users | Positive | ✅ Passed |
| TC-API-002 | GET /users/1 | Positive | ✅ Passed |
| TC-API-003 | GET /users/9999 | Negative | ✅ Passed |
| TC-API-004 | POST /users | Positive | ✅ Passed |
| TC-API-005 | POST /users/add (Chained) | Positive | ✅ Passed |
| TC-API-006 | GET /users/{{userId}} (Chained) | Positive | ✅ Passed |
| TC-API-007 | DELETE /users/{{userId}} (Chained) | Positive | ✅ Passed |

### QA Live API Collection
| Test Case ID | Endpoint | Type | Status |
|-------------|----------|------|--------|
| TC-API-008 | GET /health | Positive | ✅ Passed |
| TC-API-009 | GET /users | Positive | ✅ Passed |
| TC-API-010 | POST /users (Data-Driven) | Positive | ✅ Passed |
| TC-API-011 | GET /users/{{userId}} (Chained) | Positive | ✅ Passed |
| TC-API-012 | PATCH /users/{{userId}} (Chained) | Positive | ✅ Passed |
| TC-API-013 | PUT /users/{{userId}} (Chained) | Positive | ✅ Passed |
| TC-API-014 | DELETE /users/{{userId}} (Chained) | Positive | ✅ Passed |
| TC-API-015 | GET /users/99999 | Negative | ✅ Passed |
| TC-API-016 | POST /users (invalid email) | Negative | ✅ Passed |

Full test case documentation is available in [docs/API-Test-Cases.md](docs/API-Test-Cases.md).