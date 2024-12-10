local wk = require("which-key")

-- Mappings for basic usage
wk.add({
    { "<leader>l", vim.cmd.Lazy, desc = "Open Lazy.nvim control panel" },
    { "<leader>t", function() require("telescope").extensions.file_browser.file_browser() end, desc = "Open file browser" },
    { "<leader>R", vim.cmd.RegexplainerToggle, desc = "Toggle regexplainer popup" },
    { "<leader>U", vim.cmd.UndotreeToggle, desc = "Toggle undotree" }
})

-- Mappings for Telescope
local telescope = require("telescope.builtin")
wk.add({
    { "<leader>f", group = "find" },
    { "<leader>ff", telescope.find_files, desc = "Find files" },
    { "<leader>fw", telescope.live_grep, desc = "Find words in files" },
    { "<leader>fb", telescope.buffers, desc = "Find buffers" },
    { "<leader>fg", telescope.git_files, desc = "Find files not excluded by .gitignore" },
    { "<leader>fc", telescope.colorscheme, desc = "Choose from available colorschemes" },
    { "<leader>fs", telescope.spell_suggest, desc = "See spelling suggestions" },
    { "<leader>fq", telescope.quickfix, desc = "See available quickfixes" },
    { "<leader>fp", telescope.planets, desc = "Explore the universe" },
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
