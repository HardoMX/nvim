return {
    'bennypowers/nvim-regexplainer',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'MunifTanjim/nui.nvim',
    },
    config = function ()
        require('regexplainer').setup({
            filetypes = {
                '*', -- You can be more specific, I always want to see what I am writing
            }
        })
    end
}
