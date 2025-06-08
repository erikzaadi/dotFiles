require('lazy').setup({
    -- [[ Speed up ]]
    --[[ {
        'lewis6991/impatient.nvim',
        opt = true,
        config = function() require('impatient') end
    } ]]
    -- General Vim
    -- TPope, make me a child
    'tpope/vim-rhubarb',
    'tpope/vim-fugitive',
    'tpope/vim-eunuch',
    'tpope/vim-surround',
    'tpope/vim-repeat',
    {
        'kdheepak/lazygit.nvim',
        dependencies =  {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim'
        },
        config = function() require('telescope').load_extension('lazygit') end,
    },
    'chentoast/marks.nvim',
    'mfussenegger/nvim-dap',
    'theHamsta/nvim-dap-virtual-text',
    {
        'ray-x/guihua.lua',
        build = 'cd lua/fzy && make'
    },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    {
        "ray-x/go.nvim",
        dependencies = {  -- optional packages
        "ray-x/guihua.lua",
        },
        config = function() require("go").setup() end,
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },

    'yochem/jq-playground.nvim',
    'b3nj5m1n/kommentary', -- sorry tpope
    {
        'gregorias/nvim-mapper',
        dependencies = 'nvim-telescope/telescope.nvim',
        config = function() require'nvim-mapper'.setup{} end,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        dependencies = 'nvim-telescope/telescope.nvim',
    },
    'skywind3000/asyncrun.vim',
    'puremourning/vimspector',
    'rhysd/conflict-marker.vim',
    {
        'junegunn/gv.vim',
        dependencies = 'tpope/vim-fugitive'
    },
    'junegunn/vim-easy-align',
    'vim-scripts/loremipsum',
    'itspriddle/vim-stripper',
    'Raimondi/delimitMate',
    'editorconfig/editorconfig-vim',
    {
        'moorereason/vim-markdownfmt',
        ft = { 'markdown' }
    },
    {
        'fhill2/telescope-ultisnips.nvim',
        dependencies = {
            'SirVer/ultisnips',
            'nvim-telescope/telescope.nvim',
        },
    },
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        'elentok/scriptify.nvim',
        ft = 'sh',
        opts = {},
        cmd = { 'Scriptify' }
    },
    {
        'elentok/togglr.nvim',
        opts = {
            key = nil,
        },
    },

    'neovim/nvim-lspconfig',
    -- General Vim end

    -- Completion

    {
        'nvimdev/guard.nvim',
        -- branch = 'add-default-lsp-option',
        config  = function ()
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
    'folke/lsp-colors.nvim',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} },
    },
    {
        'folke/trouble.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
    {
        'lewis6991/gitsigns.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
    {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    'jremmen/vim-ripgrep',
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'f3fora/cmp-spell',
            'alexander-born/cmp-bazel',
            'hrsh7th/cmp-cmdline',
            'ray-x/cmp-treesitter',
            'quangnguyen30192/cmp-nvim-ultisnips',
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    {
        'Shougo/vimproc.vim',
        build = 'make',
    },
    -- Completion End

    -- Color Schemes
    -- 'shaunsingh/nord.nvim',
    -- 'shaunsingh/solarized.nvim',
    -- 'luisiacc/gruvbox-baby',
    -- 'ellisonleao/gruvbox.nvim',
    'sainnhe/gruvbox-material',

    -- Color Schemes end

    -- Python
    --[[ {
        'jmcantrell/vim-virtualenv',
        ft = {'python', 'markdown'},
    }, ]]
    -- Python end

    -- Web (generic)
    {
        'rstacruz/vim-ultisnips-css',
        ft = { 'css' },
        dependencies = 'SirVer/ultisnips',
    },
    'mattn/emmet-vim',
    'ap/vim-css-color',
    -- Web (generic) end

    -- Typescript
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },
    -- Typescript end

    -- Javascript / node
    -- 'jose-elias-alvarez/null-ls.nvim',
    -- Javascript / node end

    -- Go
    -- 'fatih/vim-go',
    -- Go

    -- Scala
    -- 'derekwyatt/vim-scala', { 'for' : ['scala', 'markdown'] }
    -- 'natebosch/vim-lsc', { 'for' : ['scala', 'markdown'], 'do': 'install-vim-metal' }
    -- Scala End

    -- Misc
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons', opt = true},
    },
    'hashivim/vim-terraform',
    {
        'Glench/Vim-Jinja2-Syntax',
        ft = { 'jinja', 'jinja2' },
    },
    'honza/vim-snippets',
    {
        'vim-scripts/nginx.vim',
        ft = { 'nginx', 'markdown' },
    },
    {
        'tmux-plugins/vim-tmux',
        ft = { 'tmux', 'markdown' },
    },
    {
        'sotte/presenting.vim',
        ft = { 'markdown' },
    },
    {
        'ekalinin/Dockerfile.vim' ,
        ft = { 'Dockerfile', 'markdown' }
    },
    {
        'jparise/vim-graphql',
        ft = { 'graphql', 'markdown' }
    },
    -- 'mhinz/vim-startify'
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    -- 'tweekmonster/startuptime.vim'
    -- Misc end

    'yasuhiroki/github-actions-yaml.vim',
    'aklt/plantuml-syntax',
    'weirongxu/plantuml-previewer.vim',
    'tyru/open-browser.vim'
}, {
    dev = {
        path = string.format('%s/mine', os.getenv('OPENSOURCEDIR')),
    },
})
