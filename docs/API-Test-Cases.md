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