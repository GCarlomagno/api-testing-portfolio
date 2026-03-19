# Week 6 Reflection — API Testing & CI Integration

**Period:** 2026-03-15 – 2026-03-19
**Tester:** GCarlomagno

## What Was Tested and How

Week 6 focused on Newman CLI execution and CI pipeline integration for the QA Live API
(`api.testacode.com`). The full collection of 9 test cases (TC-API-008 through TC-API-016)
was executed via Newman with data-driven iteration using `--iteration-data`, producing
87 assertions across 3 iterations. A GitHub Actions workflow was built to run the
collection automatically on every push to `main`, upload the HTML report as an artifact,
and fail the pipeline on assertion errors.

## CTFL Principles Demonstrated

- **Testing shows the presence of defects, not their absence** — 87 passing assertions
  confirm expected behavior but do not guarantee the API is defect-free.
- **Exhaustive testing is impossible** — the data file covers 3 user payloads; edge cases
  such as special characters, maximum field lengths, and concurrent requests are not covered.
- **Early testing** — automated execution on every push catches regressions at the earliest
  possible point in the development cycle.
- **Defect clustering** — the 422 and 404 negative test cases target the endpoints most
  likely to expose validation and routing defects.

## What CI Adds to the Testing Process

The GitHub Actions pipeline removes the need for manual Newman execution on every change.
Any regression introduced by an API update is detected immediately on push, with logs and
an HTML report available directly in the Actions tab. The pipeline also validates the
test infrastructure itself — confirming that Node.js, Newman, and the reporter install
correctly on a clean Ubuntu runner on every run.

## Limitations Noted

- **Pesticide paradox** — the same 9 test cases run on every push. Over time, defects that
  fall outside these scenarios will not be detected without expanding the test suite.
- **Environment dependency** — the pipeline depends on `api.testacode.com` being live.
  A VPS outage would cause the pipeline to fail for infrastructure reasons unrelated to
  code quality.
- **Data scope** — 3 iterations cover basic variation but do not constitute thorough
  boundary or equivalence partition testing.