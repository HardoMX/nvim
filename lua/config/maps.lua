local wk = require("which-key")

-- Mappings for basic usage
wk.add({
    { "<leader>l", vim.cmd.Lazy, desc = "Open Lazy.nvim control panel" },
    { "<leader>t", function() require("telescope").extensions.file_browser.file_browser() end, desc = "Open file browser" },
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
