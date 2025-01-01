return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        quickfile = { enabled = true },
        notify = { enabled = true },
        notifier = { enabled = true },
        gitbrowse = { enabled = true },
        bigfile = { enabled = true },
        profiler = { enabled = true },
        rename = { enabled = true },
        dashboard = {
            enabled = true,
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                {
                    pane = 2,
                    icon = " ",
                    title = "Git Status",
                    section = "terminal",
                    enabled = function()
                        return require("snacks").git.get_root() ~= nil
                    end,
                    cmd = "git --no-pager diff --stat -B -M -C",
                    height = 5,
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 3,
                },
                { section = "startup" },
            }
        }
    }
}
