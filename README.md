# littools

🧼 A minimal wrapper to filter out tools from Claude MCP `list/tools` responses.

## Usage

Wrap any MCP tool with this script:

```bash
LITTOOLS_EXCLUDE=Tool1,Tool2 ./littools <your-mcp-command> [args...]
```

Example:

```bash
LITTOOLS_EXCLUDE=Bash,Replace ./littools claude mcp serve
```

## Env

- LITTOOLS_EXCLUDE: Comma-separated list of tool names to exclude from list/tools

## How it works

This script:

- Launches the given MCP command
- Intercepts its stdout
- Filters out matching tools (by .name) from list/tools responses
- Outputs valid single-line JSON (Claude-safe)

## Requirements

- bash
- jq

## Notes

This is intended to be used as a wrapper in claude_desktop_config.json.
