-- =========================================================
-- French Language Pack (法语语言包)
-- =========================================================
-- Description: French translation pack
-- =========================================================

local M = {}

-- ---------------------------------------------------------
-- General Editing (通用编辑)
-- ---------------------------------------------------------
M.keymaps = {
  -- Opérations de fichier
  save_file = "Enregistrer le fichier",
  save_file_exit_insert = "Enregistrer et quitter l'insertion",
  save_as = "Enregistrer sous",
  
  -- Sélection et presse-papiers
  select_all = "Tout sélectionner",
  copy_to_clipboard = "Copier dans le presse-papiers",
  cut_to_clipboard = "Couper dans le presse-papiers",
  paste_from_clipboard = "Coller depuis le presse-papiers",
  
  -- Annuler/Rétablir
  undo = "Annuler",
  redo = "Rétablir",
  
  -- Indentation
  indent_left = "Indenter à gauche",
  indent_right = "Indenter à droite",
  
  -- Déplacement de ligne
  move_line_down = "Déplacer la ligne vers le bas",
  move_line_up = "Déplacer la ligne vers le haut",
  
  -- Navigation de fenêtre
  go_to_left_window = "Aller à la fenêtre de gauche",
  go_to_lower_window = "Aller à la fenêtre inférieure",
  go_to_upper_window = "Aller à la fenêtre supérieure",
  go_to_right_window = "Aller à la fenêtre de droite",
  
  -- Navigation de tampon
  prev_buffer = "Tampon précédent",
  next_buffer = "Tampon suivant",
  delete_buffer = "Supprimer le tampon",
  delete_all_buffers_except_current = "Supprimer tous les tampons sauf l'actuel",
  
  -- Python
  select_python_venv = "Sélectionner l'environnement virtuel Python",
  debug_python_test_method = "Déboguer la méthode de test Python",
  debug_python_test_class = "Déboguer la classe de test Python",
  
  -- Rust
  rust_runnables = "Exécutables Rust",
  rust_debuggables = "Déboguables Rust",
  
  -- LSP
  code_action = "Action de code",
  rename = "Renommer",
  
  -- LaTeX
  latex_compile = "Compiler LaTeX",
  latex_view_pdf = "Afficher le PDF",
  latex_clean = "Nettoyer les fichiers auxiliaires",
  latex_toc = "Table des matières",
  latex_stop = "Arrêter la compilation",
  
  -- Visualisation PDF
  preview_file = "Prévisualiser le fichier",
  open_in_file_manager = "Ouvrir dans le gestionnaire de fichiers",
  open_with_default = "Ouvrir avec le programme par défaut",
  open_with_evince = "Ouvrir avec Evince",
  open_with_zathura = "Ouvrir avec Zathura",
  open_with_eog = "Ouvrir avec EOG",
  open_with_mpv = "Ouvrir avec MPV",
  
  -- Terminal
  terminal_cwd = "Terminal (répertoire courant)",
  exit_terminal_mode = "Quitter le mode terminal",
  
  -- Bascules UI
  toggle_wrap = "Basculer le retour à la ligne",
  clear_search_highlight = "Effacer la surbrillance de recherche",
  quit_all = "Tout quitter",
}

-- ---------------------------------------------------------
-- Which-key Group Names (分组名称)
-- ---------------------------------------------------------
M.which_key = {
  file = "Fichier",
  find = "Trouver",
  search = "Rechercher",
  git = "Git",
  code = "Code",
  debug = "Déboguer",
  buffer = "Tampon",
  window = "Fenêtre",
  ui = "Interface",
  python = "Python",
  rust = "Rust",
  latex = "LaTeX",
  markdown = "Markdown",
  terminal = "Terminal",
  quit = "Quitter",
  language = "Langue",
}

-- ---------------------------------------------------------
-- Notification Messages (通知消息)
-- ---------------------------------------------------------
M.notifications = {
  -- Opérations de fichier
  file_opened = "✅ Ouvert: {filename}",
  file_saved = "✅ Fichier enregistré",
  folder_opened = "📂 Dossier ouvert: {dirname}",
  
  -- Bascule de retour à la ligne
  wrap_enabled = "✅ Retour à la ligne activé",
  wrap_disabled = "❌ Retour à la ligne désactivé",
  
  -- Prévisualisation de fichier
  file_not_exist = "❌ Le fichier n'existe pas ou ne peut pas être lu",
  file_type_not_supported = "ℹ️  Le type de fichier '{ext}' ne prend peut-être pas en charge l'aperçu",
  cannot_open_file = "❌ Impossible d'ouvrir le fichier",
  opened_with_program = "✅ Ouvert avec {program}",
  cannot_open_with_program = "❌ Impossible d'ouvrir avec {program}",
  
  -- Changement de langue
  language_switched = "✅ Langue changée en {language}",
  already_using_language = "ℹ️  Utilise déjà {language}",
  reload_suggestion = "💡 Certaines modifications peuvent nécessiter le rechargement de Neovim (:source $MYVIMRC ou redémarrer)",
  unsupported_language = "❌ Langue non prise en charge: {lang}",
  failed_to_load_language = "❌ Échec du chargement du pack de langue: {lang}",
  fallback_to_english = "⚠️  Retour à l'anglais",
}

-- ---------------------------------------------------------
-- Commands (命令)
-- ---------------------------------------------------------
M.commands = {
  lang_switch_desc = "Changer la langue de l'interface",
  lang_list_desc = "Lister les langues disponibles",
  current_language = "Langue actuelle: {language}",
  available_languages = "Langues disponibles:",
}

-- ---------------------------------------------------------
-- Prompts (提示)
-- ---------------------------------------------------------
M.prompts = {
  save_as_prompt = "Enregistrer sous: ",
  select_language = "Sélectionner la langue",
}

-- ---------------------------------------------------------
-- Dashboard (启动界面)
-- ---------------------------------------------------------
M.dashboard = {
  find_file = "Rechercher un fichier",
  new_file = "Nouveau fichier",
  recent_files = "Fichiers récents",
  find_text = "Rechercher du texte",
  lazy = "Lazy",
  quit = "Quitter",
  
  -- Footer
  loaded_plugins = "⚡ Neovim a chargé {loaded}/{count} plugins en {ms}ms",
}

return M
