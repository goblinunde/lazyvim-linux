-- =========================================================
-- 自定义快捷键 (Custom Keymaps Configuration)
-- =========================================================
-- 功能说明 (Description):
--   自定义快捷键映射，增强开发体验
--   Custom keymaps to enhance development experience
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- =========================================================

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- ---------------------------------------------------------
-- Leader 键设置 (Leader key setting)
-- ---------------------------------------------------------
-- 💡 Leader key 已在 LazyVim 中设置为空格 (Leader key is space in LazyVim)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"  -- LaTeX 等文件类型的 local leader

-- ---------------------------------------------------------
-- 通用编辑快捷键 (General Editing Keymaps)
-- ---------------------------------------------------------
-- 💡 保存文件 (Save file)
keymap.set("n", "<C-s>", "<cmd>w<cr>", vim.tbl_extend("force", opts, { desc = "Save file" }))
keymap.set("i", "<C-s>", "<cmd>w<cr><esc>", vim.tbl_extend("force", opts, { desc = "Save file and exit insert" }))

-- 💡 更好的上下移动 (Better up/down movement)
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- 💡 窗口导航 (Window navigation)
keymap.set("n", "<C-h>", "<C-w>h", vim.tbl_extend("force", opts, { desc = "Go to left window" }))
keymap.set("n", "<C-j>", "<C-w>j", vim.tbl_extend("force", opts, { desc = "Go to lower window" }))
keymap.set("n", "<C-k>", "<C-w>k", vim.tbl_extend("force", opts, { desc = "Go to upper window" }))
keymap.set("n", "<C-l>", "<C-w>l", vim.tbl_extend("force", opts, { desc = "Go to right window" }))

-- 💡 缓冲区导航 (Buffer navigation)
keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", vim.tbl_extend("force", opts, { desc = "Prev buffer" }))
keymap.set("n", "<S-l>", "<cmd>bnext<cr>", vim.tbl_extend("force", opts, { desc = "Next buffer" }))
keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", vim.tbl_extend("force", opts, { desc = "Delete buffer" }))

-- ---------------------------------------------------------
-- Python 开发快捷键 (Python Development Keymaps)
-- ---------------------------------------------------------
-- 💡 Python 虚拟环境选择 (Python virtual environment selection)
keymap.set("n", "<leader>pv", "<cmd>VenvSelect<cr>", vim.tbl_extend("force", opts, { desc = "Select Python VirtualEnv" }))

-- 💡 Python 调试快捷键 (Python debugging keymaps)
keymap.set("n", "<leader>pt", function()
  require("dap-python").test_method()
end, vim.tbl_extend("force", opts, { desc = "Debug Python Test Method" }))

keymap.set("n", "<leader>pc", function()
  require("dap-python").test_class()
end, vim.tbl_extend("force", opts, { desc = "Debug Python Test Class" }))

-- ---------------------------------------------------------
-- Rust 开发快捷键 (Rust Development Keymaps)
-- ---------------------------------------------------------
-- 💡 Rust 快捷键在 rust.lua 中已定义 (Rust keymaps defined in rust.lua)
-- 这里添加额外的便捷快捷键 (Additional convenience keymaps)
keymap.set("n", "<leader>rr", "<cmd>RustRunnables<cr>", vim.tbl_extend("force", opts, { desc = "Rust Runnables" }))
keymap.set("n", "<leader>rd", "<cmd>RustDebuggables<cr>", vim.tbl_extend("force", opts, { desc = "Rust Debuggables" }))

-- ---------------------------------------------------------
-- LaTeX 编写快捷键 (LaTeX Writing Keymaps)
-- ---------------------------------------------------------
-- 💡 注意: VimTeX 的主要快捷键使用 localleader (\)
-- Note: Main VimTeX keymaps use localleader (\)

-- 💡 快速编译 LaTeX (Quick compile LaTeX)
keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<cr>", vim.tbl_extend("force", opts, { desc = "LaTeX Compile" }))

-- 💡 查看 PDF (View PDF)
keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>", vim.tbl_extend("force", opts, { desc = "LaTeX View PDF" }))

-- 💡 清理辅助文件 (Clean auxiliary files)
keymap.set("n", "<leader>lc", "<cmd>VimtexClean<cr>", vim.tbl_extend("force", opts, { desc = "LaTeX Clean" }))

-- 💡 打开目录 (Open TOC)
keymap.set("n", "<leader>lt", "<cmd>VimtexTocOpen<cr>", vim.tbl_extend("force", opts, { desc = "LaTeX TOC" }))

-- 💡 停止编译 (Stop compilation)
keymap.set("n", "<leader>ls", "<cmd>VimtexStop<cr>", vim.tbl_extend("force", opts, { desc = "LaTeX Stop" }))

-- ---------------------------------------------------------
-- LSP 快捷键增强 (LSP Keymap Enhancement)
-- ---------------------------------------------------------
-- 💡 格式化代码 (Format code) - 已在 formatting.lua 中定义
-- keymap.set({ "n", "v" }, "<leader>cf", function()
--   require("conform").format({ async = true, lsp_fallback = true })
-- end, vim.tbl_extend("force", opts, { desc = "Format" }))

-- 💡 代码操作 (Code action)
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))

-- 💡 重命名符号 (Rename symbol)
keymap.set("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))

-- ---------------------------------------------------------
-- 终端快捷键 (Terminal Keymaps)
-- ---------------------------------------------------------
-- 💡 打开浮动终端 (Open floating terminal)
keymap.set("n", "<leader>ft", function()
  LazyVim.terminal()
end, vim.tbl_extend("force", opts, { desc = "Terminal (cwd)" }))

-- 💡 终端模式下的 ESC (ESC in terminal mode)
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", vim.tbl_extend("force", opts, { desc = "Exit terminal mode" }))

-- ---------------------------------------------------------
-- 其他便捷快捷键 (Other Convenient Keymaps)
-- ---------------------------------------------------------
-- 💡 清除搜索高亮 (Clear search highlight)
keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", vim.tbl_extend("force", opts, { desc = "Clear search highlight" }))

-- 💡 快速退出 (Quick quit)
keymap.set("n", "<leader>qq", "<cmd>qa<cr>", vim.tbl_extend("force", opts, { desc = "Quit all" }))
