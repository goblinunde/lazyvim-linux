# 快捷键绑定文档 (Keybindings Documentation)

> 📚 完整的 LazyVim 配置快捷键参考

## 📖 PDF 查看快捷键 (PDF Viewing Keybindings)

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<Space>po` | 打开 PDF | 使用 Telescope 选择 PDF 文件 |
| `<Space>pn` | 下一页 | 翻到下一页 |
| `<Space>pp` | 上一页 | 翻到上一页 |
| `<Space>jj` | 下一页 (快速) | 快速导航下一页 |
| `<Space>kk` | 上一页 (快速) | 快速导航上一页 |

**配置文件**: [`lua/plugins/pdfview.lua`](file:///home/yyt/Downloads/lazyvim-linux/lua/plugins/pdfview.lua)

**详细文档**: 查看 [`docs/PDFVIEW.md`](file:///home/yyt/Downloads/lazyvim-linux/docs/PDFVIEW.md) 了解更多使用方法和配置选项。

---

## 🌍 语言切换 (Language Switching)

### 快捷键

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<Space>uL` | 切换界面语言 | 打开 Telescope 语言选择器 |

### 命令

| 命令 | 功能 | 说明 |
|------|------|------|
| `:LangList` | 列出可用语言 | 显示所有支持的语言 |
| `:LangSwitch <lang>` | 切换语言 | 切换到指定语言 |

### 支持的语言

- 🇬🇧 **English** (en) - 默认语言
- 🇨🇳 **简体中文** (zh_CN) - Simplified Chinese
- 🇫🇷 **Français** (fr) - French
- 🇩🇪 **Deutsch** (de) - German

**配置文件**: `lua/i18n/init.lua`, `lua/i18n/locales/`

**详细文档**: 参见 [`docs/I18N.md`](file:///home/yyt/Downloads/lazyvim-linux/docs/I18N.md)

---

**最后更新**: 2026-01-23
