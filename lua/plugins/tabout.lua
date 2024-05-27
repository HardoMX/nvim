return {
    'abecodes/tabout.nvim',
    config = function ()
        require('tabout').setup({
            tabkey = '<Tab>',
            backwards_tabkey = '<S-Tab>',
            act_as_tab = true,
            act_as_shift_tab = false,
            default_tab = '<C-t>',
            default_shift_tab = 'C-d',
            enable_nackwards = true,
            completion = false,
            tabouts = {
                {open = "'", close = "'"},
                {open = '"', close = '"'},
                {open = '`', close = '`'},
                {open = '(', close = ')'},
                {open = '[', close = ']'},
                {open = '{', close = '}'},
                {open = '<', close = '>'},
                --Add more if you need to
            },
            ignore_beginning = true,
            exclude = {},
        })
    end
}
