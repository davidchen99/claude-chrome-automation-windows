# Claude Chrome Automation for Windows

这是一个给 Windows 用户准备的 Claude Code 浏览器自动化启动模板。

核心目标只有一个：

把原本分散的配置步骤，整理成“下载后双击即可启动”的形式。

## 这个项目解决了什么问题

在 Windows 上，用 Claude Code 操控 Chrome，常见痛点有：

- `npx` 启动本地 MCP 服务不够稳定
- 想让 Claude 自动操作浏览器，但不想默认放开整个终端
- 普通用户不想自己手改 Claude 配置文件
- 希望一键启动，而不是每次都手工开 Chrome 调试端口

这个项目把这些问题合并解决：

1. 自动启动专用 Chrome 调试实例
2. 自动让 Claude Code 连接到这个浏览器
3. 提供两种模式：受限版、全自动版

## 创新点

### 1. 明确面向 Windows

很多教程是 Linux/macOS 逻辑，Windows 用户照着做经常会卡。

这个模板从一开始就按 Windows 设计：

- 使用 `cmd /c npx`
- 使用 `.bat` 双击启动
- 处理 Windows 下的路径和 Chrome 启动方式

### 2. 把“浏览器自动化”做成双模式产品

这不是单纯把 Claude 连上 Chrome。

而是把它做成两个可选入口：

#### 受限模式

- 优先放开浏览器自动化能力
- 限制通用终端命令
- 限制 `WebFetch`
- 更适合日常使用

#### 全自动模式

- 直接启用 `--dangerously-skip-permissions`
- Claude 更少被拦截
- 更适合高信任、高自动化场景

这让用户可以根据任务风险自己选模式。

### 3. 专用 Chrome 资料目录

这个模板不会直接依赖你平时乱开的 Chrome 窗口。

它会启动一个专用调试浏览器：

- 登录态可保留
- Cookie 可保留
- 自动化环境和日常浏览隔离

这样就能做到：

- 第一次登录一次
- 后面通常不必每次重新登录

### 4. 尽量做到即插即用

项目把 MCP 配置做成了本地文件，而不是让用户自己去改全局 Claude 配置。

因此用户只要具备：

- Claude Code
- Node.js
- Chrome

就可以直接双击启动。

## 目录结构

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

## 使用方式

### 受限模式

双击：

- `launch-limited.bat`

适合：

- 网页抓取
- 浏览器点击
- 页面阅读
- 截图

### 全自动模式

双击：

- `launch-full-auto.bat`

适合：

- 需要 Claude 尽量少确认
- 你明确接受更高权限风险

## 使用建议

第一次启动后，在专用 Chrome 窗口里完成你要用的网站登录。

后面通常会保留登录态。

## 风险说明

### 受限模式

风险低于全自动，但不是零风险。

因为 Claude 仍然可以：

- 读取页面内容
- 点击页面按钮
- 操作已经登录的网站

### 全自动模式

风险明显更高。

因为它启用了：

- `--dangerously-skip-permissions`

适合高级用户，不适合无脑常开。

## 适合发布到 GitHub 的原因

这个项目不是单个脚本，而是一套清晰的 Windows 浏览器自动化启动方案。

它适合给其他人下载使用，因为它具备：

- 明确的场景定位
- 双模式区分
- 一键启动体验
- 专用浏览器资料隔离
- 本地化配置，不依赖复杂手改

