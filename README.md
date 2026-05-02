# Claude Chrome Automation for Windows

One-click Claude Code + Chrome DevTools MCP launcher for Windows.

This project packages a practical Windows workflow into a reusable template:

- Dedicated Chrome instance with remote debugging on `127.0.0.1:9222`
- Two launch modes:
  - `limited`: safer, browser-first automation
  - `full-auto`: fewer interruptions, higher risk
- Project-local MCP config, so users do not need to manually edit global Claude MCP settings
- Relative-path launch scripts, so the folder can be moved anywhere

## Why this is useful

On native Windows, Claude Code + local MCP servers are often less smooth than on macOS/Linux because:

- `npx`-based MCP startup is more fragile
- users want browser automation without opening up the whole terminal
- users want a single clickable entry instead of multiple setup steps

This project turns that into a portable pattern:

1. Start a dedicated Chrome debug profile
2. Connect Claude Code to that browser via MCP
3. Choose between a limited mode and a full-auto mode

## What makes this setup different

### 1. Native Windows first

This is designed specifically for Windows, not adapted from a Unix-first setup.

- Uses `cmd /c npx ...` for MCP startup
- Uses `.bat` launchers for double-click usage
- Works with Windows paths and profile handling

### 2. Two-mode automation

Most examples stop at "make Claude control Chrome".

This project adds a useful product layer:

- `limited` mode
  - allows browser automation
  - blocks general `Bash`
  - blocks `WebFetch`
  - keeps Claude focused on browser work

- `full-auto` mode
  - launches Claude Code with `--dangerously-skip-permissions`
  - best for advanced users who want less interruption

### 3. Dedicated browser profile

The launcher uses a dedicated Chrome profile directory:

- login state is preserved
- cookies are preserved
- browser automation is isolated from the user's normal browser

### 4. Plug-and-play packaging

Users can download the folder and launch it directly after they have:

- Claude Code installed
- Node.js installed
- Google Chrome installed

No manual MCP editing is required because the launcher passes a local MCP config at runtime.

## Folder structure

```text
claude-chrome-automation-windows/
  README.md
  README.zh-CN.md
  launch-limited.bat
  launch-full-auto.bat
  config/
    chrome-devtools.mcp.json
    limited-settings.json
  scripts/
    start-chrome-debug-9222.bat
```

## Requirements

- Windows
- Claude Code installed and available as `claude`
- Node.js and `npx`
- Google Chrome

## Quick start

### Limited mode

Double-click:

- `launch-limited.bat`

This mode is recommended for most users.

### Full-auto mode

Double-click:

- `launch-full-auto.bat`

This mode is more aggressive and less safe.

## First login

The first time you launch the dedicated Chrome window, log into the sites you need inside that window.

That login state is usually preserved for future launches.

## How it works

### Dedicated Chrome instance

The script starts Chrome with:

- remote debugging enabled on `127.0.0.1:9222`
- a dedicated user-data directory under the current Windows user profile

### Claude + project-local MCP

Instead of relying on global Claude MCP configuration, this project passes:

- `--mcp-config config\\chrome-devtools.mcp.json`

This makes the package easier to share.

### Limited mode permissions

`limited` mode passes:

- `--settings config\\limited-settings.json`

That config:

- allows all tools from the local `chrome_devtools` MCP server
- denies `Bash`
- denies `WebFetch`
- uses `acceptEdits`

## Security notes

### Limited mode

Lower risk than full-auto, but not risk-free.

Claude can still:

- browse pages
- click buttons
- read visible page content
- interact with logged-in sites inside the dedicated browser

### Full-auto mode

This mode is intentionally high-trust.

Claude Code is launched with:

- `--dangerously-skip-permissions`

Use it only when you understand the implications.

## Common use cases

- open a page and summarize its contents
- log into a web tool once, then reuse that session
- click through repetitive browser tasks
- capture screenshots
- pull structured data from browser-visible pages

## Troubleshooting

### Chrome opens but Claude cannot browse

Check:

- Chrome is running
- port `9222` is available
- Claude Code is installed
- `npx` is available

### Claude asks to log in repeatedly

Make sure you logged into the dedicated Chrome window, not your normal Chrome window.

## Notes for publishing

If you want to distribute this as a repo:

- keep the launcher filenames stable
- avoid user-specific absolute paths
- do not commit personal Chrome profile data

