vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } }, {})

require('nvim-tree').setup{}

require('nvim-treesitter.configs').setup{
    -- Always install these anguages, more can be added with :TSInstall <language>
    ensure_installed = {'c', 'cpp', 'lua', 'bash', 'vim', 'vimdoc', 'query', 'python', 'markdown', 'html', 'css', 'scss', 'javascript', 'typescript', 'json', 'yaml', 'yuck', 'regex'},

    -- Don't install parsers synchronously
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    highlight = {
        enable = true,
        -- Follow Tresitter instructions if you need more options regarding highlighting
    },
}

require("maps")
require("set")
require("colors")
