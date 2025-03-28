if vim.env.PROF then
    local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"
    vim.opt.rtp:append(snacks)
    require("snacks.profiler").startup({
        startup = {
            event = "VimEnter"
        }
    })
end

require("config.settings")
require("config.lazy")
require("config.colors")
require("config.maps")
