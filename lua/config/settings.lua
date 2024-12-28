vim.g.mapleader = " "

vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.incsearch = true
vim.opt.smartcase = true

vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"

vim.opt.updatetime = 50

vim.opt.confirm = true

vim.opt.title = true

vim.opt.spell = true
vim.opt.spelllang = "en,sv"
vim.opt.spelloptions = "camel"
vim.opt.spellsuggest = "best"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[
cabbrev h vert h
cabbrev help vert help
]])

vim.opt.clipboard = "unnamedplus"
if vim.fn.has("wsl") == 1 then
    vim.api.nvim_create_autocmd("TextYankPost", {
        group = vim.api.nvim_create_augroup("Yank", { clear = true }),
        callback = function()
            vim.fn.system("clip.exe", vim.fn.getreg('"'))
        end
    })
end
