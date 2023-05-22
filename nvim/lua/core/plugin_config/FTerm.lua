vim.keymap.set('n', '<Enter><Enter>', '<CMD>lua require("FTerm").open()<CR>')
vim.keymap.set('n', '<Esc>', '<C-\\><C-n><CMD>lua require("FTerm").close()<CR>')
