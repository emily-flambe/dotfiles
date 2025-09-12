---
description: Troubleshoot issues and debug problems
agent: build
---

Troubleshoot and debug $ARGUMENTS.

## Diagnostic Process
1. Gather error messages and symptoms
2. Check logs and system state
3. Identify potential root causes
4. Test hypotheses systematically
5. Provide solution and prevention steps

## Information Gathering
Check relevant logs: !`tail -50 *.log 2>/dev/null || echo "No log files found"`
System status: !`ps aux | grep -E "node|python|java" | head -5`

## Common Issues to Check
- Configuration errors
- Missing dependencies
- Permission problems
- Network connectivity
- Resource constraints
- Version incompatibilities

## Debugging Techniques
- Add strategic logging
- Use debugger breakpoints
- Binary search for issues
- Isolate problem components
- Check recent changes

## Solution Approach
- Provide immediate workaround if available
- Document root cause analysis
- Suggest permanent fix
- Include prevention measures
- Add monitoring recommendations