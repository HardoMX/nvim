return {
    'tzachar/highlight-undo.nvim',
    opts = {
        duration = 300,
        undo = {
            hlgroup = 'HighlightUndo',
            mode = 'n',
            lhs = 'u',
            map = 'undo',
        },
        redo = {
            hlgroup = 'HighlightUndo',
            mode = 'n',
            lhs = 'C-r',
            map = 'redo',
        },
        highlight_for_count = true,
    },
    config = true,
}
