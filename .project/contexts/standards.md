# Coding Standards

## Shell Scripts

### Style Guidelines
- Use `#!/bin/bash` shebang for consistency
- Set error handling: `set -euo pipefail`
- Use meaningful variable names in UPPER_CASE
- Quote all variables: `"${VAR}"`
- Add comments for complex logic

### Example Structure
```bash
#!/bin/bash
set -euo pipefail

# Script description
# Usage: script.sh [options]

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${HOME}/.config"

# Main logic
main() {
    # Implementation
}

main "$@"
```

## Python Scripts

### Standards
- Python 3.x compatibility required
- Follow PEP 8 style guide
- Use type hints where beneficial
- Include docstrings for functions

### Example Structure
```python
#!/usr/bin/env python3
"""Module description."""

import sys
from typing import List

def main() -> None:
    """Main entry point."""
    pass

if __name__ == "__main__":
    main()
```

## Configuration Files

### TOML Files
- Use consistent indentation (2 spaces)
- Group related settings
- Add comments for non-obvious settings

### Kitty Configuration
- Organize by feature sections
- Document custom key mappings
- Keep theme definitions separate

## Git Practices
- Write clear commit messages
- Test configurations before committing
- Use feature branches for major changes
- Keep sensitive data out of version control