---
description: Run tests with coverage and analysis
agent: build
---

Execute test suite for $ARGUMENTS with comprehensive analysis.

## Testing Strategy
1. Detect testing framework (jest, pytest, go test, etc.)
2. Run full test suite with coverage reporting
3. Analyze test failures and provide fixes
4. Identify gaps in test coverage
5. Suggest additional test cases

## Test Execution
Show test results: !`npm test -- --coverage || yarn test --coverage || pytest --cov || go test -cover ./...`

## Analysis Focus
- Failed tests with root cause analysis
- Coverage gaps in critical code paths
- Performance bottlenecks in tests
- Test code quality and maintainability
- Missing edge case coverage

## Recommendations
- Prioritize fixing failing tests
- Add tests for uncovered critical paths
- Improve test performance where needed
- Refactor complex test setups
- Add integration tests for key workflows