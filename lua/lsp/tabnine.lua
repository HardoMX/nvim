require('tabnine').setup({
    disable_auto_comment = true,
    accept_keymap = "<S-Right>",
    dismiss_keymap = "<C-j>",
    debounce_ms = 800,
    suggestion_color = {gui  ="#808080", cterm = 244},
    exclude_filetypes = {"TelescopePrompt"},
    log_file_path = nil, -- Absolute path to tabnine log file
    })
