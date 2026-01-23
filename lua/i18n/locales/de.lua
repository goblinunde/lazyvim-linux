-- =========================================================
-- German Language Pack (德语语言包)
-- =========================================================
-- Description: German translation pack
-- =========================================================

local M = {}

-- ---------------------------------------------------------
-- General Editing (通用编辑)
-- ---------------------------------------------------------
M.keymaps = {
  -- Dateioperationen
  save_file = "Datei speichern",
  save_file_exit_insert = "Datei speichern und Einfügen beenden",
  save_as = "Speichern unter",
  
  -- Auswahl und Zwischenablage
  select_all = "Alles auswählen",
  copy_to_clipboard = "In Zwischenablage kopieren",
  cut_to_clipboard = "In Zwischenablage ausschneiden",
  paste_from_clipboard = "Aus Zwischenablage einfügen",
  
  -- Rückgängig/Wiederholen
  undo = "Rückgängig",
  redo = "Wiederholen",
  
  -- Einrückung
  indent_left = "Links einrücken",
  indent_right = "Rechts einrücken",
  
  -- Zeilenbewegung
  move_line_down = "Zeile nach unten verschieben",
  move_line_up = "Zeile nach oben verschieben",
  
  -- Fensternavigation
  go_to_left_window = "Zum linken Fenster gehen",
  go_to_lower_window = "Zum unteren Fenster gehen",
  go_to_upper_window = "Zum oberen Fenster gehen",
  go_to_right_window = "Zum rechten Fenster gehen",
  
  -- Puffernavigation
  prev_buffer = "Vorheriger Puffer",
  next_buffer = "Nächster Puffer",
  delete_buffer = "Puffer löschen",
  delete_all_buffers_except_current = "Alle Puffer außer dem aktuellen löschen",
  
  -- Python
  select_python_venv = "Python-Umgebung auswählen",
  debug_python_test_method = "Python-Testmethode debuggen",
  debug_python_test_class = "Python-Testklasse debuggen",
  
  -- Rust
  rust_runnables = "Rust-Ausführbare",
  rust_debuggables = "Rust-Debuggable",
  
  -- LSP
  code_action = "Code-Aktion",
  rename = "Umbenennen",
  
  -- LaTeX
  latex_compile = "LaTeX kompilieren",
  latex_view_pdf = "PDF anzeigen",
  latex_clean = "Hilfsdateien bereinigen",
  latex_toc = "Inhaltsverzeichnis",
  latex_stop = "Kompilierung stoppen",
  
  -- PDF-Anzeige
  preview_file = "Datei-Vorschau",
  open_in_file_manager = "Im Datei-Manager öffnen",
  open_with_default = "Mit Standardprogramm öffnen",
  open_with_evince = "Mit Evince öffnen",
  open_with_zathura = "Mit Zathura öffnen",
  open_with_eog = "Mit EOG öffnen",
  open_with_mpv = "Mit MPV öffnen",
  
  -- Terminal
  terminal_cwd = "Terminal (aktuelles Verzeichnis)",
  exit_terminal_mode = "Terminal-Modus beenden",
  
  -- UI-Umschaltungen
  toggle_wrap = "Zeilenumbruch umschalten",
  clear_search_highlight = "Suchhervorhebung löschen",
  quit_all = "Alles beenden",
}

-- ---------------------------------------------------------
-- Which-key Group Names (分组名称)
-- ---------------------------------------------------------
M.which_key = {
  file = "Datei",
  find = "Finden",
  search = "Suchen",
  git = "Git",
  code = "Code",
  debug = "Debuggen",
  buffer = "Puffer",
  window = "Fenster",
  ui = "Oberfläche",
  python = "Python",
  rust = "Rust",
  latex = "LaTeX",
  markdown = "Markdown",
  terminal = "Terminal",
  quit = "Beenden",
  language = "Sprache",
}

-- ---------------------------------------------------------
-- Notification Messages (通知消息)
-- ---------------------------------------------------------
M.notifications = {
  -- Dateioperationen
  file_opened = "✅ Geöffnet: {filename}",
  file_saved = "✅ Datei gespeichert",
  folder_opened = "📂 Ordner geöffnet: {dirname}",
  
  -- Umbruch-Umschaltung
  wrap_enabled = "✅ Zeilenumbruch aktiviert",
  wrap_disabled = "❌ Zeilenumbruch deaktiviert",
  
  -- Dateivorschau
  file_not_exist = "❌ Datei existiert nicht oder kann nicht gelesen werden",
  file_type_not_supported = "ℹ️  Dateityp '{ext}' unterstützt möglicherweise keine Vorschau",
  cannot_open_file = "❌ Datei kann nicht geöffnet werden",
  opened_with_program = "✅ Mit {program} geöffnet",
  cannot_open_with_program = "❌ Kann nicht mit {program} geöffnet werden",
  
  -- Sprachwechsel
  language_switched = "✅ Sprache gewechselt zu {language}",
  already_using_language = "ℹ️  Verwendet bereits {language}",
  reload_suggestion = "💡 Einige Änderungen erfordern möglicherweise ein Neuladen von Neovim (:source $MYVIMRC oder Neustart)",
  unsupported_language = "❌ Nicht unterstützte Sprache: {lang}",
  failed_to_load_language = "❌ Fehler beim Laden des Sprachpakets: {lang}",
  fallback_to_english = "⚠️  Rückfall auf Englisch",
}

-- ---------------------------------------------------------
-- Commands (命令)
-- ---------------------------------------------------------
M.commands = {
  lang_switch_desc = "Oberflächensprache wechseln",
  lang_list_desc = "Verfügbare Sprachen auflisten",
  current_language = "Aktuelle Sprache: {language}",
  available_languages = "Verfügbare Sprachen:",
}

-- ---------------------------------------------------------
-- Prompts (提示)
-- ---------------------------------------------------------
M.prompts = {
  save_as_prompt = "Speichern unter: ",
  select_language = "Sprache auswählen",
}

-- ---------------------------------------------------------
-- Dashboard (启动界面)
-- ---------------------------------------------------------
M.dashboard = {
  find_file = "Datei suchen",
  new_file = "Neue Datei",
  recent_files = "Zuletzt verwendete Dateien",
  find_text = "Text suchen",
  lazy = "Lazy",
  quit = "Beenden",
  
  -- Footer
  loaded_plugins = "⚡ Neovim hat {loaded}/{count} Plugins in {ms}ms geladen",
}

return M
