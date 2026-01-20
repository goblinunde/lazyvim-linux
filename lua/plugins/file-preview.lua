-- =========================================================
-- 文件预览配置 (File Preview Configuration)
-- =========================================================
-- 功能说明 (Description):
--   支持在 Neovim 中预览 PDF、图片、视频等常见文件格式
--   Support previewing PDF, images, videos and other common file formats in Neovim
-- =========================================================

return {
  -- ---------------------------------------------------------
  -- 文件预览功能 (File Preview Functionality)
  -- ---------------------------------------------------------
  {
    "file-preview-setup",
    lazy = false,
    config = function()
      -- 💡 文件预览核心函数 (Core file preview function)
      local M = {}

      --- 预览当前文件 (Preview current file)
      --- 使用系统默认程序打开文件 (Open file with system default program)
      function M.preview_file()
        local file = vim.fn.expand("%:p")
        
        -- 检查文件是否存在 (Check if file exists)
        if vim.fn.filereadable(file) == 0 then
          vim.notify("❌ 文件不存在或无法读取 (File does not exist or cannot be read)", vim.log.levels.ERROR)
          return
        end

        -- 获取文件扩展名 (Get file extension)
        local ext = vim.fn.fnamemodify(file, ":e"):lower()
        
        -- 支持的预览格式 (Supported preview formats)
        local preview_extensions = {
          -- PDF
          pdf = true,
          -- 图片 (Images)
          png = true, jpg = true, jpeg = true, gif = true, svg = true, webp = true, bmp = true,
          -- 视频 (Videos)
          mp4 = true, mkv = true, avi = true, mov = true, webm = true, flv = true,
          -- 音频 (Audio)
          mp3 = true, wav = true, flac = true, ogg = true, m4a = true,
          -- Office 文档 (Office documents)
          doc = true, docx = true, xls = true, xlsx = true, ppt = true, pptx = true,
          odt = true, ods = true, odp = true,
        }

        if not preview_extensions[ext] and ext ~= "" then
          vim.notify("ℹ️  文件类型 '" .. ext .. "' 可能不支持预览，尝试使用系统默认程序打开...", vim.log.levels.INFO)
        end

        -- 使用 xdg-open 异步打开文件 (Open file asynchronously with xdg-open)
        vim.fn.jobstart({ "xdg-open", file }, {
          detach = true,
          on_exit = function(_, exit_code)
            if exit_code == 0 then
              vim.notify("✅ 已用系统默认程序打开: " .. vim.fn.fnamemodify(file, ":t"), vim.log.levels.INFO)
            else
              vim.notify("❌ 无法打开文件 (Failed to open file)", vim.log.levels.ERROR)
            end
          end,
        })
      end

      --- 在文件管理器中显示当前文件 (Show current file in file manager)
      function M.open_in_file_manager()
        local file = vim.fn.expand("%:p")
        
        if vim.fn.filereadable(file) == 0 then
          vim.notify("❌ 文件不存在 (File does not exist)", vim.log.levels.ERROR)
          return
        end

        local dir = vim.fn.fnamemodify(file, ":h")
        
        -- 使用 xdg-open 打开文件所在目录 (Open directory with xdg-open)
        vim.fn.jobstart({ "xdg-open", dir }, {
          detach = true,
          on_exit = function(_, exit_code)
            if exit_code == 0 then
              vim.notify("📂 已在文件管理器中打开: " .. dir, vim.log.levels.INFO)
            else
              vim.notify("❌ 无法打开文件管理器 (Failed to open file manager)", vim.log.levels.ERROR)
            end
          end,
        })
      end

      --- 用指定程序打开文件 (Open file with specified program)
      --- @param program string: 程序名称 (Program name)
      function M.open_with(program)
        local file = vim.fn.expand("%:p")
        
        if vim.fn.filereadable(file) == 0 then
          vim.notify("❌ 文件不存在 (File does not exist)", vim.log.levels.ERROR)
          return
        end

        vim.fn.jobstart({ program, file }, {
          detach = true,
          on_exit = function(_, exit_code)
            if exit_code == 0 then
              vim.notify("✅ 已用 " .. program .. " 打开文件", vim.log.levels.INFO)
            else
              vim.notify("❌ 无法用 " .. program .. " 打开文件", vim.log.levels.ERROR)
            end
          end,
        })
      end

      -- 导出函数到全局 (Export functions globally)
      _G.FilePreview = M

      -- 设置快捷键 (Setup keymaps)
      local keymap = vim.keymap
      local opts = { noremap = true, silent = true }

      -- 💡 预览当前文件 (Preview current file)
      keymap.set("n", "<leader>fp", function()
        _G.FilePreview.preview_file()
      end, vim.tbl_extend("force", opts, { desc = "Preview File" }))

      -- 💡 在文件管理器中打开 (Open in file manager)
      keymap.set("n", "<leader>fo", function()
        _G.FilePreview.open_in_file_manager()
      end, vim.tbl_extend("force", opts, { desc = "Open in File Manager" }))

      -- 💡 用系统默认程序打开 (Open with system default)
      keymap.set("n", "<leader>fx", function()
        _G.FilePreview.preview_file()
      end, vim.tbl_extend("force", opts, { desc = "Open with System Default" }))

      -- 💡 快速用特定程序打开 (Quick open with specific programs)
      -- PDF 预览器 (PDF viewers)
      keymap.set("n", "<leader>fpe", function()
        _G.FilePreview.open_with("evince")
      end, vim.tbl_extend("force", opts, { desc = "Open with Evince (PDF)" }))

      keymap.set("n", "<leader>fpz", function()
        _G.FilePreview.open_with("zathura")
      end, vim.tbl_extend("force", opts, { desc = "Open with Zathura (PDF)" }))

      -- 图片查看器 (Image viewers)
      keymap.set("n", "<leader>fpi", function()
        _G.FilePreview.open_with("eog")
      end, vim.tbl_extend("force", opts, { desc = "Open with Eye of GNOME (Image)" }))

      -- 视频播放器 (Video players)
      keymap.set("n", "<leader>fpv", function()
        _G.FilePreview.open_with("mpv")
      end, vim.tbl_extend("force", opts, { desc = "Open with MPV (Video)" }))
    end,
  },
}
