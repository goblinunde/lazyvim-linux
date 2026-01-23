-- =========================================================
-- i18n 国际化系统核心模块 (i18n Core Module)
-- =========================================================
-- 功能说明 (Description):
--   提供多语言支持的核心功能
--   Provides core functionality for multilingual support
-- =========================================================

local M = {}

-- 💡 配置目录路径 (Configuration directory path)
local config_dir = vim.fn.stdpath("config")
local data_dir = vim.fn.stdpath("data")
local lang_file = data_dir .. "/language.txt"

-- 💡 当前语言和翻译表 (Current language and translation table)
M.current_language = "en"
M.translations = {}

-- 💡 支持的语言列表 (Supported languages list)
M.supported_languages = {
  en = "English",
  zh_CN = "简体中文",
  fr = "Français",
  de = "Deutsch",
}

-- ---------------------------------------------------------
-- 内部辅助函数 (Internal Helper Functions)
-- ---------------------------------------------------------

--- 深度合并表 (Deep merge tables)
--- @param t1 table 基础表 (Base table)
--- @param t2 table 要合并的表 (Table to merge)
--- @return table 合并后的表 (Merged table)
local function deep_merge(t1, t2)
  local result = vim.deepcopy(t1)
  for k, v in pairs(t2) do
    if type(v) == "table" and type(result[k]) == "table" then
      result[k] = deep_merge(result[k], v)
    else
      result[k] = v
    end
  end
  return result
end

--- 从嵌套表中获取值 (Get value from nested table)
--- @param tbl table 表 (Table)
--- @param key string 键路径，用点分隔 (Key path, dot-separated)
--- @return any|nil 值 (Value)
local function get_nested_value(tbl, key)
  local keys = vim.split(key, ".", { plain = true })
  local current = tbl
  
  for _, k in ipairs(keys) do
    if type(current) ~= "table" then
      return nil
    end
    current = current[k]
    if current == nil then
      return nil
    end
  end
  
  return current
end

-- ---------------------------------------------------------
-- 语言加载和管理 (Language Loading and Management)
-- ---------------------------------------------------------

--- 加载语言包 (Load language pack)
--- @param lang_code string 语言代码 (Language code)
--- @return boolean 是否成功 (Success status)
function M.load_language(lang_code)
  -- 💡 检查语言是否支持 (Check if language is supported)
  if not M.supported_languages[lang_code] then
    vim.notify(
      string.format("❌ Unsupported language: %s", lang_code),
      vim.log.levels.ERROR
    )
    return false
  end

  -- 💡 尝试加载语言包 (Try to load language pack)
  local ok, locale = pcall(require, "i18n.locales." .. lang_code)
  if not ok then
    vim.notify(
      string.format("❌ Failed to load language pack: %s", lang_code),
      vim.log.levels.ERROR
    )
    return false
  end

  -- 💡 如果不是英语，与英语包合并以确保完整性 (Merge with English for fallback)
  if lang_code ~= "en" then
    local ok_en, en_locale = pcall(require, "i18n.locales.en")
    if ok_en then
      M.translations = deep_merge(en_locale, locale)
    else
      M.translations = locale
    end
  else
    M.translations = locale
  end

  M.current_language = lang_code
  return true
end

--- 保存当前语言设置 (Save current language setting)
function M.save_language()
  local file = io.open(lang_file, "w")
  if file then
    file:write(M.current_language)
    file:close()
    return true
  end
  return false
end

--- 加载保存的语言设置 (Load saved language setting)
function M.load_saved_language()
  local file = io.open(lang_file, "r")
  if file then
    local lang = file:read("*all")
    file:close()
    if lang and lang ~= "" then
      lang = vim.trim(lang)
      if M.supported_languages[lang] then
        return lang
      end
    end
  end
  return "en" -- 默认返回英语 (Default to English)
end

-- ---------------------------------------------------------
-- 翻译功能 (Translation Functions)
-- ---------------------------------------------------------

--- 获取翻译文本 (Get translated text)
--- @param key string 翻译键，支持点分隔的嵌套键 (Translation key, supports dot-separated nested keys)
--- @param params table|nil 可选的参数表，用于参数化翻译 (Optional parameters for parameterized translation)
--- @return string 翻译后的文本 (Translated text)
function M.t(key, params)
  local value = get_nested_value(M.translations, key)
  
  -- 💡 如果找不到翻译，返回带标记的键 (Return marked key if translation not found)
  if value == nil then
    return string.format("[Missing: %s]", key)
  end

  -- 💡 如果是字符串且有参数，进行参数替换 (Parameter substitution if applicable)
  if type(value) == "string" and params then
    for k, v in pairs(params) do
      value = value:gsub("{" .. k .. "}", tostring(v))
    end
  end

  return value
end

--- 翻译函数的别名 (Alias for translation function)
M.translate = M.t

-- ---------------------------------------------------------
-- 语言切换 (Language Switching)
-- ---------------------------------------------------------

--- 切换语言 (Switch language)
--- @param new_lang string 新语言代码 (New language code)
--- @return boolean 是否成功 (Success status)
function M.switch_language(new_lang)
  if M.current_language == new_lang then
    vim.notify(
      string.format("ℹ️  Already using %s", M.supported_languages[new_lang] or new_lang),
      vim.log.levels.INFO
    )
    return true
  end

  if M.load_language(new_lang) then
    M.save_language()
    
    -- 💡 通知用户语言已切换 (Notify user of language switch)
    vim.notify(
      string.format("✅ Language switched to %s", M.supported_languages[new_lang]),
      vim.log.levels.INFO
    )
    
    -- 💡 提示用户重新加载以应用更改 (Suggest reload for changes to take effect)
    vim.notify(
      "💡 Some changes may require reloading Neovim (:source $MYVIMRC or restart)",
      vim.log.levels.WARN
    )
    
    return true
  end
  
  return false
end

--- 获取当前语言 (Get current language)
--- @return string 当前语言代码 (Current language code)
function M.get_current_language()
  return M.current_language
end

--- 列出所有支持的语言 (List all supported languages)
--- @return table 语言列表 (Language list)
function M.list_languages()
  return M.supported_languages
end

-- ---------------------------------------------------------
-- 初始化 (Initialization)
-- ---------------------------------------------------------

--- 初始化 i18n 系统 (Initialize i18n system)
function M.setup()
  -- 💡 加载保存的语言或使用默认语言 (Load saved language or use default)
  local saved_lang = M.load_saved_language()
  
  if not M.load_language(saved_lang) then
    -- 💡 如果加载失败，回退到英语 (Fallback to English on failure)
    vim.notify("⚠️  Falling back to English", vim.log.levels.WARN)
    M.load_language("en")
  end
end

-- 💡 自动初始化 (Auto-initialize)
M.setup()

return M
