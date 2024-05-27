local wk = require('which-key')

--  Base mappings
local ph = require('pretty_hover')
wk.register({
    l = { vim.cmd.Lazy, "Open Lazy control panel" },
    t = { vim.cmd.NvimTreeToggle, "Open filetree" },
    y = { vim.cmd.UndotreeToggle, "Open undotree" },
    m = { vim.cmd.Mason, "Open Mason control panel" },
    H = { function() ph.hover() end, "Toggle hover info" },
}, { prefix = "<leader>" })

-- Git mappings
local telescope = require('telescope.builtin')
wk.register({
    g = {
        name = "Git",
        f = { telescope.git_files, "Find files in working tree" },
        c = { telescope.get_commits, "See commits" },
        b = { telescope.git_branches, "See all branches" },
        s = { telescope.git_status, "See git status" }
    }
}, { prefix = "<leader>" })

-- Telescope and navigation mappings
wk.register({
    f = {
        name = "Find (Telescope etc.)",
        f = { telescope.find_files, "Find files" },
        c = { telescope.colorscheme, "Set colorscheme" },
        w = { telescope.live_grep, "Find word" },
        u = { telescope.grep_string, "Find word under cursor" },
        n = { vim.cmd.Navbuddy, "Open navbuddy" },
        h = { telescope.search_history, "Search history" },
        s = { telescope.spell_suggest, "Spell suggestions" },
        p = { telescope.planets, "Explore the universe" },
        -- builtin, reloader, current_buffer_fuzzy_find
    }
}, { prefix = "<leader>" })

-- Harpoon mappings
local harpoon = require("harpoon")
wk.register({
	h = {
		name = "Harpoon",
		h = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Quick menu" },
		a = { function() harpoon:list():append() end, "Add file to quick menu" },
		n = { function() harpoon:list():next() end, "Go to next file" },
		p = { function() harpoon:list():prev() end, "Go to previous file" },
		-- Add mappings for file 1..4, or longer, later
	}
}, { prefix = "<leader>" })

-- Comment mappings
-- Doesn't work with wk right now
wk.register({
    c = {
        name = "Comment",
        c = { function()
                return vim.v.count == 0
                and '<Plug>(comment_toggle_linewise_current)'
                or '<Plug>(comment_toggle_linewise_count)'
            end, "Comment linewise" },
        b = { function()
                return vim.v.count == 0
                and '<Plug>(comment_toggle_blockwise_current)'
                or '<Plug>(comment_toggle_blockwise_count)'
            end, "Comment blockwise" }
    }
}, { prefix = '<leader>' })
--[[ vim.keymap.set('n', '<leader>cc', function()
    return vim.v.count == 0
        and '<Plug>(comment_toggle_linewise_current)'
        or '<Plug>(comment_toggle_linewise_count)'
    end, { expr = true, desc = "Comment linewise" } )

vim.keymap.set('n', '<leader>bc', function()
    return vim.v.count == 0
        and '<Plug>(comment_toggle_blockwise_current)'
        or '<Plug>(comment_toggle_blockwise_count)'
    end, { expr = true, desc = "Comment blockwise" } ) ]]

vim.keymap.set('x', '<leader>c', '<Plug>(comment_toggle_linewise_visual)', { desc = "Comment linewise" })
vim.keymap.set('x', '<leader>b', '<Plug>(comment_toggle_blockwise_visual)',{ desc = "Comment blockwise" })

-- FTerm mappings
local FTerm = require('FTerm')

wk.register({
    T = {
        name = 'FTerm',
        t = { function() FTerm.toggle() end, 'Toggle terminal' },
        o = { function() FTerm.open() end, 'Open terminal' },
        c = { function() FTerm.close() end, 'Close terminal' },
    }
}, { prefix = '<leader>' })

-- Bbye mappings
wk.register({
    B = {
        name = 'Bbye, close a buffer',
        c = {vim.cmd.Bdelete, 'Delete buffer'},
        w = {vim.cmd.Bwipeout, 'Wipeout buffer'},
        a = {':bufdo :Bdelete<CR>', 'Delete all buffers'},
    },
}, { prefix = '<leader>' })




-- NVIM mappings

wk.register({
    J = { ":m '>+1<CR>gv=gv", "Move line down" },
    K = { ":m '>-2<CR>gv=gv", "Move line up" },
}, { mode = "v" })

-- Move line below to end of current line
vim.keymap.set('n', 'J', 'mzJ`z')

-- Keep search term in middle of screen
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Keep copied word instead of highlighted, when pasting
vim.keymap.set('x', '<leader>p', '\'_dP')

-- Delete without copying
vim.keymap.set('n', '<leader>d', '\'_d')
vim.keymap.set('v', '<leader>d', '\'_d')

-- Copy to system clipboard
vim.keymap.set('n', '<leader>y', '\'+y')
vim.keymap.set('v', '<leader>y', '\'+y')
vim.keymap.set('n', '<leader>Y', '\'+Y')

-- Replace all of hovered word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Easily make file axecutable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
