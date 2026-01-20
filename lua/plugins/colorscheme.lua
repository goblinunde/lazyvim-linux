-- =========================================================
-- 主题配置 (Colorscheme Configuration)
-- =========================================================
-- 功能说明 (Description):
--   基于 resource.css 的深青色主题配置
--   Implements resource.css inspired deep teal theme
-- =========================================================

return {
  -- ---------------------------------------------------------
  -- 主题插件: Catppuccin (优雅的柔和色调主题)
  -- Theme: Catppuccin - Elegant pastel theme
  -- ---------------------------------------------------------
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      -- 风格选择: mocha (深色), latte (浅色)
      -- Flavour: mocha for dark mode, latte for light mode
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      
      -- 背景样式 (Background styles)
      background = {
        light = "latte",
        dark = "mocha",
      },
      
      -- 透明背景 (Transparent background)
      transparent_background = false,
      
      -- 终端颜色 (Terminal colors)
      term_colors = true,
      
      -- 自定义高亮覆盖 (Custom highlight overrides)
      -- 将默认配色修改为 resource.css 的深青色系
      custom_highlights = function(colors)
        local c = require("utils.colors")
        local theme = c.get_theme_colors(vim.o.background == "dark")
        
        return {
          -- 💡 General UI elements: 通用 UI 元素
          Normal = { bg = theme.bg, fg = theme.fg },
          NormalFloat = { bg = theme.bg_mute, fg = theme.fg },
          FloatBorder = { fg = c.colors.primary, bg = theme.bg_mute },
          
          -- 💡 Cursor and search: 光标与搜索
          CursorLine = { bg = theme.bg_soft },
          CursorLineNr = { fg = c.colors.primary, bold = true },
          Search = { bg = c.colors.primary_mute, fg = theme.fg },
          IncSearch = { bg = c.colors.primary, fg = theme.bg },
          
          -- 💡 Code blocks: 代码块样式
          -- 参考 resource.css 的代码块背景
          Pmenu = { bg = theme.code_bg, fg = theme.fg },
          PmenuSel = { bg = c.colors.primary, fg = theme.bg },
          
          -- 💡 Diagnostic colors: 诊断信息配色
          DiagnosticError = { fg = c.colors.semantic.error },
          DiagnosticWarn = { fg = c.colors.semantic.warning },
          DiagnosticInfo = { fg = c.colors.semantic.info },
          DiagnosticHint = { fg = c.colors.semantic.hint },
          
          -- 💡 Git signs: Git 状态标识
          GitSignsAdd = { fg = c.colors.semantic.success },
          GitSignsChange = { fg = c.colors.semantic.warning },
          GitSignsDelete = { fg = c.colors.semantic.error },
          
          -- 💡 Statusline: 状态栏 (深青色主题)
          StatusLine = { bg = c.colors.primary, fg = theme.bg },
          StatusLineNC = { bg = theme.bg_mute, fg = theme.fg_dim },
          
          -- 💡 Tabs and buffers: 标签页与缓冲区
          TabLine = { bg = theme.bg_mute, fg = theme.fg_dim },
          TabLineSel = { bg = c.colors.primary, fg = theme.bg },
          TabLineFill = { bg = theme.bg },
        }
      end,
      
      -- 集成插件配色 (Plugin integrations)
      integrations = {
        cmp = true,                    -- nvim-cmp 补全菜单
        gitsigns = true,               -- Git 标识
        nvimtree = true,               -- 文件树
        treesitter = true,             -- Tree-sitter 语法高亮
        notify = true,                 -- 通知插件
        mason = true,                  -- Mason 包管理器
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        telescope = {
          enabled = true,
        },
        which_key = true,              -- 快捷键提示
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      -- 💡 启用主题 (Enable the theme)
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- ---------------------------------------------------------
  -- 备选主题: Tokyonight (LazyVim 默认主题)
  -- Alternative: Tokyonight - LazyVim default
  -- ---------------------------------------------------------
  {
    "folke/tokyonight.nvim",
    lazy = true, -- 设为备用，不自动加载
    priority = 900,
    opts = {
      style = "night", -- night, storm, day, moon
      transparent = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
      },
    },
  },

  -- ---------------------------------------------------------
  -- LazyVim 配色方案配置
  -- Configure LazyVim to use our theme
  -- ---------------------------------------------------------
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
