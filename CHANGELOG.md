# Changelog

## 2026-05-02

### Initial project packaging

- Extracted the local Windows browser automation setup into a standalone reusable project.
- Replaced machine-specific absolute paths with portable relative-path launchers.
- Added a dedicated Chrome debug launcher on `127.0.0.1:9222`.
- Added two launch modes:
  - `launch-limited.bat`
  - `launch-full-auto.bat`
- Added project-local MCP config in `config/chrome-devtools.mcp.json`.
- Added limited-mode Claude permission config in `config/limited-settings.json`.

### Windows-focused workflow design

- Structured the project around native Windows `.bat` entrypoints.
- Kept a dedicated browser profile model so login state can persist across launches.
- Positioned the project as a practical Windows template instead of a generic MCP demo.

### Documentation

- Added `README.md` for the English project homepage.
- Added `README.zh-CN.md` for Chinese documentation.
- Expanded README structure with:
  - quick overview
  - mode comparison
  - installation steps
  - troubleshooting notes
  - security notes
- Added visual assets:
  - `assets/hero.svg`
  - `assets/flow.svg`

### GitHub publishing

- Created the public GitHub repository:
  - `https://github.com/davidchen99/claude-chrome-automation-windows`
- Switched the repository default branch to `main`.
- Added repository description and GitHub topics.
- Added the MIT license.

### Positioning and productization

- Clarified the project’s main innovation points:
  - Windows-native launch flow
  - double-click browser automation entry
  - limited vs full-auto mode split
  - persistent login profile isolation
  - plug-and-play local MCP packaging
