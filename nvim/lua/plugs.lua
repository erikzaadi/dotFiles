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
    'tpope/vim-surround',
    'tpope/vim-repeat',
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
    'rhysd/conflict-marker.vim',
    'junegunn/vim-easy-align',
    { 'folke/ts-comments.nvim', opts = {}, event = 'VeryLazy' },
    {
        'moorereason/vim-markdownfmt',
        ft = { 'markdown' }
    },
    'SirVer/ultisnips',
    'honza/vim-snippets',
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
            explorer = { enabled = true },
            notifier = { enabled = true },
            git = { enabled = true },
            words = { enabled = true },
            zen = { enabled = true },
            dashboard = {
                preset = {
                    header = table.concat(random_fortuned_cow(), "\n"),
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
    {
        'nvimdev/lspsaga.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('lspsaga').setup({})
        end,
    },
    {
        'folke/trouble.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'f3fora/cmp-spell',
            'hrsh7th/cmp-cmdline',
            'quangnguyen30192/cmp-nvim-ultisnips',
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
    {
        'rstacruz/vim-ultisnips-css',
        ft = { 'css' },
        dependencies = 'SirVer/ultisnips',
    },
    'mattn/emmet-vim',
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
    {
        'sotte/presenting.vim',
        ft = { 'markdown' },
    },
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
