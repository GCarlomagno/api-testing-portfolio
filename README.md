Set-Content -Path "README.md" -Encoding utf8 -Value @"
# 🔌 API Testing Portfolio Project
**Test Cycle Version:** 1.2
**Test Execution Period:** 2026-03-08 – 2026-03-15
**Tester:** GCarlomagno
---
## 📌 Project Overview
This repository demonstrates a structured API testing cycle executed against public REST APIs (JSONPlaceholder and DummyJSON).
The objective of this test cycle is to validate API endpoint behavior across positive and negative scenarios, including status code validation, response structure verification, request body validation, and dynamic request chaining.
The project includes full QA documentation artifacts:
- Structured API Test Cases
- Postman Collection with automated test scripts
- Execution Evidence (screenshots)
- Newman CLI execution and HTML reports
All artifacts follow standardized documentation conventions to simulate real project-level QA execution.
---
## 🛠 API Under Test
### JSONPlaceholder
A free public REST API used for testing and prototyping. Used to validate GET and POST request scenarios, response validation, and negative/error handling.
### DummyJSON
A free public REST API supporting persistent-style POST and DELETE responses. Used to validate dynamic request chaining across multiple endpoints.
---
## 🧪 Testing Scope
### Included
- GET request validation (list and single resource)
- POST request validation with request body
- DELETE request validation
- Status code verification (200, 201, 404)
- Response structure and field validation
- Negative testing (invalid resource, 404 handling)
- Response data matching (sent data vs returned data)
- Dynamic request chaining using Postman collection variables
- Automated Collection Runner execution
- Newman CLI execution and HTML report generation
### Excluded
- Authentication and authorization testing
- Performance and load testing
- Security testing
- PUT request validation (planned for future cycles)
---
## 🔍 Testing Approach
Testing was performed using a structured manual and automated API testing methodology including:
- Endpoint validation using Postman
- Automated test scripts using Postman post-response scripting (pm.test)
- Dynamic data passing between requests using \`pm.collectionVariables\`
- Positive scenario validation
- Negative and edge case testing
- Response body structure and field verification
- Collection Runner for automated sequential execution
- Newman CLI for terminal-based execution
- Execution evidence captured via screenshots
---
## 🚀 Running Tests via Newman CLI
### Prerequisites
- [Node.js](https://nodejs.org) v24+
- Newman: \`npm install -g newman\`
- Newman HTML Reporter: \`npm install -g newman-reporter-htmlextra\`
### Run Collection (terminal output only)
\`\`\`bash
newman run api-testing-collection.json -e api-testing-environment2.json
\`\`\`
### Run Collection (with HTML report)
\`\`\`bash
newman run api-testing-collection.json -e api-testing-environment2.json -r htmlextra --reporter-htmlextra-export reports/newman-report.html
\`\`\`
Report will be generated at \`reports/newman-report.html\`.
---
## 📂 Repository Structure
The documentation is organized according to the QA lifecycle:
- \`/docs/\` – API test case documentation
- \`/evidence/\` – Screenshots of test execution results
- \`/postman/\` – Exported Postman collection
- \`/reports/\` – Newman HTML execution reports
---
## 🎯 Skills Demonstrated
- REST API testing with Postman
- GET, POST and DELETE request validation
- Status code verification
- Response body structure validation
- Negative testing and error handling
- Automated assertions using Postman scripting
- Dynamic request chaining using collection variables
- Collection Runner execution and validation
- Newman CLI execution and HTML report generation
- Test case documentation for API scenarios
- Execution evidence collection
---
## 🧪 Test Execution Results
| Metric | Result |
|--------|--------|
| Total Test Cases Designed | 7 |
| Total Test Cases Executed | 7 |
| Passed | 7 |
| Failed | 0 |
| Defects Identified | 0 |
---
## 📑 Test Cases
| Test Case ID | Endpoint | Type | Status |
|-------------|----------|------|--------|
| TC-API-001 | GET /users | Positive | ✅ Passed |
| TC-API-002 | GET /users/1 | Positive | ✅ Passed |
| TC-API-003 | GET /users/9999 | Negative | ✅ Passed |
| TC-API-004 | POST /users | Positive | ✅ Passed |
| TC-API-005 | POST /users/add (Chained) | Positive | ✅ Passed |
| TC-API-006 | GET /users/{{userId}} (Chained) | Positive | ✅ Passed |
| TC-API-007 | DELETE /users/{{userId}} (Chained) | Positive | ✅ Passed |
Full test case documentation is available in [docs/API-Test-Cases.md](docs/API-Test-Cases.md).
"@