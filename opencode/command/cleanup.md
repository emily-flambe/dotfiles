---
description: Clean up code, dependencies, and project structure
agent: build
---

Clean up and optimize $ARGUMENTS for maintainability.

## Cleanup Areas
1. Remove unused code and dead code paths
2. Clean up dependencies and package files
3. Organize file structure and naming
4. Remove debugging code and console logs
5. Clean up temporary files and caches

## Code Cleanup
- Remove commented-out code blocks
- Delete unused imports and variables
- Consolidate duplicate code
- Fix linting issues and warnings
- Standardize formatting

## Dependency Management
Check for unused dependencies: !`npm ls --depth=0 || pip list`

- Remove unused dependencies
- Update outdated packages safely
- Consolidate similar packages
- Document why each dependency is needed

## File Organization
- Group related files together
- Use consistent naming conventions
- Remove empty directories
- Archive old or deprecated code
- Update .gitignore appropriately