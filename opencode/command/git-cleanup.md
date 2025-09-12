---
description: Clean up git repository and history
agent: build
---

Clean up git repository for $ARGUMENTS.

## Repository Status
Current branches: !`git branch -a`
Repository size: !`du -sh .git`

## Cleanup Operations
1. Remove merged branches
2. Clean up remote tracking branches
3. Garbage collect and optimize repository
4. Remove large files from history (if needed)
5. Clean up tags and references

## Branch Cleanup
- Delete fully merged local branches
- Prune remote tracking branches
- Archive old feature branches
- Update default branch if needed

## History Cleanup
When appropriate:
- Squash related commits
- Fix commit messages
- Remove sensitive data
- Reduce repository size

## Optimization
Execute cleanup: !`git gc --aggressive --prune=now`
Remove untracked: !`git clean -fdx --dry-run`

## Best Practices
- Always backup before major cleanup
- Coordinate with team members
- Document cleanup actions
- Update CI/CD configurations
- Verify nothing critical is lost