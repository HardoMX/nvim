return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            local npairs = require("nvim-autopairs")
            local Rule = require("nvim-autopairs.rule")
            local cond = require("nvim-autopairs.conds")

            npairs.setup({
                ignored_next_char = "[%w%.]",
                fast_wrap = {
                    map = "<C-w>"
                },
            })

            local function rule2(a1, ins, a2, lang)
                npairs.add_rule(
                    Rule(ins, ins, lang)
                    :with_pair(function(opts) return a1 .. a2 == opts.line:sub(opts.col - #a1, opts.col + #a2 - 1) end)
                    :with_move(cond.none())
                    :with_cr(cond.none())
                    :with_del(function(opts)
                        local col = vim.api.nvim_win_get_cursor(0)[2]
                        return a1 .. ins .. ins .. a2 == opts.line:sub(col - #a1 - #ins + 1, col + #ins + #a2)
                    end)
                )
            end

            rule2("(", " ", ")")
            rule2("{", " ", "}")
            rule2("[", " ", "]")
        end
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        opts = {}
    }
}
