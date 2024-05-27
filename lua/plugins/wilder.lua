return {
    'gelguy/wilder.nvim',
    config = function ()
        local wilder = require('wilder')

        wilder.setup({ modes = {':', '/', '?'} })

        wilder.set_option('renderer', wilder.popupmenu_renderer(
            wilder.popupmenu_border_theme({
                highlights = {
                    border = 'Normal'
                },
                border = 'rounded',
                highlighter = wilder.basic_highlighter(),
                left = {' ', wilder.popupmenu_devicons()},
                right = {' ', wilder.popupmenu_scrollbar()},
                pumblend = 10,
            })
        ))
    end
}
