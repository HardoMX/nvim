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
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>ha', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

vim.keymap.set('n', '<leader>h1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>h2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>h3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>h4', function() ui.nav_file(4) end)
vim.keymap.set('n', '<leader>h5', function() ui.nav_file(5) end)
vim.keymap.set('n', '<leader>h6', function() ui.nav_file(6) end)
vim.keymap.set('n', '<leader>h7', function() ui.nav_file(7) end)
vim.keymap.set('n', '<leader>h8', function() ui.nav_file(8) end)
vim.keymap.set('n', '<leader>h9', function() ui.nav_file(9) end)

-- Undotree mappings
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Fugitive mappings
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

-- LSP, most are set in the plugin file
vim.keymap.set('n', '<leader>m', vim.cmd.Mason)


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
