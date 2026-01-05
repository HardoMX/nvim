vim.lsp.enable("lua_ls")
vim.lsp.enable("bashls")
vim.lsp.enable("clangd")
vim.lsp.enable("gopls")
vim.lsp.enable("vimls")
vim.lsp.enable("html")
vim.lsp.enable("yamlls")
vim.lsp.enable("pylsp")
vim.lsp.enable("marksman")

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        if vim.fn.expand('%') ~= "keymap.c" then -- Remove autoformatting for qmk-keymap file
            if client.supports_method("textDocument/formatting", 0) then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = args.buf,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                    end
                })
            end
        end
    end,
})


local signs = { Error = "", Warn = "⚠", Hint = "🗲", Info = "󰋽" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local severity = vim.diagnostic.severity
vim.diagnostic.config({
    virtual_text = false,
    signs = {
        text = {
            [severity.ERROR] = signs.Error,
            [severity.WARN] = signs.Warn,
            [severity.INFO] = signs.Info,
            [severity.HINT] = signs.Hint,
        }
    },
    underline = true,
})
