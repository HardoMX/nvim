-- default configuration
require('illuminate').configure({
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    -- delay: delay in milliseconds
    delay = 100,
    -- filetype_overrides: filetype specific overrides.
    -- The keys are strings to represent the filetype while the values are tables that
    -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
    filetype_overrides = {},
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = {
        'dirvish',
        'fugitive',
    },
    -- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
    filetypes_allowlist = {},
    -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
    -- See `:help mode()` for possible values
    -- under_cursor: whether or not to illuminate under the cursor
    under_cursor = true,
    -- large_file_cutoff: number of lines at which to use large_file_config
    -- The `under_cursor` option is disabled when this cutoff is hit
    large_file_cutoff = nil,
    -- large_file_config: config to use for large files (based on large_file_cutoff).
    -- Supports the same keys passed to .configure
    -- If nil, vim-illuminate will be disabled for large files.
    large_file_overrides = nil,
    -- min_count_to_highlight: minimum number of matches required to perform highlighting
    min_count_to_highlight = 1,
})

local hl = require('GUI.theme').hl_theme

--Nordic colors
local ncFG = '#d08770'
local ncBG = '#324d67'

--Tokyonight colors
local tnnFG = '#ff7d66'
local tnnBG = '#37354b'

--Error colors
local errFG = '#ffffff'
local errBG = '#ff0000'

if hl == "tokyo-night" then
        vim.api.nvim_set_hl(0, 'IlluminatedWordText', { fg = tnnFG, bg = tnnBG})
        vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { fg = tnnFG, bg = tnnBG})
        vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { fg = tnnFG, bg = tnnBG})

elseif hl == "nordic" then
        vim.api.nvim_set_hl(0, 'IlluminatedWordText', { fg = ncFG, bg = ncBG})
        vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { fg = ncFG, bg = ncBG})
        vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { fg = ncFG, bg = ncBG})

else
    vim.api.nvim_set_hl(0, 'IlluminatedWordText', {fg = errFG, bg = errBG})
    vim.api.nvim_set_hl(0, 'IlluminatedWordRead', {fg = errFG, bg = errBG})
    vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', {fg = errFG, bg = errBG})
end
