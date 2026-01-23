-- =========================================================
-- Telescope 语言选择器 (Telescope Language Picker)
-- =========================================================
-- 功能说明 (Description):
--   提供可视化的语言切换界面
--   Provides visual language switching interface
-- =========================================================

local M = {}

--- 打开 Telescope 语言选择器 (Open Telescope language picker)
function M.pick_language()
  local i18n = require("i18n")
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  -- 💡 获取当前语言和可用语言 (Get current and available languages)
  local current_lang = i18n.get_current_language()
  local languages = i18n.list_languages()

  -- 💡 构建选择项列表 (Build selection items)
  local items = {}
  for code, name in pairs(languages) do
    local display = name
    if code == current_lang then
      display = "★ " .. name .. " (current)"
    end
    table.insert(items, {
      code = code,
      name = name,
      display = display,
      ordinal = name,
    })
  end

  -- 💡 按名称排序 (Sort by name)
  table.sort(items, function(a, b)
    return a.name < b.name
  end)

  -- 💡 创建 Telescope picker (Create Telescope picker)
  pickers
    .new({}, {
      prompt_title = i18n.t("prompts.select_language"),
      finder = finders.new_table({
        results = items,
        entry_maker = function(entry)
          return {
            value = entry.code,
            display = entry.display,
            ordinal = entry.ordinal,
          }
        end,
      }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          if selection then
            i18n.switch_language(selection.value)
          end
        end)
        return true
      end,
    })
    :find()
end

return M
