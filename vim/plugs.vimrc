    " Plugs
        " General Vim
            " TPope, make me a child
            Plug 'tpope/vim-fugitive'
            Plug 'tpope/vim-eunuch'
            Plug 'tpope/vim-abolish'
            Plug 'tpope/vim-commentary'
            Plug 'tpope/vim-vinegar'
            Plug 'tpope/vim-surround'
            Plug 'tpope/vim-repeat'
            Plug 'tpope/vim-rhubarb'

            Plug 'skywind3000/asyncrun.vim'
            Plug 'AndrewRadev/ginitpull.vim'
            Plug 'rhysd/conflict-marker.vim'
            Plug 'junegunn/gv.vim'
            Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            Plug 'junegunn/fzf.vim'
            Plug 'junegunn/vim-easy-align'
            Plug 'AndrewRadev/splitjoin.vim'
            Plug 'vim-scripts/loremipsum'
            Plug 'dkprice/vim-easygrep'
            Plug 'itchyny/lightline.vim'
            Plug 'itspriddle/vim-stripper'
            Plug 'Raimondi/delimitMate'
            Plug 'airblade/vim-gitgutter'
            Plug 'editorconfig/editorconfig-vim'
            Plug 'moorereason/vim-markdownfmt', { 'for' : 'markdown' }
            Plug 'idanarye/vim-merginal'
            Plug 'SirVer/ultisnips'
            Plug 'dense-analysis/ale'
            Plug 'maximbaz/lightline-ale'
        " General Vim end

        " Completion
        " Plug 'neoclide/coc.nvim', {'branch': 'release'}
        " Plug 'sbdchd/neoformat'

        if has('nvim')
            Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
            Plug 'neovim/nvim-lspconfig'
            Plug 'Shougo/deoplete.nvim'
        else
            Plug 'Shougo/denite.nvim'
            Plug 'Shougo/deoplete.nvim'
            Plug 'roxma/nvim-yarp'
            Plug 'roxma/vim-hug-neovim-rpc'
        endif

        Plug 'Shougo/vimproc.vim',  {'do' : 'make'}
        Plug 'fszymanski/deoplete-emoji'

        " Completion End

        " Color Schemes
            Plug 'gruvbox-community/gruvbox'
            " Plug 'lifepillar/vim-gruvbox8'
        " Color Schemes end

        " Python
            Plug 'jmcantrell/vim-virtualenv', { 'for': ['python', 'markdown'] }
        " Python end

        " Web (generic)
            Plug 'hail2u/vim-css3-syntax', { 'for' : ['css', 'markdown'] }
            Plug 'juvenn/mustache.vim', { 'for' : ['mustache', 'markdown'] }
            Plug 'digitaltoad/vim-pug', { 'for' : ['jade', 'pug', 'markdown'] }
            Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
            Plug 'rstacruz/vim-ultisnips-css', { 'for' : 'css' }
            Plug 'mattn/emmet-vim'
            Plug 'ap/vim-css-color'
        " Web (generic) end

        " Typescript
            " Plug 'yuezk/vim-js', { 'for': ['typescript', 'typescriptreact', 'tsx', 'markdown'] }
            " Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescriptreact', 'tsx', 'markdown'] }
            " Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['typescript', 'typescriptreact', 'tsx', 'markdown'] }
            " Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
            " Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
            " Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
            " Plug 'felippepuhle/coc-graphql', {'do': 'yarn install --frozen-lockfile'}
            " Plug 'pappasam/coc-jedi', {'do': 'yarn install --frozen-lockfile'}
            " Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
            " Plug 'pantharshit00/coc-prisma', {'do': 'yarn install --frozen-lockfile'}
            " Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
            " Plug 'bmatcuk/coc-stylelintplus', {'do': 'yarn install --frozen-lockfile'}
            " Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
            " Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
            Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript', 'typescriptreact', 'tsx', 'markdown'] }
            " Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
            Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'typescriptreact', 'tsx', 'markdown'] }
        " Typescript end

        " Javascript / node
            " Plug 'pangloss/vim-javascript', { 'for' : ['javascript', 'jsx', 'json', 'markdown'] }
            Plug 'jparise/vim-graphql'
            Plug 'mxw/vim-jsx', { 'for' : ['javascript', 'jsx', 'markdown'] }
            Plug 'moll/vim-node', { 'for' : ['javascript', 'json', 'markdown'] }
            Plug 'isRuslan/vim-es6', { 'for' : ['javascript', 'json', 'markdown'] }
        " Javascript / node end

        " Go
            " Plug 'fatih/vim-go', { 'for' : ['go', 'markdown'] }
        " Go

        " Scala
            " Plug 'derekwyatt/vim-scala', { 'for' : ['scala', 'markdown'] }
            " Plug 'natebosch/vim-lsc', { 'for' : ['scala', 'markdown'], 'do': 'install-vim-metal' }
        " Scala End

        " Misc
            Plug 'cespare/vim-toml'
            Plug 'hashivim/vim-terraform'
            Plug 'Glench/Vim-Jinja2-Syntax', { 'for': ['jinja', 'jinja2']}
            Plug 'honza/vim-snippets'
            Plug 'vim-scripts/nginx.vim', { 'for': ['nginx', 'markdown'] }
            Plug 'tmux-plugins/vim-tmux', { 'for': ['tmux', 'markdown'] }
            Plug 'pearofducks/ansible-vim', { 'for' : ['yaml', 'ansible', 'markdown'] }
            Plug 'sotte/presenting.vim', { 'for' : ['markdown'] }
            Plug 'ekalinin/Dockerfile.vim' , { 'for': ['Dockerfile', 'markdown']}
            Plug 'jparise/vim-graphql', { 'for': ['graphql', 'markdown']}
            Plug 'segeljakt/vim-isotope'
            Plug 'psliwka/vim-smoothie'
            " Plug 'tbastos/vim-lua'
"            Plug 'zirrostig/vim-jack-syntax', { 'for': ['jack']}
"            Plug 'suoto/vim-hdl', { 'for': ['vhdl', 'hdl']}
            "Plug 'tweekmonster/startuptime.vim'
        " Misc end
    " Plugs end

