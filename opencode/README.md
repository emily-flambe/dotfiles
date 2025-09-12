# OpenCode Custom Commands

A collection of powerful custom commands for [OpenCode](https://opencode.ai), inspired by SuperClaude's command system.

## Installation

Install all OpenCode commands and configuration:

```bash
make opencode
```

This will:
1. Install all custom commands to `~/.config/opencode/command/`
2. Configure OpenCode with a transparent theme (respects kitty themes)
3. Set up optimal keybindings and permissions

## Configuration

The installation includes:
- **Theme**: System theme for transparency (works with custom kitty themes)
- **Model**: Claude 3.5 Sonnet (latest)
- **Permissions**: Full write and bash execution permissions (no approval prompts)
  - File editing: Allowed without confirmation
  - Bash commands: All commands allowed without confirmation
- **Keybinds**: Optimized keyboard shortcuts for common actions

## Available Commands

### Core Development Commands

#### `/analyze` - Code Analysis
Comprehensive code quality, security, and performance analysis.
```
/analyze [file or directory]
/analyze src/
```

#### `/implement` - Feature Implementation
Intelligent feature implementation with best practices.
```
/implement user authentication system
/implement React component with TypeScript
```

#### `/build` - Build Management
Execute builds with optimal configuration.
```
/build
/build production
```

#### `/test` - Test Execution
Run tests with coverage analysis and failure debugging.
```
/test
/test specific-module
```

### Code Quality Commands

#### `/improve` - Code Improvement
Optimize code quality, performance, and security.
```
/improve database queries
/improve component performance
```

#### `/cleanup` - Code Cleanup
Remove dead code, organize files, and manage dependencies.
```
/cleanup
/cleanup dependencies
```

#### `/document` - Documentation Generation
Create comprehensive documentation.
```
/document API endpoints
/document component library
```

### Git & Collaboration Commands

#### `/git` - Git Operations
Manage git repository operations.
```
/git commit with message
/git create feature branch
```

#### `/git-cleanup` - Repository Cleanup
Clean up branches, history, and optimize repository.
```
/git-cleanup
/git-cleanup branches
```

#### `/pr-review` - Pull Request Review
Comprehensive PR analysis and feedback.
```
/pr-review PR-123
/pr-review current branch
```

### Project Management Commands

#### `/task` - Complex Task Management
Execute complex tasks with workflow management.
```
/task implement payment system
/task refactor authentication flow
```

#### `/workflow` - Workflow Design
Design and implement complex workflows.
```
/workflow user onboarding process
/workflow data pipeline
```

#### `/estimate` - Effort Estimation
Estimate complexity and effort for tasks.
```
/estimate new feature implementation
/estimate migration project
```

### Utility Commands

#### `/explain` - Code Explanation
Detailed explanations of code functionality.
```
/explain authentication middleware
/explain database schema
```

#### `/troubleshoot` - Problem Solving
Debug issues and find solutions.
```
/troubleshoot build error
/troubleshoot performance issue
```

#### `/design` - Architecture Design
Design system architecture and components.
```
/design microservices architecture
/design component library structure
```

#### `/readme` - README Generation
Create or update project documentation.
```
/readme
/readme for npm package
```

## Command Features

### Dynamic Content
Commands support special placeholders:
- `$ARGUMENTS` - Replaced with command arguments
- `!`command`` - Execute shell commands and include output
- `@file` - Include file contents in the prompt

### Agent Selection
Commands use appropriate agents:
- **build**: For implementation and code changes
- **plan**: For design and analysis without changes

## Customization

### Adding New Commands
Create a new markdown file in `opencode/command/`:

```markdown
---
description: Your command description
agent: build
---

Your command prompt template here.
Use $ARGUMENTS for dynamic input.
```

### Modifying Commands
Edit any command file in `opencode/command/` and reinstall:
```bash
make opencode
```

### Importing Changes
Import your current OpenCode configuration:
```bash
make opencode ACTION=import
```

## Theme Compatibility

The configuration uses `"theme": "system"` to ensure transparency, allowing your custom kitty terminal themes to show through properly.

## Tips

1. **Use specific arguments**: Commands work best with clear, specific inputs
2. **Combine commands**: Chain commands for complex workflows
3. **Check output**: Commands that use `!`command`` show real-time command output
4. **Iterate**: Use `/improve` after `/implement` for better code quality

## Troubleshooting

If commands aren't working:
1. Ensure OpenCode is installed: `which opencode`
2. Check config location: `ls ~/.config/opencode/`
3. Verify command installation: `ls ~/.config/opencode/command/`
4. Reinstall: `make opencode`

## Contributing

To add or improve commands:
1. Edit files in `opencode/command/`
2. Test locally with `make opencode`
3. Import working config: `make opencode ACTION=import`
4. Commit changes to the repository