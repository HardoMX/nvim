local wk = require("which-key")

-- Mappings for basic usage
wk.add({
    { "<leader>c", group = "Config" },
    { "<leader>cl", vim.cmd.Lazy, desc = "Open Lazy.nvim control panel" },
    { "<leader>cm", vim.cmd.Mason, desc = "Open Mason control panel" },
    { "<leader>t", function() require("telescope").extensions.file_browser.file_browser() end, desc = "Open file browser" },
    { "<leader>R", vim.cmd.RegexplainerToggle, desc = "Toggle regexplainer popup" },
    { "<leader>U", vim.cmd.UndotreeToggle, desc = "Toggle undotree" }
})

-- Mappings for Telescope
local telescope = require("telescope.builtin")
wk.add({
    { "<leader>f", group = "Find" },
    { "<leader>ff", telescope.find_files, desc = "Find files" },
    { "<leader>fw", telescope.live_grep, desc = "Find words in files" },
    { "<leader>fb", telescope.buffers, desc = "Find buffers" },
    { "<leader>fg", telescope.git_files, desc = "Find files not excluded by .gitignore" },
    { "<leader>fc", telescope.colorscheme, desc = "Choose from available colorschemes" },
    { "<leader>fs", telescope.spell_suggest, desc = "See spelling suggestions" },
    { "<leader>fq", telescope.quickfix, desc = "See available quickfixes" },
    { "<leader>fp", telescope.planets, desc = "Use the telescope..." },
})

-- Mappings for Harpoon
local harpoon = require("harpoon")
wk.add({
    { "<leader>h", group = "harpoon" },
    { "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Toggle harpoon menu" },
    { "<leader>ha", function() harpoon:list():add() end, desc = "Add current file to harpoon list" },
    { "<leader>hr", function() harpoon:list():remove() end, desc = "Remove current file from harpoon list" },
    { "<leader>hn", function() harpoon:list():next() end, desc = "Go to next harpoon entry" },
    { "<leader>hp", function() harpoon:list():prev() end, desc = "Go to previous harpoon entry" }
})

-- Mappings for CMP can be found in lua/plugins/cmp.lua

-- Mappings for LSP
wk.add({
    { "<leader>l", group = "LSP stuff" },
    { "<leader>lrs", vim.cmd.LspRestart, desc = "Restart LSP" },
    { "<leader>lh", vim.lsp.buf.hover, desc = "Show hover info" },
    { "<leader>lR", telescope.lsp_references, desc = "Show references"},
    { "<leader>lD", vim.lsp.buf.declaration, desc = "Go to declaration" },
    { "<leader>ld", telescope.lsp_definitions, desc = "Go to definitions" },
    { "<leader>li", telescope.lsp_implementations, desc = "Go to implementations" },
    { "<leader>lt", telescope.lsp_type_definitions, desc = "Go to definition" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Show available code actions" },
    { "<leader>rn", vim.lsp.buf.rename, desc = "Smart rename all matches" },
    { "<leader>d", group = "Diagnostics" },
    { "<leader>dD", telescope.diagnostics({bufnr=0}), desc = "Show buffer diagnostics" },
    { "<leader>dd", vim.diagnostic.open_float, desc = "Show line diagnostics" },
    { "<leader>dn", vim.diagnostic.goto_next, desc = "Go to next diagnostic" },
    { "<leader>dN", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic" },
})
