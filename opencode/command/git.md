---
description: Git operations and repository management
agent: build
---

Execute git operations for $ARGUMENTS.

## Git Status Check
Current status: !`git status`
Recent commits: !`git log --oneline -5`

## Common Operations
Based on the request, perform:
- Create meaningful commits with clear messages
- Manage branches following git-flow patterns
- Resolve merge conflicts intelligently
- Clean up commit history when needed
- Tag releases with semantic versioning

## Commit Guidelines
- Use conventional commit format
- Include ticket/issue references
- Keep commits atomic and focused
- Write clear, descriptive messages
- Separate subject from body with blank line

## Branch Management
- Create feature branches from develop/main
- Use descriptive branch names
- Keep branches up to date with base
- Delete merged branches
- Protect critical branches

## Best Practices
- Review changes before committing
- Use .gitignore effectively
- Never commit secrets or credentials
- Maintain linear history when possible
- Document significant changes