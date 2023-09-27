require('lazy').setup({
    -- [[ Speed up ]]
    --[[ {
        'lewis6991/impatient.nvim',
        opt = true,
        config = function() require('impatient') end
    } ]]
    -- General Vim
    -- TPope, make me a child
    'tpope/vim-fugitive',
    'tpope/vim-eunuch',
    'tpope/vim-surround',
    'tpope/vim-repeat',

    'chentoast/marks.nvim',

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
        'PedramNavid/dbtpal',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' }
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
            require('guard').setup({
                fmt_on_save = false,
                lsp_as_default_formatter = true,
            })
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
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
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
    'shaunsingh/nord.nvim',
    'shaunsingh/solarized.nvim',
    'luisiacc/gruvbox-baby',
    'ellisonleao/gruvbox.nvim',

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
    -- Typescript end

    -- Javascript / node
    -- 'jose-elias-alvarez/null-ls.nvim',
    -- Javascript / node end

    -- Go
    -- 'fatih/vim-go', { 'for' : ['go', 'markdown'] }
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
}, {
    dev = {
        path = string.format('%s/mine', os.getenv('OPENSOURCEDIR')),
    },
})
