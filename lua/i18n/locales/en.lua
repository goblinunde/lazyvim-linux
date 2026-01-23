-- =========================================================
-- English Language Pack (英语语言包)
-- =========================================================
-- Description: Default language pack for the i18n system
-- =========================================================

local M = {}

-- ---------------------------------------------------------
-- General Editing (通用编辑)
-- ---------------------------------------------------------
M.keymaps = {
  -- File operations
  save_file = "Save file",
  save_file_exit_insert = "Save file and exit insert",
  save_as = "Save As",
  
  -- Selection and clipboard
  select_all = "Select all",
  copy_to_clipboard = "Copy to clipboard",
  cut_to_clipboard = "Cut to clipboard",
  paste_from_clipboard = "Paste from clipboard",
  
  -- Undo/Redo
  undo = "Undo",
  redo = "Redo",
  
  -- Indentation
  indent_left = "Indent left",
  indent_right = "Indent right",
  
  -- Line movement
  move_line_down = "Move line down",
  move_line_up = "Move line up",
  
  -- Window navigation
  go_to_left_window = "Go to left window",
  go_to_lower_window = "Go to lower window",
  go_to_upper_window = "Go to upper window",
  go_to_right_window = "Go to right window",
  
  -- Buffer navigation
  prev_buffer = "Prev buffer",
  next_buffer = "Next buffer",
  delete_buffer = "Delete buffer",
  delete_all_buffers_except_current = "Delete all buffers except current",
  
  -- Python
  select_python_venv = "Select Python VirtualEnv",
  debug_python_test_method = "Debug Python Test Method",
  debug_python_test_class = "Debug Python Test Class",
  
  -- Rust
  rust_runnables = "Rust Runnables",
  rust_debuggables = "Rust Debuggables",
  
  -- LSP
  code_action = "Code Action",
  rename = "Rename",
  
  -- LaTeX
  latex_compile = "LaTeX Compile",
  latex_view_pdf = "LaTeX View PDF",
  latex_clean = "LaTeX Clean",
  latex_toc = "LaTeX TOC",
  latex_stop = "LaTeX Stop",
  
  -- PDF Viewing
  preview_file = "Preview File",
  open_in_file_manager = "Open in File Manager",
  open_with_default = "Open with Default",
  open_with_evince = "Open with Evince",
  open_with_zathura = "Open with Zathura",
  open_with_eog = "Open with EOG",
  open_with_mpv = "Open with MPV",
  
  -- Terminal
  terminal_cwd = "Terminal (cwd)",
  exit_terminal_mode = "Exit terminal mode",
  
  -- UI toggles
  toggle_wrap = "Toggle wrap",
  clear_search_highlight = "Clear search highlight",
  quit_all = "Quit all",
}

-- ---------------------------------------------------------
-- Which-key Group Names (分组名称)
-- ---------------------------------------------------------
M.which_key = {
  file = "File",
  find = "Find",
  search = "Search",
  git = "Git",
  code = "Code",
  debug = "Debug",
  buffer = "Buffer",
  window = "Window",
  ui = "UI",
  python = "Python",
  rust = "Rust",
  latex = "LaTeX",
  markdown = "Markdown",
  terminal = "Terminal",
  quit = "Quit",
  language = "Language",
}

-- ---------------------------------------------------------
-- Notification Messages (通知消息)
-- ---------------------------------------------------------
M.notifications = {
  -- File operations
  file_opened = "✅ Opened: {filename}",
  file_saved = "✅ File saved",
  folder_opened = "📂 Opened folder: {dirname}",
  
  -- Wrap toggle
  wrap_enabled = "✅ Soft wrap enabled",
  wrap_disabled = "❌ Soft wrap disabled",
  
  -- File preview
  file_not_exist = "❌ File does not exist or cannot be read",
  file_type_not_supported = "ℹ️  File type '{ext}' may not support preview",
  cannot_open_file = "❌ Cannot open file",
  opened_with_program = "✅ Opened with {program}",
  cannot_open_with_program = "❌ Cannot open with {program}",
  
  -- Language switching
  language_switched = "✅ Language switched to {language}",
  already_using_language = "ℹ️  Already using {language}",
  reload_suggestion = "💡 Some changes may require reloading Neovim (:source $MYVIMRC or restart)",
  unsupported_language = "❌ Unsupported language: {lang}",
  failed_to_load_language = "❌ Failed to load language pack: {lang}",
  fallback_to_english = "⚠️  Falling back to English",
}

-- ---------------------------------------------------------
-- Commands (命令)
-- ---------------------------------------------------------
M.commands = {
  lang_switch_desc = "Switch UI language",
  lang_list_desc = "List available languages",
  current_language = "Current language: {language}",
  available_languages = "Available languages:",
}

-- ---------------------------------------------------------
-- Which-key Group Names (分组名称)
-- ---------------------------------------------------------
M.which_key = {
  file = "File",
  search = "Search",
  git = "Git",
  code = "Code",
  debug = "Debug",
  buffer = "Buffer",
  window = "Window",
  ui = "UI",
  python = "Python",
  rust = "Rust",
  latex = "LaTeX",
  markdown = "Markdown",
  terminal = "Terminal",
  quit = "Quit",
}

-- ---------------------------------------------------------
-- Prompts (提示)
-- ---------------------------------------------------------
M.prompts = {
  save_as_prompt = "Save as: ",
  select_language = "Select Language",
}

-- ---------------------------------------------------------
-- Dashboard (启动界面)
-- ---------------------------------------------------------
M.dashboard = {
  find_file = "Find file",
  new_file = "New file",
  recent_files = "Recent files",
  find_text = "Find text",
  lazy = "Lazy",
  quit = "Quit",
  
  -- Footer
  loaded_plugins = "⚡ Neovim loaded {loaded}/{count} plugins in {ms}ms",
}

return M
