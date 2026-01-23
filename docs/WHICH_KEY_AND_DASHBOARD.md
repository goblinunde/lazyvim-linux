# Which-key 和 Dashboard 使用指南

> 多语言界面说明与快捷键参考

## 📊 Dashboard (启动界面)

### 启动界面布局

当您启动 Neovim 时，会看到山水·数理主题的 Dashboard：

```
        ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
        ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
        ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
        ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
        ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                  🌊 山水·数理 | Shan-shui Logic 🌊
```

### Dashboard 菜单项

| 图标 | 中文 | 英文 | 快捷键 | 功能说明 |
|------|------|------|--------|----------|
| 🔍 | 查找文件 | Find file | `f` | 使用 Telescope 搜索项目文件 |
| 📄 | 新建文件 | New file | `n` | 创建新的空白文件 |
| 🕒 | 最近文件 | Recent files | `r` | 列出最近打开的文件 |
| 🔎 | 查找文本 | Find text | `g` | 在项目中全局搜索文本 |
| 💤 | 插件管理 | Lazy | `l` | 打开 Lazy 插件管理器 |
| 🚪 | 退出 | Quit | `q` | 退出 Neovim |

### Dashboard 底部状态

显示插件加载信息，根据语言设置自动翻译：

- **中文**: `⚡ Neovim 已加载 42/120 个插件，耗时 85ms`
- **英文**: `⚡ Neovim loaded 42/120 plugins in 85ms`
- **法语**: `⚡ Neovim a chargé 42/120 plugins en 85ms`
- **德语**: `⚡ Neovim hat 42/120 Plugins in 85ms geladen`

---

## ⌨️ Which-key 菜单说明

### 什么是 Which-key？

按下 `<Space>` (Leader 键) 后会弹出一个帮助菜单，显示所有可用的快捷键组合。

### 多语言翻译状态

#### ✅ 已翻译的分组（我们的配置）

这些是我们自定义的快捷键分组，**完全支持多语言**：

| 按键 | 英文 | 中文 | 法语 | 德语 | 说明 |
|------|------|------|------|------|------|
| `f` | File | 文件 | Fichier | Datei | 文件操作 |
| `s` | Search | 搜索 | Rechercher | Suchen | 搜索功能 |
| `g` | Git | Git | Git | Git | Git 版本控制 |
| `c` | Code | 代码 | Code | Code | 代码操作 |
| `d` | Debug | 调试 | Débogage | Debuggen | 调试功能 |
| `b` | Buffer | 缓冲区 | Tampon | Puffer | 缓冲区管理 |
| `w` | Window | 窗口 | Fenêtre | Fenster | 窗口操作 |
| `u` | UI | 界面 | Interface | Benutzeroberfläche | 界面设置 |
| `p` | Python | Python | Python | Python | Python 开发 |
| `r` | Rust | Rust | Rust | Rust | Rust 开发 |
| `l` | LaTeX | LaTeX | LaTeX | LaTeX | LaTeX 写作 |
| `m` | Markdown | Markdown | Markdown | Markdown | Markdown 编辑 |
| `t` | Terminal | 终端 | Terminal | Terminal | 终端操作 |
| `q` | Quit | 退出 | Quitter | Beenden | 退出程序 |

#### ❌ 保持英文的部分（LazyVim 核心）

以下快捷键来自 **LazyVim 框架**或 **Snacks 插件**，无法翻译：

- **Explorer Snacks** (root dir) - Snacks 文件浏览器（项目根目录）
- **Explorer Snacks** (cwd) - Snacks 文件浏览器（当前目录）
- **LazyVim Changelog** - LazyVim 更新日志
- **Buffers** - 缓冲区列表
- **Notifications** - 通知历史
- **Toggle Scratch Buffer** - 临时缓冲区
- **Switch to Other Buffer** - 切换到其他缓冲区
- 等等...

**为什么无法翻译？**
这些功能是在 LazyVim 核心代码中硬编码的（位于 `~/.local/share/nvim/lazy/`），不在我们的配置文件中，因此无法通过我们的 i18n 系统修改。

---

## 📖 详细快捷键说明

### `<Space>f` - 文件 (File)

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<Space>ff` | 查找文件 | 在项目中搜索文件 |
| `<Space>fr` | 最近文件 | 显示最近打开的文件 |
| `<Space>fn` | 新建文件 | 创建新文件 |
| `<Space>fs` | 另存为 | 将当前文件另存为 |
| `<Space>fp` | 预览文件 | 预览当前文件（PDF/图片/视频） |
| `<Space>fo` | 文件管理器 | 在系统文件管理器中打开 |
| `<Space>fy` | Yazi | 打开 Yazi 终端文件管理器 |

### `<Space>s` - 搜索 (Search)

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<Space>sg` | 全局搜索 | 在项目中搜索文本（grep） |
| `<Space>ss` | 符号搜索 | 搜索代码符号 |
| `<Space>sw` | 搜索单词 | 搜索光标下的单词 |
| `<Space>/` | 缓冲区搜索 | 在当前文件中搜索 |

### `<Space>g` - Git

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<Space>gg` | LazyGit | 打开 LazyGit TUI |
| `<Space>gs` | Git Status | Git 状态 |
| `<Space>gb` | Git Blame | 查看代码作者 |
| `<Space>gd` | Git Diff | 查看差异 |
| `<Space>gl` | Git Log | 查看提交历史 |

### `<Space>c` - 代码 (Code)

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<Space>ca` | 代码操作 | LSP 代码操作 |
| `<Space>cr` | 重命名 | 重命名符号 |
| `<Space>cf` | 格式化 | 格式化代码 |
| `gd` | 转到定义 | 跳转到定义 |
| `gr` | 查找引用 | 查找所有引用 |
| `K` | 悬浮文档 | 显示文档 |

### `<Space>d` - 调试 (Debug)

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<Space>db` | 切换断点 | 设置/取消断点 |
| `<Space>dc` | 继续执行 | 调试继续 |
| `<Space>di` | 步入 | 单步调试（进入函数） |
| `<Space>do` | 步过 | 单步调试（跳过函数） |
| `<Space>du` | 调试UI | 切换调试界面 |

### `<Space>b` - 缓冲区 (Buffer)

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<Space>bd` | 删除缓冲区 | 关闭当前缓冲区 |
| `<Space>bD` | 删除其他 | 关闭除当前外的所有缓冲区 |
| `<S-h>` | 上一个 | 切换到上一个缓冲区 |
| `<S-l>` | 下一个 | 切换到下一个缓冲区 |

### `<Space>w` - 窗口 (Window)

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<C-h>` | 左窗口 | 跳转到左侧窗口 |
| `<C-j>` | 下窗口 | 跳转到下方窗口 |
| `<C-k>` | 上窗口 | 跳转到上方窗口 |
| `<C-l>` | 右窗口 | 跳转到右侧窗口 |
| `<Space>wd` | 关闭窗口 | 关闭当前窗口 |
| `<Space>w-` | 水平分割 | 水平分割窗口 |
| `<Space>w\|` | 垂直分割 | 垂直分割窗口 |

### `<Space>u` - 界面 (UI)

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<Space>uL` | 切换语言 | 打开语言选择器 🌍 |
| `<Space>uw` | 切换换行 | 切换软换行 |
| `<Space>un` | 清除通知 | 清除所有通知 |

### `<Space>p` - Python

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<Space>pv` | 选择虚拟环境 | 选择 Python venv |
| `<Space>pt` | 测试方法 | 调试测试方法 |
| `<Space>pc` | 测试类 | 调试测试类 |

### `<Space>r` - Rust

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<Space>rr` | Rust 可运行项 | 运行 Rust 代码 |
| `<Space>rd` | Rust 可调试项 | 调试 Rust 代码 |

### `<Space>l` - LaTeX

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<Space>ll` | 编译 | 编译 LaTeX 文档 |
| `<Space>lv` | 查看 PDF | 查看编译后的 PDF |
| `<Space>lc` | 清理 | 清理辅助文件 |
| `<Space>lt` | 目录 | 打开文档目录 |
| `<Space>ls` | 停止 | 停止编译 |

### `<Space>m` - Markdown

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<Space>mr` | Neovim 渲染 | 在 Neovim 中渲染 |
| `<Space>mp` | 浏览器预览 | 在浏览器中预览 |
| `<Space>mg` | Glow 预览 | 终端预览（Glow） |
| `<Space>mt` | 表格模式 | 切换表格编辑模式 |

### `<Space>t` - 终端 (Terminal)

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<Space>ft` | 浮动终端 | 打开浮动终端 |
| `<C-/>` | 切换终端 | 切换终端显示 |

---

## 🌍 语言切换

### 快捷键方式

按 `<Space>uL` 打开 Telescope 语言选择器，使用方向键选择语言后按回车。

### 命令方式

```vim
:LangList           # 列出所有可用语言
:LangSwitch zh_CN   # 切换到简体中文
:LangSwitch en      # 切换到英语
:LangSwitch fr      # 切换到法语
:LangSwitch de      # 切换到德语
```

### 效果范围

切换语言后会**立即**更新：

- ✅ Which-key 分组名称（我们定义的部分）
- ✅ Dashboard 菜单和状态

需要**重启 Neovim** 才会更新：

- ⏱️ Dashboard 启动界面

**不会**更新：

- ❌ LazyVim 核心功能（技术限制）
- ❌ Snacks 插件功能（技术限制）

---

## 💡 使用技巧

### 1. 快速查看所有快捷键

按 `<Space>` 后等待 500ms，which-key 会自动弹出提示。

### 2. 逐层探索

按 `<Space>f` 查看所有文件相关操作，按 `<Space>g` 查看所有 Git 操作，以此类推。

### 3. 搜索功能

在 which-key 菜单中可以直接输入字母快速跳转到对应功能。

### 4. 取消操作

在 which-key 菜单中按 `Esc` 或 `<C-c>` 取消并返回。

---

## 📚 相关文档

- [I18N.md](I18N.md) - 多语言系统使用指南
- [KEYBINDINGS.md](KEYBINDINGS.md) - 完整快捷键列表
- [README.md](../README.md) - 项目主文档

---

**最后更新**: 2026-01-23
