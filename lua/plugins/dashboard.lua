return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function ()
        require('dashboard').setup({
            theme = 'hyper',
            shortcut_type = 'number',
            hide = {
                statusline = true,
                tabline = true,
                winbar = true,
            },
        })
    end
}
