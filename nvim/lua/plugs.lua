local function random_fortuned_cow()
    math.randomseed(os.time())
    local cowsay_list = vim.split(table.concat(vim.fn.systemlist('cowsay -l | tail -n +2'), ' '), ' ')
    local random_index = math.random(#cowsay_list)
    local random_cow = cowsay_list[random_index]
    return vim.fn.systemlist('fortune -s | cowsay -f ' .. random_cow)
end

require('lazy').setup({
    -- General Vim
    'tpope/vim-fugitive',
    'tpope/vim-eunuch',
    { 'kylechui/nvim-surround', event = 'VeryLazy', opts = {} },
    'mfussenegger/nvim-dap',
    'theHamsta/nvim-dap-virtual-text',
    {
        'ray-x/guihua.lua',
        build = 'cd lua/fzy && make'
    },
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    {
        "ray-x/go.nvim",
        dependencies = { "ray-x/guihua.lua" },
        config = function() require("go").setup() end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()'
    },
    'yochem/jq-playground.nvim',
    { 'akinsho/git-conflict.nvim', version = '*', opts = {} },
    { 'echasnovski/mini.align', version = '*', opts = {} },
    { 'folke/ts-comments.nvim', opts = {}, event = 'VeryLazy' },
    {
        'moorereason/vim-markdownfmt',
        ft = { 'markdown' }
    },
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        dependencies = { 'rafamadriz/friendly-snippets' },
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
            require('snippets')
        end,
    },
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {}
    },
    {
        'elentok/scriptify.nvim',
        ft = 'sh',
        opts = {},
        cmd = { 'Scriptify' }
    },
    {
        'elentok/togglr.nvim',
        opts = { key = nil },
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            terminal = {
                win = {
                    backdrop = 0,
                    wo = { winblend = 0 },
                },
            },
            styles = {
                terminal = { background = "none" },
            },
            picker = { enabled = true },
            explorer = {
                enabled = true,
                ignored = true,
                hidden = true,
            },
            notifier = { enabled = true },
            git = { enabled = true },
            words = { enabled = true },
            zen = { enabled = true },
            image = { enabled = false },
            dashboard = {
                preset = {
                    header = table.concat(random_fortuned_cow(), "\n"),
                },
                sections = {
                    { section = "header" },
                    {
                        section = "terminal",
                        cmd = "gh run list --limit 5 2>/dev/null || true",
                        height = 7,
                        padding = 1,
                        ttl = 300,
                    },
                    { section = "keys" },
                    { section = "startup" },
                },
            },
        },
    },
    'neovim/nvim-lspconfig',
    -- General Vim end

    -- Completion
    {
        'nvimdev/guard.nvim',
        config = function()
            vim.g.guard_config = {
                fmt_on_save = false,
                lsp_as_default_formatter = true,
            }
        end,
        dev = false,
    },
    { 'hedyhli/outline.nvim', cmd = { 'Outline', 'OutlineOpen' }, opts = {} },
    {
        'folke/trouble.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
    {
        'saghen/blink.cmp',
        version = '*',
        dependencies = { 'L3MON4D3/LuaSnip' },
        opts = {
            snippets = { preset = 'luasnip' },
            keymap = {
                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
                ['<C-e>'] = { 'cancel', 'fallback' },
                ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
                ['<CR>'] = { 'accept', 'fallback' },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            completion = {
                documentation = { auto_show = true },
            },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    -- Completion End

    -- Color Schemes
    'sainnhe/gruvbox-material',
    -- Color Schemes end

    -- Web (generic)
    { 'catgoose/nvim-colorizer.lua', opts = {} },
    -- Web (generic) end

    -- Typescript
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },
    -- Typescript end

    -- Misc
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    },
    {
        'Glench/Vim-Jinja2-Syntax',
        ft = { 'jinja', 'jinja2' },
    },
    { 'sotte/presenting.nvim', ft = { 'markdown' }, opts = {} },
    -- Misc end

    'yasuhiroki/github-actions-yaml.vim',
    {
        "coder/claudecode.nvim",
        dev = true,
        dependencies = { "folke/snacks.nvim" },
        config = true,
        opts = {
            terminal = {
                provider = "none",
            },
        },
    },
}, {
    dev = {
        path = string.format('%s/mine', os.getenv('OPENSOURCEDIR')),
    },
})
