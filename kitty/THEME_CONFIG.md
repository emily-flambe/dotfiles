# Kitty Theme Configuration

The kitty theme switcher automatically changes your terminal theme based on the current directory.

## Configuration Files

### Public Themes: `theme-mappings.json`

This file contains theme mappings for public projects and directories. It's committed to the repository.

**Format:**
```json
{
  "mappings": [
    {
      "path": "$HOME/Documents/GitHub",
      "theme": "Ubuntu"
    },
    {
      "pattern": "*dotfiles*",
      "theme": "Red Sands"
    }
  ]
}
```

### Private Themes: `theme-mappings-private.json`

This file contains theme mappings for private/work projects. It's gitignored and won't be committed.

1. Copy the example file: `cp theme-mappings-private.json.example theme-mappings-private.json`
2. Edit `theme-mappings-private.json` with your private project mappings

## Configuration Options

- **`path`**: Exact directory path (use `$HOME` for home directory)
- **`pattern`**: Pattern matching with wildcards (`*project-name*`)
- **`theme`**: Theme name (without .conf extension)

## Priority

1. Private mappings are checked first
2. Public mappings are checked if no private match is found
3. No theme change if no match is found

## Adding New Themes

1. Place theme `.conf` files in the `kitty/themes/` directory
2. Add mapping to appropriate configuration file
3. Theme changes apply immediately when you `cd` to the directory

## Dependencies

- **jq** (optional): For better JSON parsing performance
- **python3**: Fallback JSON parser (pre-installed on macOS)