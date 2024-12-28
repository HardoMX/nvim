local wk = require("which-key")

-- Mappings for basic usage
local oil = require("oil")
local tree = require("nvim-tree.api")
wk.add({
    { "<leader>c",  group = "Config" },
    { "<leader>cl", vim.cmd.Lazy,               desc = "Open Lazy.nvim control panel" },
    { "<leader>cm", vim.cmd.Mason,              desc = "Open Mason control panel" },
    { "<leader>R",  vim.cmd.RegexplainerToggle, desc = "Toggle regexplainer popup" },
    { "<leader>U",  vim.cmd.UndotreeToggle,     desc = "Toggle undotree" },
    { "<leader>o",  oil.toggle_float,           desc = "Toggle floating oil" },
    { "<leader>O",  oil.open,                   desc = "Open Oil buffer" },
    { "<leader>T",  tree.tree.toggle,           desc = "Open file tree" }
})

-- Mappings for buffer and window management
wk.add({
    { "<leader>w",   group = "Buffers and windows" },
    { "<leader>n",   "<C-w>w",                     desc = "Go to next window" },
    { "<leader>p",   "<C-w>W",                     desc = "Go to previous window" },
    { "<leader>ws",  group = "Split view" },
    { "<leader>wsh", vim.cmd.split,                desc = "Split view horizontally" },
    { "<leader>wsv", vim.cmd.vsplit,               desc = "Split view vertically" }
})
-- Add mapping for easily switching windows
for i = 1, 6 do
    local lhs = "<leader>w" .. i
    local rhs = i .. "<c-w>w"
    wk.add({
        { lhs, rhs, desc = "Move to window" .. i }
    })
end

-- Mappings for Telescope
local telescope = require("telescope.builtin")
local customtele = require("config.telescope")
wk.add({
    { "<leader>f",  group = "Find" },
    { "<leader>ff", telescope.find_files,                                                    desc = "Find files" },
    { "<leader>fw", telescope.live_grep,                                                     desc = "Find words in files" },
    { "<leader>fb", telescope.buffers,                                                       desc = "Find buffers" },
    { "<leader>fg", telescope.git_files,                                                     desc = "Find files not excluded by .gitignore" },
    { "<leader>fc", telescope.colorscheme,                                                   desc = "Choose from available colorschemes" },
    { "<leader>fs", telescope.spell_suggest,                                                 desc = "See spelling suggestions" },
    { "<leader>fq", telescope.quickfix,                                                      desc = "See available quickfixes" },
    { "<leader>fe", function() telescope.find_files({ cwd = vim.fn.stdpath("config") }) end, desc = "Open nvim config folder" },
    { "<leader>fz", customtele.live_multigrep,                                               desc = "Open file browser with filtering" },
    { "<leader>fp", telescope.planets,                                                       desc = "Use the telescope..." },
})

-- Mappings for Harpoon
local harpoon = require("harpoon")
wk.add({
    { "<leader>h",  group = "harpoon" },
    { "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Toggle harpoon menu" },
    { "<leader>ha", function() harpoon:list():add() end,                         desc = "Add current file to harpoon list" },
    { "<leader>hr", function() harpoon:list():remove() end,                      desc = "Remove current file from harpoon list" },
    { "<leader>hn", function() harpoon:list():next() end,                        desc = "Go to next harpoon entry" },
    { "<leader>hp", function() harpoon:list():prev() end,                        desc = "Go to previous harpoon entry" }
})

-- Most mappings for CMP can be found in lua/plugins/cmp.lua
wk.add({
    { "<leader>px",  group = "px to rem" },
    { "<leader>pxc", function() vim.cmd.PxToRemCursor() end, desc = "Convert px under cursor to rem" },
    { "<leader>pxl", function() vim.cmd.PxToRemLine() end,   desc = "Convert px on line to rem" }
})

-- Mappings for LSP
wk.add({
    { "<leader>l",  group = "LSP stuff" },
    { "<leader>lS", vim.cmd.LspRestart,                          desc = "Restart LSP" },
    { "<leader>lh", vim.lsp.buf.hover,                           desc = "Show hover info" },
    { "<leader>lr", function() vim.cmd.Glance("references") end, desc = "Show references (Glance)" },
    { "<leader>lR", telescope.lsp_references,                    desc = "Show references (Telescope)" },
    { "<leader>lD", vim.lsp.buf.declaration,                     desc = "Go to declaration" },
    { "<leader>ld", telescope.lsp_definitions,                   desc = "Go to definitions" },
    { "<leader>li", telescope.lsp_implementations,               desc = "Go to implementations" },
    { "<leader>lt", telescope.lsp_type_definitions,              desc = "Go to type definition" },
    { "<leader>ln", vim.lsp.buf.rename,                          desc = "Smart rename all matches" },
    { "<leader>ca", vim.lsp.buf.code_action,                     desc = "Show available code actions" },
    { "<leader>d",  group = "Diagnostics" },
    { "<leader>dD", telescope.diagnostics({ bufnr = 0 }),        desc = "Show buffer diagnostics" },
    { "<leader>dd", vim.diagnostic.open_float,                   desc = "Show line diagnostics" },
    { "<leader>dn", vim.diagnostic.goto_next,                    desc = "Go to next diagnostic" },
    { "<leader>dN", vim.diagnostic.goto_prev,                    desc = "Go to previous diagnostic" },
})

-- Mappings for Glance
wk.add({
    { "<leader>g",  group = "Glance (LSP)" },
    { "<leader>gd", function() vim.cmd.Glance("definitions") end,      desc = "Glance at definitions" },
    { "<leader>gD", function() vim.cmd.Glance("type_definitions") end, desc = "Glance at type definitions" },
    { "<leader>gr", function() vim.cmd.Glance("references") end,       desc = "Glance at references" },
    { "<leader>gi", function() vim.cmd.Glance("implementations") end,  desc = "Glance at implementations" },
})

-- Mappings for refactoring
local rf = require("refactoring")
wk.add({
    { "<leader>r",   group = "refactor" },
    { "<leader>ref", function() rf.refactor("Extract Function") end,                         desc = "Extract selection to separate function",                mode = "x" },
    { "<leader>reF", function() rf.refactor("Extract Function To File") end,                 desc = "Extract selection to separate function, in new file",   mode = "x" },
    { "<leader>rif", function() rf.refactor("Inline Function") end,                          desc = "Reverse extract, from function to separate code blocks" },
    { "<leader>rev", function() rf.refactor("Extract Variable") end,                         desc = "Extract values to variable",                            mode = "x" },
    { "<leader>riv", function() rf.refactor("Inline Variable") end,                          desc = "Reverse extract variable to separate values",           mode = { "x", "n" } },
    { "<leader>rb",  function() rf.refactor("Extract Block") end,                            desc = "Extract code block" },
    { "<leader>rbf", function() rf.refactor("Extract Block To File") end,                    desc = "Extract code block to file" },
    { "<leader>rr",  function() require("telescope").extensions.refactoring.refactors() end, desc = "Choose refactor with telescope, (kinda broken)",        mode = { "x", "n" } },
})

-- Mappings for Trouble
local trouble = require("trouble")
wk.add({
    { "<leader>t",  group = "Trouble diagnostics" },
    { "<leader>tt", function() trouble.toggle("diagnostics") end,                                            desc = "Toggle trouble diagnostics" },
    { "<leader>tT", function() trouble.filter({ mode = "diagnostics" }, { buf = 0 }, { toggle = true }) end, desc = "Toggle trouble for current buffer only" },
    { "<leader>tq", function() trouble.toggle("quickfix") end,                                               desc = "Toggle trouble quickfix" },
    { "<leader>tf", function() trouble.focus() end,                                                          desc = "Focus trouble window" },
})

-- Mappings for DAP
local dap = require("dap")
local dapui = require("dapui")
wk.add({
    { "<leader>db", dap.toggle_breakpoint,                                               desc = "Toggle breakpoint on current line" },
    { "<leader>dt", dapui.toggle,                                                        desc = "Toggle DAP UI" },
    { "<leader>de", dapui.eval,                                                          desc = "Evaluate expression under cursor" },
    { "<leader>dp", function() require("telescope").extensions.dap.configurations() end, desc = "Choose DAP configuration" },
    { "<leader>dc", dap.continue,                                                        desc = "DAP continue" },
    { "<leader>di", dap.step_into,                                                       desc = "DAP step into" },
    { "<leader>do", dap.step_over,                                                       desc = "DAP step over" },
    { "<leader>dO", dap.step_out,                                                        desc = "DAP step out" },
    { "<leader>dB", dap.step_back,                                                       desc = "DAP step back" },
    { "<leader>dq", dap.close,                                                           desc = "DAP stop" },
    { "<leader>dR", dap.restart,                                                         desc = "DAP restart" }
})

-- Mappings for Dial
local dial = require("dial.map")
wk.add({
    { "<C-a>",  function() dial.manipulate("increment", "normal") end },
    { "<C-x>",  function() dial.manipulate("decrement", "normal") end },
    { "g<C-a>", function() dial.manipulate("increment", "gnormal") end },
    { "g<C-x>", function() dial.manipulate("decrement", "gnormal") end },
    { "<C-a>",  function() dial.manipulate("increment", "visual") end,  mode = "v" },
    { "<C-x>",  function() dial.manipulate("decrement", "visual") end,  mode = "v" },
    { "g<C-a>", function() dial.manipulate("increment", "gvisual") end, mode = "v" },
    { "g<C-x>", function() dial.manipulate("decrement", "gvisual") end, mode = "v" },
})
