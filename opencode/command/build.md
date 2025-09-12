---
description: Build and compile project with optimal configuration
agent: build
---

Build $ARGUMENTS with optimal configuration and performance.

## Build Process
1. Analyze project type and structure
2. Detect build system (npm, yarn, make, cargo, etc.)
3. Execute appropriate build commands
4. Validate build output and artifacts
5. Report build status and any issues

## Build Optimizations
- Enable production optimizations
- Minimize bundle sizes
- Apply tree-shaking where applicable
- Configure source maps appropriately
- Set proper environment variables

## Error Handling
- Capture and display build errors clearly
- Suggest fixes for common build issues
- Validate dependencies before building
- Check for version mismatches

Show build output: !`npm run build || yarn build || make build`