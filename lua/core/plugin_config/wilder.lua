local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

wilder.set_option('renderer', wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
        highlights = {
            border = 'Normal', -- highlight to use for the border
        },
        border = 'rounded', --'single', 'double', 'rounded', or 'solid'
        highlighter = wilder.basic_highlighter(),
        left = {' ', wilder.popupmenu_devicons()},
        right = {' ', wilder.popupmenu_scrollbar()}
    })
))
