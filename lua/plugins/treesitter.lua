return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })()
    end,
    config = function ()
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
    end
}
