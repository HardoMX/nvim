return {
    'folke/which-key.nvim',
    config = function ()
        vim.o.timeout = true
        vim.o.timeout = 300
        require('which-key').setup({
            window = {
                border = 'single',
                winblend = 15,
            },
        })
    end
}
