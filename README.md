# 🔌 API Testing Portfolio Project

**Test Cycle Version:** 1.0
**Test Execution Period:** 2026-03-08 – Present
**Tester:** GCarlomagno

---

## 📌 Project Overview

This repository demonstrates a structured API testing cycle executed against a public REST API (JSONPlaceholder).

The objective of this test cycle is to validate API endpoint behavior across positive and negative scenarios, including status code validation, response structure verification, and request body validation.

The project includes full QA documentation artifacts:

- Structured API Test Cases
- Postman Collection with automated test scripts
- Execution Evidence (screenshots)

All artifacts follow standardized documentation conventions to simulate real project-level QA execution.

---

## 🛠 API Under Test

The API under test is JSONPlaceholder, a free public REST API used for testing and prototyping.

It provides multiple endpoints simulating a real backend, including users, posts, comments, and more.

The API was used to validate real-world API testing scenarios including GET and POST requests, response validation, and negative/error handling.

---

## 🧪 Testing Scope

### Included

- GET request validation (list and single resource)
- POST request validation with request body
- Status code verification (200, 201, 404)
- Response structure and field validation
- Negative testing (invalid resource, 404 handling)
- Response data matching (sent data vs returned data)

### Excluded

- Authentication and authorization testing
- Performance and load testing
- Security testing
- DELETE and PUT request validation (planned for future cycles)

---

## 🔍 Testing Approach

Testing was performed using a structured manual API testing methodology including:

- Endpoint validation using Postman
- Automated test scripts using Postman post-response scripting (pm.test)
- Positive scenario validation
- Negative and edge case testing
- Response body structure and field verification
- Execution evidence captured via screenshots

---

## 📂 Repository Structure

The documentation is organized according to the QA lifecycle:

- `/docs/` – API test case documentation
- `/evidence/` – Screenshots of test execution results
- `/postman/` – Exported Postman collection

---

## 🎯 Skills Demonstrated

- REST API testing with Postman
- GET and POST request validation
- Status code verification
- Response body structure validation
- Negative testing and error handling
- Automated assertions using Postman scripting
- Test case documentation for API scenarios
- Execution evidence collection

---

## 🧪 Test Execution Results

| Metric | Result |
|--------|--------|
| Total Test Cases Designed | 4 |
| Total Test Cases Executed | 4 |
| Passed | 4 |
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

Full test case documentation is available in [docs/API-Test-Cases.md](docs/API-Test-Cases.md).
