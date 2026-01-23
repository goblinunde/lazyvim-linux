-- =========================================================
-- Simplified Chinese Language Pack (简体中文语言包)
-- =========================================================
-- 说明: 简体中文翻译包
-- Description: Simplified Chinese translation pack
-- =========================================================

local M = {}

-- ---------------------------------------------------------
-- General Editing (通用编辑)
-- ---------------------------------------------------------
M.keymaps = {
  -- 文件操作
  save_file = "保存文件",
  save_file_exit_insert = "保存文件并退出插入",
  save_as = "另存为",
  
  -- 选择和剪贴板
  select_all = "全选",
  copy_to_clipboard = "复制到剪贴板",
  cut_to_clipboard = "剪切到剪贴板",
  paste_from_clipboard = "从剪贴板粘贴",
  
  -- 撤销/重做
  undo = "撤销",
  redo = "重做",
  
  -- 缩进
  indent_left = "向左缩进",
  indent_right = "向右缩进",
  
  -- 行移动
  move_line_down = "向下移动行",
  move_line_up = "向上移动行",
  
  -- 窗口导航
  go_to_left_window = "跳转到左侧窗口",
  go_to_lower_window = "跳转到下方窗口",
  go_to_upper_window = "跳转到上方窗口",
  go_to_right_window = "跳转到右侧窗口",
  
  -- 缓冲区导航
  prev_buffer = "上一个缓冲区",
  next_buffer = "下一个缓冲区",
  delete_buffer = "删除缓冲区",
  delete_all_buffers_except_current = "删除除当前外的所有缓冲区",
  
  -- Python
  select_python_venv = "选择 Python 虚拟环境",
  debug_python_test_method = "调试 Python 测试方法",
  debug_python_test_class = "调试 Python 测试类",
  
  -- Rust
  rust_runnables = "Rust 可运行项",
  rust_debuggables = "Rust 可调试项",
  
  -- LSP
  code_action = "代码操作",
  rename = "重命名",
  
  -- LaTeX
  latex_compile = "编译 LaTeX",
  latex_view_pdf = "查看 PDF",
  latex_clean = "清理辅助文件",
  latex_toc = "目录",
  latex_stop = "停止编译",
  
  -- PDF 查看
  preview_file = "预览文件",
  open_in_file_manager = "在文件管理器中打开",
  open_with_default = "用默认程序打开",
  open_with_evince = "用 Evince 打开",
  open_with_zathura = "用 Zathura 打开",
  open_with_eog = "用 EOG 打开",
  open_with_mpv = "用 MPV 打开",
  
  -- 终端
  terminal_cwd = "终端 (当前目录)",
  exit_terminal_mode = "退出终端模式",
  
  -- UI 切换
  toggle_wrap = "切换软换行",
  clear_search_highlight = "清除搜索高亮",
  quit_all = "全部退出",
}

-- ---------------------------------------------------------
-- Which-key Group Names (分组名称)
-- ---------------------------------------------------------
M.which_key = {
  file = "文件",
  find = "查找",
  search = "搜索",
  git = "Git",
  code = "代码",
  debug = "调试",
  buffer = "缓冲区",
  window = "窗口",
  ui = "界面",
  python = "Python",
  rust = "Rust",
  latex = "LaTeX",
  markdown = "Markdown",
  terminal = "终端",
  quit = "退出",
  language = "语言",
}

-- ---------------------------------------------------------
-- Notification Messages (通知消息)
-- ---------------------------------------------------------
M.notifications = {
  -- 文件操作
  file_opened = "✅ 已打开: {filename}",
  file_saved = "✅ 文件已保存",
  folder_opened = "📂 已打开文件夹: {dirname}",
  
  -- 换行切换
  wrap_enabled = "✅ 软换行已启用",
  wrap_disabled = "❌ 软换行已禁用",
  
  -- 文件预览
  file_not_exist = "❌ 文件不存在或无法读取",
  file_type_not_supported = "ℹ️  文件类型 '{ext}' 可能不支持预览",
  cannot_open_file = "❌ 无法打开文件",
  opened_with_program = "✅ 已用 {program} 打开",
  cannot_open_with_program = "❌ 无法用 {program} 打开",
  
  -- 语言切换
  language_switched = "✅ 语言已切换到 {language}",
  already_using_language = "ℹ️  已在使用 {language}",
  reload_suggestion = "💡 部分更改可能需要重新加载 Neovim (:source $MYVIMRC 或重启)",
  unsupported_language = "❌ 不支持的语言: {lang}",
  failed_to_load_language = "❌ 加载语言包失败: {lang}",
  fallback_to_english = "⚠️  回退到英语",
}

-- ---------------------------------------------------------
-- Commands (命令)
-- ---------------------------------------------------------
M.commands = {
  lang_switch_desc = "切换界面语言",
  lang_list_desc = "列出可用语言",
  current_language = "当前语言: {language}",
  available_languages = "可用语言:",
}

-- ---------------------------------------------------------
-- Which-key 分组名称 (Which-key Group Names)
-- ---------------------------------------------------------
M.which_key = {
  file = "文件",
  search = "搜索",
  git = "Git",
  code = "代码",
  debug = "调试",
  buffer = "缓冲区",
  window = "窗口",
  ui = "界面",
  python = "Python",
  rust = "Rust",
  latex = "LaTeX",
  markdown = "Markdown",
  terminal = "终端",
  quit = "退出",
}

-- ---------------------------------------------------------
-- Prompts (提示)
-- ---------------------------------------------------------
M.prompts = {
  save_as_prompt = "另存为: ",
  select_language = "选择语言",
}

-- ---------------------------------------------------------
-- Dashboard (启动界面)
-- ---------------------------------------------------------
M.dashboard = {
  find_file = "查找文件",
  new_file = "新建文件",
  recent_files = "最近文件",
  find_text = "查找文本",
  lazy = "插件管理",
  quit = "退出",
  
  -- Footer
  loaded_plugins = "⚡ Neovim 已加载 {loaded}/{count} 个插件，耗时 {ms}ms",
}

return M
