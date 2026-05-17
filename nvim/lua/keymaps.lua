vim.g.mapleader = ' '

local keys = {
    -- LSP
    { "<leader>o", "<cmd>Outline<CR>",                                            desc = "Toggle outline" },
    { "<leader>I", function() vim.lsp.buf.code_action() end,                      desc = "Show Code Actions" },
    { "<leader>d", function() vim.lsp.buf.definition() end,                       desc = "Go to Definition" },
    { "<leader>D", function() vim.lsp.buf.type_definition() end,                  desc = "Go to Type Definition" },
    { "<leader>k", function() vim.lsp.buf.hover() end,                            desc = "Hover doc" },
    { "<leader>r", function() Snacks.picker.lsp_references() end,                 desc = "Show references / definitions" },
    { "<leader>R", function() vim.lsp.buf.rename() end,                           desc = "Rename" },
    { "<leader>T", function() Snacks.picker.lsp_type_definitions() end,           desc = "Peek type definition" },
    { "<leader>i", "<cmd>lua vim.lsp.buf.format()<CR>",                           desc = "Format" },

    -- Picker (snacks)
    { "<leader>m", function() Snacks.picker.keymaps() end,  desc = "Show all keymaps" },
    { "<leader>F", function() Snacks.picker.files() end,    desc = "Find all files" },
    { "<leader>f", function() Snacks.picker.git_files() end, desc = "Find files in git" },
    { "<leader>a", function() Snacks.picker.grep({ cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1] }) end, desc = "Live grep" },
    { "K",         function() Snacks.picker.grep_word({ cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1] }) end, desc = "Grep word under cursor" },
    { "<leader>b", function() Snacks.picker.buffers() end,  desc = "Show buffers" },
    { "<leader>h", function() Snacks.picker.help() end,     desc = "Help tags" },
    { "z=",        function() Snacks.picker.spelling() end, desc = "Spell suggestions" },

    -- Explorer (snacks)
    { "<leader>e", function() Snacks.explorer() end, desc = "Toggle explorer at current file" },
    { "<leader>E", function() Snacks.explorer() end, desc = "Toggle explorer" },

    -- Git log / browse (snacks)
    { "<leader>gl", function() Snacks.picker.git_log() end,  desc = "Git log" },
    { "<leader>gb", function() Snacks.gitbrowse() end,       desc = "Git browse (open in browser)" },
    { "<leader>'",  function() Snacks.picker.marks() end,    desc = "Browse marks" },

    -- Trouble / diagnostics (buffer-scoped)
    { "<leader>tt", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Toggle trouble (buffer)" },
    { "<leader>[",  function() vim.diagnostic.jump({ count = -1, float = true }) end, desc = "Previous error" },
    { "<leader>]",  function() vim.diagnostic.jump({ count = 1,  float = true }) end, desc = "Next error" },
    { "<leader>tb", "<cmd>TodoTrouble<cr>", desc = "TODO Trouble" },
    { "<leader>td", function() Snacks.picker.todo_comments() end, desc = "TODO picker" },

    -- Editing
    { "<leader>Q",  "<cmd>lua prettier_current_file()<cr>", desc = "Format with prettier" },
    { "<leader>tw", function() require('togglr').toggle_word() end, desc = "Toggle word" },

    -- Debug
    { "<leader>B", function() require('dap').toggle_breakpoint() end, desc = "Toggle breakpoint" },

    -- UI / notifications
    { "<leader>H",       function() Snacks.dashboard() end,     desc = "Dashboard (home)" },
    { "<leader>z",       function() Snacks.zen() end,           desc = "Toggle Zen Mode" },
    { "<leader>Z",       function() Snacks.zen.zoom() end,      desc = "Toggle Zoom" },
    { "<leader><leader>q", function() Snacks.notifier.hide() end, desc = "Remove notifications" },
    { "<leader><leader>h", ":noh<CR>",    desc = "Remove highlights" },
    { "<leader><leader>r", ":redraw!<CR>", desc = "Redraw" },

    -- Window resize
    { "<A-down>",  "<C-W>+", desc = "Resize window down" },
    { "<A-up>",    "<C-W>-", desc = "Resize window up" },
    { "<A-left>",  "<C-W>>", desc = "Resize window left" },
    { "<A-right>", "<C-W><", desc = "Resize window right" },

    -- Fat finger fixes
    { "<F1>", "<Esc>", mode = "i", desc = "Stop F1 madness" },
    { "<F1>", "<Esc>", mode = "n", desc = "Stop F1 madness" },
    { "<F1>", "<Esc>", mode = "v", desc = "Stop F1 madness" },
    { "<F1>", "<Esc>", mode = "",  desc = "Stop F1 madness" },
    { "q:",   ":q",    mode = "",  desc = "Fat fingers be gone" },

    -- Git (fugitive)
    { "<leader>gs",  ":Git<CR>",                        desc = "Status" },
    { "<leader>gc",  ":Git commit -v -q<CR>",           desc = "Commit" },
    { "<leader>gd",  ":Gdiff<CR>",                      desc = "Diff" },
    { "<leader>gm",  ":Gmove<Space>",                   desc = "Move" },
    { "<leader>go",  ":Git checkout<Space>",            desc = "Checkout" },
    { "<leader>gps", ":Git push<CR>",                   desc = "Push" },
    { "<leader>gpu", function() Snacks.terminal("git pushu") end, desc = "Push with upstream tracking" },
    { "<leader>gpf", ":Git push --force-with-lease<CR>", desc = "Push force" },
    { "<leader>grm", ":Git rebase -i master<CR>",       desc = "Rebase master" },

    -- Config
    { "<leader>;",       ":next $MYVIMRC<CR>",    desc = "Open init.lua" },
    { "<leader><leader>;", ":source $MYVIMRC<CR>", desc = "Reload nvim config" },

    -- Tabs
    { "<leader><tab>",   ":tabnext<CR>",     desc = "Next tab" },
    { "<leader><S-tab>", ":tabprevious<CR>", desc = "Previous tab" },
    { "<leader><M-tab>", ":tabnew<CR>",      desc = "New tab" },

    -- Claude Code
    { "<leader>cc", "<cmd>ClaudeCode<cr>",          desc = "Toggle Claude" },
    { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>",     desc = "Focus Claude" },
    { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>",     desc = "Add current buffer" },
    { "<leader>cs", "<cmd>ClaudeCodeSend<cr>",      mode = "v", desc = "Send to Claude" },
    { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>",  desc = "Deny diff" },
    { "<leader>cr", function()
        local cwd = vim.fn.getcwd()
        local session_file_path = cwd .. '/.claude_session'
        if vim.fn.filereadable(session_file_path) == 1 then
            local stored_cmd = (vim.fn.readfile(session_file_path)[1] or '')
            local session_id = stored_cmd:match('%-%-resume%s+(%S+)')
            if session_id then
                local claude_dir = vim.env.CLAUDE_CONFIG_DIR or (vim.env.HOME .. '/.claude')
                local encoded_cwd = cwd:gsub('[^a-zA-Z0-9]', '-')
                local jsonl_path = claude_dir .. '/projects/' .. encoded_cwd .. '/' .. session_id .. '.jsonl'
                if vim.fn.filereadable(jsonl_path) == 1 then
                    vim.cmd('ClaudeCode --resume')
                    return
                end
            end
            vim.fn.delete(session_file_path)
        end
        vim.cmd('ClaudeCode')
    end, desc = "Resume Claude" },
}

for _, km in ipairs(keys) do
    vim.keymap.set(km.mode or "n", km[1], km[2], {
        noremap = true, silent = true, desc = km.desc
    })
end
