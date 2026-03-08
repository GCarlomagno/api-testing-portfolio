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