local cmd = vim.cmd
local g   = vim.g

g.current_theme = 'gruvbox-material'

require'nvim-treesitter.configs'.setup {
    auto_install = false,
    ensure_installed = {
        'bash', 'javascript', 'typescript',
        'yaml', 'css',
        'go', 'html', 'json', 'prisma',
        'graphql', 'lua', 'tsx',
        'markdown', 'markdown_inline', 'python',
        'hcl', 'dockerfile', 'editorconfig', 'git_config', 'git_rebase',
        'gitattributes', 'gitcommit', 'gitignore', 'gomod', 'gosum',
        'gotmpl', 'helm', 'jq', 'json5', 'luadoc', 'muttrc', 'nginx',
        'prql', 'regex', 'requirements', 'ruby', 'rust', 'sql', 'ssh_config',
        'terraform', 'tmux', 'toml', 'vue', 'xml',
    },
    highlight = {
        enable = true,
        -- nvim 0.12.2 ranged-parse crash in decoration provider for markdown
        disable = { 'markdown', 'markdown_inline' },
        additional_vim_regex_highlighting = false,
    },
}


-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md for full list
local servers = {
    'sqlls', 'yamlls', 'eslint', 'dockerls',
    'terraformls', 'tflint', 'bashls', 'html',
    'jsonls', 'pylsp', 'gopls', 'emmetls',
    -- typescript-tools is managed by its own plugin (pmizio/typescript-tools.nvim)
}

local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config('*', { capabilities = capabilities })
-- server-specific overrides: vim.lsp.config('yamlls', { settings = {...} }) merges with the wildcard above

for _, proto in ipairs(servers) do
    vim.lsp.enable(proto)
end

g.netrw_liststyle             = 3
g.netrw_hide                  = 0
g.markdownfmt_autosave        = 0
g.markdownfmt_command         = 'mdfmt'
g.markdown_fenced_languages   = {
    'css', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript',
    'html', 'python', 'go', 'yaml', 'sh', 'bash=sh', 'zsh',
    'sql', 'terraform', 'hcl', 'lua', 'rust', 'toml', 'graphql', 'tmux',
}

require'lualine'.setup({
    theme = g.current_theme,
    options = {
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        theme = g.current_theme
    },
    sections = {
        lualine_a = {
            { 'mode', fmt = function(str) return str:sub(1,1) end }
        },
        lualine_b = { 'branch' }
    }
})

require('trouble').setup {
    auto_close = true,
    focus = true,
    win = {
        type = 'float',
        size = { width = 0.8, height = 0.3 },
        position = 'bottom',
    },
}

function prettier_current_file()
    local filename = vim.api.nvim_buf_get_name(0)
    local root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
    local command = ':silent %!' .. root .. '/node_modules/.bin/prettier --stdin-filepath ' .. filename
    vim.cmd(command)
end

require("go").setup({
    dap_debug_keymap = false,
})

local ft = require('guard.filetype')
ft("typescript,javascript,typescriptreact,javascriptreact,svelte")
  :fmt({ fn = function() vim.cmd('EslintFixAll') end })
  :append('lsp')
-- Neovim 0.12.2 treesitter ranged-parse crashes in the decoration provider for certain
-- files (bash heredocs, markdown). Force vim syntax for markdown in all buffers since
-- something (LSP/snacks) calls vim.treesitter.start() directly, bypassing the disable list.
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown' },
    callback = function(ev)
        pcall(vim.treesitter.stop, ev.buf)
        vim.bo[ev.buf].syntax = 'markdown'
    end,
})
-- Use vim syntax in the picker preview instead — treesitter still works normally for other filetypes.
vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    once = true,
    callback = function()
        local ok, preview = pcall(require, 'snacks.picker.core.preview')
        if not ok then return end
        local orig = preview.highlight
        preview.highlight = function(self, opts)
            orig(self, opts)
            local buf = self.win.buf
            pcall(vim.treesitter.stop, buf)
            local ft = (opts and opts.ft)
                or (opts and opts.file and vim.filetype.match({ filename = opts.file }))
            if ft then vim.bo[buf].syntax = ft end
        end
    end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function()
        local pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[%s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, pos)
    end,
})

local function set_normal_float_highlight()
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = set_normal_float_highlight,
})

g.gruvbox_material_foreground = "original"
g.gruvbox_material_transparent_background = 1
g.gruvbox_material_enable_bold = 1
g.gruvbox_material_dim_inactive_windows = 1
g.gruvbox_material_better_performance = 1
