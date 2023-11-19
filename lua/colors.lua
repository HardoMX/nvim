function colors(color)
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)

    -- If you don't set opacity through WM, use these settings
    -- vim.api.nvim_set_hl(0, "Normal", {bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none" })
end

colors()
