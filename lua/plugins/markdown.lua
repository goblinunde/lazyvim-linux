-- =========================================================
-- Markdown 配置 (Markdown Configuration)
-- =========================================================
-- 功能说明 (Description):
--   Markdown 编写与预览增强配置
--   Enhanced Markdown writing and preview support
-- =========================================================

return {
  -- ---------------------------------------------------------
  -- Markdown Preview: 实时预览
  -- Real-time Markdown preview in browser
  -- ---------------------------------------------------------
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npx --yes yarn install",
    keys = {
      {
        "<leader>mp",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview Toggle",
      },
    },
    config = function()
      -- 💡 Markdown Preview 配置
      vim.g.mkdp_auto_start = 0          -- 打开 Markdown 文件时自动预览
      vim.g.mkdp_auto_close = 1          -- 关闭缓冲区时自动关闭预览
      vim.g.mkdp_refresh_slow = 0        -- 实时刷新预览
      vim.g.mkdp_command_for_global = 0  -- 只对 Markdown 文件有效
      vim.g.mkdp_open_to_the_world = 0   -- 仅本地访问
      vim.g.mkdp_browser = ""            -- 使用系统默认浏览器
      vim.g.mkdp_echo_preview_url = 1    -- 在命令行显示预览 URL
      
      -- 💡 预览主题和样式
      vim.g.mkdp_theme = "dark"          -- 主题: dark 或 light
      
      -- 💡 自定义预览页面样式
      vim.g.mkdp_markdown_css = ""
      vim.g.mkdp_highlight_css = ""
      
      -- 💡 预览窗口配置
      vim.g.mkdp_page_title = "${name}"  -- 页面标题格式
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,         -- 启用同步滚动
        sync_scroll_type = "middle",     -- 同步滚动类型
        hide_yaml_meta = 1,              -- 隐藏 YAML front matter
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,        -- 预览内容不可编辑
        disable_filename = 0,
      }
    end,
  },

  -- ---------------------------------------------------------
  -- Markdown 增强编辑: 表格、列表等增强
  -- Enhanced Markdown editing features
  -- ---------------------------------------------------------
  {
    "bullets-vim/bullets.vim",
    ft = { "markdown", "text", "gitcommit" },
    config = function()
      -- 💡 启用智能列表和复选框
      vim.g.bullets_enabled_file_types = {
        "markdown",
        "text",
        "gitcommit",
      }
      vim.g.bullets_enable_in_empty_buffers = 0
      vim.g.bullets_set_mappings = 1
      vim.g.bullets_checkbox_markers = " .oOX"
    end,
  },

  -- ---------------------------------------------------------
  -- Markdown Table Mode: 表格编辑增强
  -- Enhanced table editing
  -- ---------------------------------------------------------
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown" },
    keys = {
      {
        "<leader>mt",
        "<cmd>TableModeToggle<cr>",
        desc = "Toggle Table Mode",
      },
    },
    config = function()
      -- 💡 Markdown 表格配置
      vim.g.table_mode_corner = "|"
      vim.g.table_mode_corner_corner = "|"
      vim.g.table_mode_header_fillchar = "-"
    end,
  },

  -- ---------------------------------------------------------
  -- Markdown TOC: 自动生成目录
  -- Auto-generate Table of Contents
  -- ---------------------------------------------------------
  {
    "mzlogin/vim-markdown-toc",
    ft = { "markdown" },
    cmd = { "GenTocGFM", "GenTocRedcarpet", "GenTocGitLab", "UpdateToc" },
    keys = {
      {
        "<leader>mT",
        "<cmd>GenTocGFM<cr>",
        desc = "Generate TOC (GitHub Flavored)",
      },
    },
    config = function()
      -- 💡 生成 GitHub 风格的目录
      vim.g.vmt_auto_update_on_save = 0  -- 保存时不自动更新 TOC
      vim.g.vmt_fence_text = "TOC"
      vim.g.vmt_fence_closing_text = "/TOC"
    end,
  },

  -- ---------------------------------------------------------
  -- Glow: 终端内 Markdown 预览 (备选方案)
  -- Terminal-based Markdown preview alternative
  -- ---------------------------------------------------------
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    keys = {
      {
        "<leader>mg",
        "<cmd>Glow<cr>",
        desc = "Glow Preview (Terminal)",
      },
    },
    opts = {
      border = "rounded",
      style = "dark",
      pager = false,
      width = 120,
    },
  },
}
