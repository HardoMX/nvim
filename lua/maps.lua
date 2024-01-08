local wk = require('which-key')

-- Lazy mappings
vim.keymap.set('n', '<leader>l', ':Lazy<CR>')

-- Telescope mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Nvim-Tree mappings
vim.keymap.set('n', '<leader>t', vim.cmd.NvimTreeToggle)

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

-- Undotree mappings
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Fugitive mappings
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

-- LSP, most are set in the plugin file
vim.keymap.set('n', '<leader>m', vim.cmd.Mason)

-- Comment mappings
vim.keymap.set('n', '<leader>cc', function()
    return vim.v.count == 0
        and '<Plug>(comment_toggle_linewise_current)'
        or '<Plug>(comment_toggle_linewise_count)'
    end, { expr = true } )

vim.keymap.set('n', '<leader>bc', function()
    return vim.v.count == 0
        and '<Plug>(comment_toggle_blockwise_current)'
        or '<Plug>(comment_toggle_blockwise_count)'
    end, { expr = true } )

vim.keymap.set('x', '<leader>c', '<Plug>(comment_toggle_linewise_visual)')
vim.keymap.set('x', '<leader>b', '<Plug>(comment_toggle_blockwise_visual)')

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
        c = {':Bdelete<CR>', 'Delete buffer'},
        w = {':Bwipeout<CR>', 'Wipeout buffer'},
        a = {':bufdo :Bdelete<CR>', 'Delete all buffers'},
    },
}, { prefix = '<leader>' })

-- Pretty Hover mappings
local ph = require('pretty_hover')
wk.register({
    H = { function () ph.hover() end, 'Toggle hover info' }
}, { prefix = '<leader>' })



-- NVIM mappings

-- Move highlighted code up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")

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
