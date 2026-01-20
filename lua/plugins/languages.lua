-- =========================================================
-- 多语言开发支持配置 (Multi-Language Development Support)
-- =========================================================
-- 功能说明 (Description):
--   基于语言配置中心的多语言完整支持
--   Complete multi-language support integrated with language config center
--   每个语言包含: LSP + 格式化 + 调试（如果适用）
--   Each language includes: LSP + Formatting + Debugging (if applicable)
-- =========================================================

local lang_config = require("config.languages")

return {
  -- =========================================================
  -- Go 语言完整支持 (Go Language Full Support)
  -- =========================================================
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    enabled = function()
      return lang_config.is_enabled("go")
    end,
    ft = { "go", "gomod", "gowork", "gotmpl" },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require("go").setup({
        -- 💡 Go LSP 配置 (Go LSP configuration)
        lsp_cfg = {
          settings = {
            gopls = {
              -- 启用所有分析 (Enable all analyses)
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
              gofumpt = true, -- 使用 gofumpt 格式化
            },
          },
        },
        -- 💡 自动格式化 (Auto-format)
        lsp_gofumpt = true,
        lsp_on_attach = true,
        -- 💡 调试配置 (Debug configuration)
        dap_debug = true,
        dap_debug_gui = true,
      })
    end,
  },

  -- =========================================================
  -- TypeScript/JavaScript 完整支持 (TypeScript/JavaScript Full Support)
  -- =========================================================
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    enabled = function()
      return lang_config.is_enabled("typescript") or lang_config.is_enabled("javascript")
    end,
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {
      -- 💡 TypeScript LSP 配置 (TypeScript LSP configuration)
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },

  -- =========================================================
  -- Java 完整支持 (Java Language Full Support)
  -- =========================================================
  {
    "nvim-java/nvim-java",
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
    },
    enabled = function()
      return lang_config.is_enabled("java")
    end,
    ft = { "java" },
    config = function()
      require("java").setup({
        -- 💡 Java LSP 配置 (Java LSP configuration)
        jdk = {
          auto_install = false, -- 不自动安装 JDK
        },
      })
    end,
  },

  -- =========================================================
  -- Bash/Shell 脚本支持 (Bash/Shell Script Support)
  -- =========================================================
  {
    "neovim/nvim-lspconfig",
    enabled = function()
      return lang_config.is_enabled("bash")
    end,
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.bashls = {
        -- 💡 Bash LSP 配置 (Bash LSP configuration)
        filetypes = { "sh", "bash", "zsh" },
      }
      return opts
    end,
  },

  -- =========================================================
  -- Tree-sitter 多语言语法高亮 (Tree-sitter Multi-Language Syntax Highlighting)
  -- =========================================================
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      
      -- 💡 根据配置启用语言 parser (Enable parsers based on config)
      local parsers = {}
      
      if lang_config.is_enabled("go") then
        vim.list_extend(parsers, { "go", "gomod", "gowork", "gotmpl" })
      end
      
      if lang_config.is_enabled("typescript") or lang_config.is_enabled("javascript") then
        vim.list_extend(parsers, { "typescript", "tsx", "javascript", "jsdoc" })
      end
      
      if lang_config.is_enabled("java") then
        table.insert(parsers, "java")
      end
      
      if lang_config.is_enabled("bash") then
        table.insert(parsers, "bash")
      end
      
      -- 通用 parsers (Universal parsers)
      vim.list_extend(parsers, { "json", "yaml", "toml", "xml", "vim", "lua", "regex" })
      
      vim.list_extend(opts.ensure_installed, parsers)
      return opts
    end,
  },

  -- =========================================================
  -- Mason 自动安装工具 (Mason Auto-Install Tools)
  -- =========================================================
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      
      -- 💡 根据配置安装 LSP/工具 (Install LSP/tools based on config)
      if lang_config.is_enabled("go") then
        vim.list_extend(opts.ensure_installed, {
          "gopls",        -- Go LSP
          "goimports",    -- Go imports formatter
          "gofumpt",      -- Go strict formatter
          "delve",        -- Go debugger
        })
      end
      
      if lang_config.is_enabled("typescript") or lang_config.is_enabled("javascript") then
        vim.list_extend(opts.ensure_installed, {
          "typescript-language-server", -- TS/JS LSP
          "prettier",                    -- Code formatter
          "eslint_d",                    -- Fast ESLint
        })
      end
      
      if lang_config.is_enabled("java") then
        vim.list_extend(opts.ensure_installed, {
          "jdtls",                -- Java LSP
          "java-debug-adapter",   -- Java debugger
          "java-test",            -- Java test runner
        })
      end
      
      if lang_config.is_enabled("bash") then
        vim.list_extend(opts.ensure_installed, {
          "bash-language-server", -- Bash LSP
          "shfmt",                -- Shell formatter
          "shellcheck",           -- Shell linter
        })
      end
      
      return opts
    end,
  },

  -- =========================================================
  -- Conform.nvim 格式化配置 (Conform.nvim Formatting Configuration)
  -- =========================================================
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      
      -- 💡 根据配置添加格式化工具 (Add formatters based on config)
      if lang_config.is_enabled("go") then
        opts.formatters_by_ft.go = { "goimports", "gofumpt" }
      end
      
      if lang_config.is_enabled("typescript") or lang_config.is_enabled("javascript") then
        opts.formatters_by_ft.typescript = { "prettier" }
        opts.formatters_by_ft.typescriptreact = { "prettier" }
        opts.formatters_by_ft.javascript = { "prettier" }
        opts.formatters_by_ft.javascriptreact = { "prettier" }
      end
      
      if lang_config.is_enabled("java") then
        opts.formatters_by_ft.java = { "google-java-format" }
      end
      
      if lang_config.is_enabled("bash") then
        opts.formatters_by_ft.sh = { "shfmt" }
        opts.formatters_by_ft.bash = { "shfmt" }
      end
      
      return opts
    end,
  },
}
