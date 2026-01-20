# 💤 LazyVim Configuration | 山水·数理 🌊

> 基于 LazyVim 的 Neovim 配置，支持 Python、Rust、LaTeX 开发，采用深青色学术风格主题  
> LazyVim-based Neovim configuration for Python, Rust, and LaTeX development with deep teal academic theme

![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)
![Neovim](https://img.shields.io/badge/Neovim-0.9+-green.svg)
![Platform](https://img.shields.io/badge/platform-Linux-lightgrey.svg)

---

## ✨ 特性 (Features)

### 🎨 UI 美化 (UI Enhancement)

- **深青色主题**: 基于 `resource.css` 的山水·数理配色方案 (Deep teal academic color scheme)
- **0xProto 字体**: 极客代码字体，支持连字 (Geek code font with ligatures)
- **现代化 UI**: Lualine、Bufferline、Noice 等插件美化 (Modern UI with Lualine, Bufferline, Noice)
- **优雅通知**: nvim-notify 美化通知系统 (Elegant notification system)

### 🐍 Python 开发 (Python Development)

- **LSP**: basedpyright (高性能类型检查) | basedpyright (high-performance type checker)
- **Linter/Formatter**: ruff (超快的 Python 工具) | ruff (ultra-fast Python tools)
- **调试器**: debugpy (完整调试支持) | debugpy (full debugging support)
- **虚拟环境**: 自动检测 venv/.venv | Auto-detect virtual environments
- **遵循规则**: AMD ROCm 环境，uv 包管理器 | Follows AMD ROCm, uv package manager rules

### 🦀 Rust 开发 (Rust Development)

- **LSP**: rust-analyzer (官方 Rust 语言服务器) | rust-analyzer (official Rust language server)
- **工具链**: clippy, rustfmt 集成 | clippy, rustfmt integration
- **依赖管理**: crates.nvim (Cargo.toml 智能补全) | crates.nvim (Cargo.toml smart completion)
- **调试器**: codelldb (LLDB 调试器) | codelldb (LLDB debugger)
- **强调**: 内存安全和 Result<T,E> 错误处理 | Emphasizes memory safety and Result<T,E> error handling

### 📝 LaTeX 学术写作 (LaTeX Academic Writing)

- **LSP**: texlab (强大的 LaTeX 语言服务器) | texlab (powerful LaTeX language server)
- **编译**: latexmk 自动编译 | latexmk auto-compilation
- **预览**: Zathura PDF 实时预览 | Zathura PDF live preview
- **片段**: Physics、PDE 数学公式片段 | Physics, PDE mathematical formula snippets
- **包支持**: physics, siunitx, cleveref | Package support for physics, siunitx, cleveref

### 🛠️ 其他功能 (Other Features)

- **Tree-sitter**: 增强语法高亮和代码理解 | Enhanced syntax highlighting
- **自动格式化**: 保存时自动格式化代码 | Format on save
- **DAP调试器**: 统一的调试界面 | Unified debugging interface
- **双语注释**: 所有配置文件中英文双语注释 | Bilingual comments in all config files

---

## 📋 系统依赖 (System Requirements)

### 必需 (Required)

- **Neovim**: >= 0.9.0
- **Git**: >= 2.19.0
- **字体**: [0xProto Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts)

### Python 开发 (Python Development)

```bash
# Fedora 43
sudo dnf install python3 python3-pip
pip install uv
uv tool install ruff
uv tool install basedpyright
```

### Rust 开发 (Rust Development)

```bash
# 安装 Rust 工具链 (Install Rust toolchain)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer clippy rustfmt
```

### LaTeX 写作 (LaTeX Writing)

```bash
# Fedora 43
sudo dnf install texlive-scheme-full latexmk zathura zathura-pdf-mupdf
```

### 通用工具 (General Tools)

```bash
# Fedora 43
sudo dnf install ripgrep fd-find
```

---

## 🚀 安装 (Installation)

### 1. 备份现有配置 (Backup existing config)

```bash
mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)
mv ~/.local/share/nvim ~/.local/share/nvim.backup.$(date +%Y%m%d_%H%M%S)
```

### 2. 克隆配置 (Clone configuration)

```bash
git clone https://github.com/goblinunde/lazyvim-linux.git ~/.config/nvim
cd ~/.config/nvim
```

### 3. 启动 Neovim (Start Neovim)

```bash
nvim
```

首次启动时，LazyVim 会自动安装所有插件和 LSP servers。请耐心等待。  
On first launch, LazyVim will automatically install all plugins and LSP servers. Please wait.

---

## ⚙️ 配置结构 (Configuration Structure)

```
~/.config/nvim/
├── init.lua                    # 入口文件 (Entry point)
├── lua/
│   ├── config/                 # 核心配置 (Core configuration)
│   │   ├── lazy.lua            # Lazy.nvim 配置
│   │   ├── options.lua         # Neovim 选项
│   │   ├── keymaps.lua         # 快捷键映射
│   │   └── autocmds.lua        # 自动命令
│   ├── plugins/                # 插件配置 (Plugin configurations)
│   │   ├── colorscheme.lua     # 主题配置
│   │   ├── ui.lua              # UI 增强
│   │   ├── python.lua          # Python 开发
│   │   ├── rust.lua            # Rust 开发
│   │   ├── latex.lua           # LaTeX 写作
│   │   ├── treesitter.lua      # Tree-sitter
│   │   ├── formatting.lua      # 格式化
│   │   └── dap.lua             # 调试器
│   └── utils/                  # 工具模块 (Utility modules)
│       └── colors.lua          # 颜色工具
├── resource.css                # UI 设计参考
└── stylua.toml                 # Lua 格式化配置
```

---

## ⌨️ 常用快捷键 (Common Keybindings)

### 通用 (General)

| 快捷键 | 功能 | Description |
|--------|------|-------------|
| `<Space>` | Leader 键 | Leader key |
| `<C-s>` | 保存文件 | Save file |
| `<leader>qq` | 退出所有 | Quit all |
| `<leader>cf` | 格式化代码 | Format code |

### Python

| 快捷键 | 功能 | Description |
|--------|------|-------------|
| `<leader>pv` | 选择虚拟环境 | Select VirtualEnv |
| `<leader>pt` | 调试测试方法 | Debug test method |
| `<leader>pc` | 调试测试类 | Debug test class |

### Rust

| 快捷键 | 功能 | Description |
|--------|------|-------------|
| `<leader>rr` | Rust 可运行项 | Rust runnables |
| `<leader>rd` | Rust 可调试项 | Rust debuggables |
| `<leader>cR` | Rust 代码操作 | Rust code action |

### LaTeX

| 快捷键 | 功能 | Description |
|--------|------|-------------|
| `<leader>ll` | 编译 LaTeX | Compile LaTeX |
| `<leader>lv` | 查看 PDF | View PDF |
| `<leader>lc` | 清理辅助文件 | Clean auxiliary files |
| `<leader>lt` | 打开目录 | Open TOC |

### 调试 (Debugging)

| 快捷键 | 功能 | Description |
|--------|------|-------------|
| `<leader>db` | 切换断点 | Toggle breakpoint |
| `<leader>dc` | 继续执行 | Continue |
| `<leader>di` | 步入 | Step into |
| `<leader>do` | 步过 | Step over |
| `<leader>du` | 切换 DAP UI | Toggle DAP UI |

---

## 🎨 主题配色 (Color Scheme)

本配置采用深青色学术风格，源自 `resource.css` 的山水·数理设计：  
This configuration uses a deep teal academic color scheme from resource.css design:

- **Primary**: `#2F545D` (深青色 | Deep Teal)
- **Dark Background**: `#1A3038` (深青黑 | Deep Teal-Black)  
- **Light Background**: `#E6EDEF` (月白青 | Moon-White Teal)
- **Foreground**: `#E6EDEF` / `#2F545D` (根据主题 | Theme-dependent)

---

## 🧪 测试 (Testing)

### 验证 LSP 工作状态 (Verify LSP status)

```vim
:LspInfo
```

### 检查健康状态 (Check health)

```vim
:checkhealth
```

### 查看插件状态 (View plugin status)

```vim
:Lazy
```

---

## 📚 参考资源 (References)

- [LazyVim 官方文档](https://lazyvim.github.io/)
- [Neovim 官方文档](https://neovim.io/doc/)
- [0xProto Font](https://github.com/0xType/0xProto)
- [Resource.css 设计理念](./resource.css)

---

## 📝 开发记录 (Development Log)

所有修改都通过 Git 进行版本管理，遵循 Conventional Commits 规范：  
All changes are version-controlled via Git following Conventional Commits:

```bash
git log --oneline
```

---

## 📄 许可证 (License)

Apache License 2.0 - 详见 [LICENSE](LICENSE) 文件  
Apache License 2.0 - See [LICENSE](LICENSE) file for details

---

## 🤝 贡献 (Contributing)

欢迎提交 Issues 和 Pull Requests！  
Issues and Pull Requests are welcome!

---

**Made with ❤️ for AMD Fedora 43 | 为专业开发者打造**
