require('packer').startup(function()

    use 'wbthomason/packer.nvim'
    -- [[ Speed up ]]
    use {
        'lewis6991/impatient.nvim',
        opt = true,
        config = function() require('impatient') end
    }
    -- General Vim
    -- TPope, make me a child
    use 'tpope/vim-fugitive'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-abolish'
    -- use 'tpope/vim-commentary'
    use 'tpope/vim-vinegar'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-rhubarb'

    use 'b3nj5m1n/kommentary' -- sorry tpope

    use {
        'lazytanuki/nvim-mapper',
        before = 'telescope.nvim'
    }
    use 'skywind3000/asyncrun.vim'
    use 'AndrewRadev/ginitpull.vim'
    use 'rhysd/conflict-marker.vim'
    use 'junegunn/gv.vim'
    use 'junegunn/vim-easy-align'
    use 'AndrewRadev/splitjoin.vim'
    use 'vim-scripts/loremipsum'
    use 'itspriddle/vim-stripper'
    use 'Raimondi/delimitMate'
    use 'editorconfig/editorconfig-vim'
    use {
        'moorereason/vim-markdownfmt',
        ft = { 'markdown' }
    }
    use 'idanarye/vim-merginal'
    use {
        'fhill2/telescope-ultisnips.nvim',
        require = {
            'SirVer/ultisnips',
            'nvim-telescope/telescope.nvim',
        },
    }

    -- General Vim end

    -- Completion

    use 'neovim/nvim-lspconfig'

    use 'folke/lsp-colors.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} },
    }

    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
    }

    use 'jremmen/vim-ripgrep'

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'f3fora/cmp-spell',
            'alexander-born/cmp-bazel',
            'hrsh7th/cmp-cmdline',
            'ray-x/cmp-treesitter',
            'quangnguyen30192/cmp-nvim-ultisnips',
        },
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use {
        'Shougo/vimproc.vim',
        run = 'make',
    }
    -- Completion End

    -- Color Schemes
    use 'xiyaowong/nvim-transparent'
    -- use 'gruvbox-community/gruvbox'
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

    use 'shaunsingh/nord.nvim'
    -- use 'lifepillar/vim-gruvbox8'
    -- Color Schemes end

    -- Python
    use {
        'jmcantrell/vim-virtualenv',
        ft = {'python', 'markdown'},
    }
    -- Python end

    -- Web (generic)
    use {
        'rstacruz/vim-ultisnips-css',
        ft = { 'css' },
        requires = 'SirVer/ultisnips',
    }
    use 'mattn/emmet-vim'
    use 'ap/vim-css-color'
    -- Web (generic) end

    -- Typescript
    -- Typescript end

    -- Javascript / node
    -- use 'jose-elias-alvarez/null-ls.nvim'
    -- use 'MunifTanjim/prettier.nvim'
    -- Javascript / node end

    -- Go
    -- use 'fatih/vim-go', { 'for' : ['go', 'markdown'] }
    -- Go

    -- Scala
    -- use 'derekwyatt/vim-scala', { 'for' : ['scala', 'markdown'] }
    -- use 'natebosch/vim-lsc', { 'for' : ['scala', 'markdown'], 'do': 'install-vim-metal' }
    -- Scala End

    -- Misc
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
    }
    use 'cespare/vim-toml'
    use 'hashivim/vim-terraform'
    use {
        'Glench/Vim-Jinja2-Syntax',
        ft = { 'jinja', 'jinja2' },
    }
    use 'honza/vim-snippets'
    use {
        'vim-scripts/nginx.vim',
        ft = { 'nginx', 'markdown' },
    }
    use {
        'tmux-plugins/vim-tmux',
        ft = { 'tmux', 'markdown' },
    }
    use {
        'sotte/presenting.vim',
        ft = { 'markdown' },
    }
    use {
        'ekalinin/Dockerfile.vim' ,
        ft = { 'Dockerfile', 'markdown' }
    }
    use {
        'jparise/vim-graphql',
        ft = { 'graphql', 'markdown' }
    }
    use 'segeljakt/vim-isotope'
    use 'psliwka/vim-smoothie'
    use 'mhinz/vim-startify'
    -- use 'tweekmonster/startuptime.vim'
    -- Misc end
end)
