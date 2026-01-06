local snacks = require("snacks")
local prev = { new_name = "", old_name = "" }

vim.api.nvim_create_autocmd("User", {
    pattern = "NvimTreeSetup",
    callback = function()
        local events = require("nvim-tree.api").events
        events.subscribe(events.Event.NodeRenamed, function(data)
            if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
                data = data
                snacks.rename.on_rename_file(data.old_name, data.new_name)
            end
        end)
    end
})

vim.api.nvim_create_autocmd("User", {
    pattern = "OilActionPost",
    callback = function(event)
        if event.data.actions.type == "move" then
            Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
        end
    end
})
