# API Test Cases — JSONPlaceholder User API
---
## 1. Test Objective
Validate the functionality and reliability of the JSONPlaceholder User API endpoints.
The testing focuses on:
- correct HTTP responses
- response structure validation
- API data consistency
- error handling behavior
---
## 2. Endpoint Under Test
Base URL:
https://jsonplaceholder.typicode.com
Primary resource:
/users
---
## 3. Test Cases
### TC-API-001 — Retrieve User List
**Endpoint**
GET /users
**Test Objective**
Verify that the API returns a list of users.
**Validation Steps**
1. Send GET request to `/users`
2. Observe HTTP response status
3. Inspect JSON response body
**Expected Results**
- Status code **200 OK**
- Response body contains a JSON array
- The array contains user objects
- Each user object contains:
  - id
  - name
  - username
  - email
### Additional Validations Implemented in Postman
The following automated validations were implemented in Postman test scripts:
- Status code validation (200 OK)
- Response body type validation (array)
- User object field validation (id, name, username, email)
- Response time verification (< 500 ms)
These validations ensure both structural correctness and basic performance 
requirements of the API endpoint.
---
### TC-API-002 — Retrieve Single User
**Endpoint**
GET /users/1
**Test Objective**
Verify that the API returns a single user by ID.
**Expected Results**
- Status code 200 OK
- Response is a single user object
- Object contains id, name, username, email
---
### TC-API-003 — Retrieve Invalid User (Negative Test)
**Endpoint**
GET /users/9999
**Test Objective**
Verify that the API returns 404 for a non-existent user.
**Expected Results**
- Status code 404 Not Found
- Response body is an empty object
---
### TC-API-004 — Create New User
**Endpoint**
POST /users
**Test Objective**
Verify that the API creates a new user and returns correct data.
**Expected Results**
- Status code 201 Created
- Response contains id, name, username, email
- Returned name matches submitted data
---
## 4. Chained Request Test Cases
> These test cases demonstrate dynamic data passing between requests using Postman environment variables and collection variables. The ID returned from the POST request is automatically saved and reused in subsequent GET and DELETE requests.

**Base URL used:** https://dummyjson.com

---
### TC-API-005 — Create User and Save ID (Chained)
**Endpoint**
POST /users/add
**Test Objective**
Create a new user and automatically save the returned ID to a collection variable for use in subsequent requests.
**Postman Script (Post-response)**
```javascript
const response = pm.response.json();
pm.collectionVariables.set("userId", response.id);
console.log("Saved userId:", response.id);
```
**Expected Results**
- Status code 201 Created
- Response contains a valid user ID
- `userId` collection variable is set automatically
**Evidence**
`evidence/week5-day5-collection-runner-chained.png`

---
### TC-API-006 — Retrieve User by Chained ID
**Endpoint**
GET /users/{{userId}}
**Test Objective**
Verify that the saved `userId` from TC-API-005 can be used to retrieve the correct user.
**Postman Script (Post-response)**
```javascript
pm.test("Status is 200", function () {
    pm.response.to.have.status(200);
});
```
**Expected Results**
- Status code 200 OK
- Correct user is returned using the dynamically saved ID
**Evidence**
`evidence/week5-day5-collection-runner-chained.png`

---
### TC-API-007 — Delete User by Chained ID
**Endpoint**
DELETE /users/{{userId}}
**Test Objective**
Verify that the saved `userId` from TC-API-005 can be used to delete the correct user.
**Postman Script (Post-response)**
```javascript
pm.test("Status is 200", function () {
    pm.response.to.have.status(200);
});
pm.test("Response body is empty", function () {
    const response = pm.response.json();
    pm.expect(response).to.eql({});
});
```
**Expected Results**
- Status code 200 OK
- Response body is empty `{}`
- User is successfully deleted using the dynamically saved ID
**Evidence**
`evidence/week5-day5-collection-runner-chained.png`

---
## 5. Notes
- JSONPlaceholder is a read-only fake API — POST/DELETE requests are simulated and do not persist data.
- dummyjson.com was used for chained request tests as it supports POST/DELETE with realistic responses.
- Postman 12 requires **CTRL+S** to save each request before running the Collection Runner. Unsaved requests cause silent failures with misleading "empty URL" errors in the runner.

---
## 6. QA Live API Test Cases (Data-Driven)
> These test cases target the live public REST API at `https://api.testacode.com`.
> The collection was run using Newman with `--iteration-data data/test-data.json`,
> executing 3 iterations with different user payloads per run.
> All 87 assertions passed across 27 requests and 3 iterations.

**Base URL:** https://api.testacode.com
**Collection:** `postman/qa-live-api-tests.postman_collection.json`
**Environment:** `postman/qa-live-api-env.postman_environment.json`
**Iteration Data:** `data/test-data.json`
**Executed:** 2026-03-17

---
### TC-API-008 — GET Health Check
**Endpoint**
GET /health

**Test Objective**
Verify that the API is live and responding correctly.

**Expected Results**
- Status code 200 OK
- Response body contains `{ "status": "ok" }`

**Evidence**
`evidence/week6-day3-TC-API-008-health-check.png`

---
### TC-API-009 — GET List All Users
**Endpoint**
GET /users

**Test Objective**
Verify that the API returns a list of all users.

**Expected Results**
- Status code 200 OK
- Response body is a JSON array
- Each user object contains id, name, username, email

**Evidence**
`evidence/week6-day3-TC-API-009-list-users.png`

---
### TC-API-010 — POST Create User (Data-Driven)
**Endpoint**
POST /users

**Test Objective**
Verify that the API creates a new user for each iteration of the data file.
User payloads are supplied via `data/test-data.json` — one iteration per row.

**Iteration Data**
| Iteration | name | username | email |
|---|---|---|---|
| 1 | Alice Smith | alicesmith | alice.smith@example.com |
| 2 | Bob Jones | bobjones | bob.jones@example.com |
| 3 | Carlo Rossi | carlorossi | carlo.rossi@example.com |

**Postman Script (Post-response)**
```javascript
pm.collectionVariables.set("userId", json.id);
```

**Expected Results**
- Status code 201 Created
- Response contains a valid string name
- Response contains a valid email address
- Response contains a numeric id
- `userId` collection variable is set for chained requests

**Evidence**
`evidence/week6-day3-TC-API-010-post-create-user.png`

---
### TC-API-011 — GET User by ID (Chained)
**Endpoint**
GET /users/{{userId}}

**Test Objective**
Verify that the user created in TC-API-010 can be retrieved by the saved ID.

**Expected Results**
- Status code 200 OK
- Response id matches `userId` collection variable
- Response contains id, name, username, email

**Evidence**
`evidence/week6-day3-TC-API-011-get-user-by-id.png`

---
### TC-API-012 — PATCH Partial Update (Chained)
**Endpoint**
PATCH /users/{{userId}}

**Test Objective**
Verify that a partial update correctly modifies only the supplied fields.

**Request Body**
```json
{
  "phone": "555-9999",
  "website": "updated.example.com"
}
```

**Expected Results**
- Status code 200 OK
- phone is updated to `555-9999`
- website is updated to `updated.example.com`
- id remains unchanged

**Evidence**
`evidence/week6-day3-TC-API-012-patch-partial-update.png`

---
### TC-API-013 — PUT Replace User (Chained)
**Endpoint**
PUT /users/{{userId}}

**Test Objective**
Verify that a full replacement correctly replaces all user fields.

**Request Body**
```json
{
  "name": "Updated {{name}}",
  "username": "updated_{{username}}",
  "email": "updated_{{email}}",
  "phone": "555-0000",
  "website": "updateduser.com"
}
```

**Expected Results**
- Status code 200 OK
- Response name is a non-empty string
- Response email contains @
- id remains unchanged

**Evidence**
`evidence/week6-day3-TC-API-013-put-replace-user.png`

---
### TC-API-014 — DELETE User (Chained)
**Endpoint**
DELETE /users/{{userId}}

**Test Objective**
Verify that the user created in TC-API-010 can be deleted by the saved ID.

**Expected Results**
- Status code 200 OK
- Response message confirms deletion
- Response message includes the deleted user id

**Evidence**
`evidence/week6-day3-TC-API-014-delete-user.png`

---
### TC-API-015 — GET Non-Existent User (404)
**Endpoint**
GET /users/99999

**Test Objective**
Verify that the API returns a 404 error for a non-existent user ID.

**Expected Results**
- Status code 404 Not Found
- Response contains a non-empty detail message
- Detail message references user id 99999

**Evidence**
`evidence/week6-day3-TC-API-015-get-404.png`

---
### TC-API-016 — POST Validation Error (422)
**Endpoint**
POST /users

**Test Objective**
Verify that the API returns a 422 error when an invalid email is submitted.

**Request Body**
```json
{
  "name": "Bad User",
  "username": "baduser",
  "email": "not-a-valid-email"
}
```

**Expected Results**
- Status code 422 Unprocessable Entity
- Response detail is a non-empty array
- Detail array contains an error referencing the email field

**Evidence**
`evidence/week6-day3-TC-API-016-post-422.png`

---
## 7. Notes
- `api.testacode.com` is a live public REST API built as part of this portfolio.
- Source code: https://github.com/GCarlomagno/qa-live-api
- Data-driven testing uses `--iteration-data` in Newman — each row in `test-data.json` becomes one full collection iteration.
- Postman 12 requires **CTRL+S** on each request after any change before running the Collection Runner or exporting. Unsaved requests cause silent failures.
- The API resets to 10 seed users daily at 03:00 UTC via a cron job.