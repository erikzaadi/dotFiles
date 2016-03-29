    " Plugs
        " General Vim
            " TPope, make me a child
            Plug 'tpope/vim-fugitive'
            Plug 'tpope/vim-eunuch'
            Plug 'tpope/vim-abolish'
            Plug 'tpope/vim-dispatch'
            Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
            Plug 'scrooloose/syntastic'
            Plug 'scrooloose/nerdcommenter'
            Plug 'junegunn/gv.vim'
            Plug 'junegunn/vim-emoji'
            Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'on': 'FZF' }
            Plug 'junegunn/vim-easy-align'
            Plug 'ctrlpvim/ctrlp.vim', { 'on':  'CtrlP' }
            Plug 'tacahiroy/ctrlp-funky', { 'on':  'CtrlPFunky' }
            Plug 'loremipsum'
            Plug 'tkhren/vim-fake'
            Plug 'majutsushi/tagbar'
            Plug 'dkprice/vim-easygrep'
            Plug 'ruanyl/vim-gh-line'
            Plug 'SirVer/ultisnips'
            Plug 'vim-airline/vim-airline'
            Plug 'vim-airline/vim-airline-themes'
            Plug 'itspriddle/vim-stripper'
            Plug 'Valloric/YouCompleteMe', { 'do' : '~/.vim/plugged/YouCompleteMe/install.py --gocode-completer --tern-completer' }
            Plug 'Raimondi/delimitMate'
            Plug 'chip/vim-fat-finger'
            Plug 'mbbill/undotree'
            Plug 'airblade/vim-gitgutter'
            Plug 'editorconfig/editorconfig-vim'
            Plug 'moorereason/vim-markdownfmt', { 'for' : 'markdown' }
        " General Vim end

        " Color Schemes
            Plug 'altercation/vim-colors-solarized'
        " Color Schemes end

        " Python
            "YouCompleteMe got me covered
            Plug 'jmcantrell/vim-virtualenv', { 'for': ['python', 'markdown'] }
        " Python end

        " Web (generic)
            Plug 'hail2u/vim-css3-syntax', { 'for' : ['css', 'markdown'] }
            Plug 'juvenn/mustache.vim', { 'for' : ['mustache', 'markdown'] }
            Plug 'digitaltoad/vim-jade', { 'for' : ['jade', 'markdown'] }
            Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
            Plug 'rstacruz/vim-ultisnips-css', { 'for' : 'css' }

"            Plug 'csscomb/vim-csscomb'
        " Web (generic) end

        " Javascript / node / coffeescript
            Plug 'moll/vim-node', { 'for' : ['javascript', 'json', 'markdown'] }
            Plug 'kchmck/vim-coffee-script', { 'for' : ['coffee', 'coffeescript', 'markdown'] }
            Plug 'isRuslan/vim-es6', { 'for' : ['javascript', 'json', 'markdown'] }
            Plug 'grvcoelho/vim-javascript-snippets', { 'for' : ['javascript', 'json', 'markdown'] }
        " Javascript / node /coffeescript end

        " Go
            Plug 'fatih/vim-go', { 'for' : ['go', 'markdown'] }
            Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh', 'for' : ['go', 'markdown'] }
        " Go

        " Scala
            Plug 'derekwyatt/vim-scala', { 'for' : 'scala' }
        " Scala End

        " Misc
            Plug 'joehanchoi/vim-jinja'
            Plug 'honza/vim-snippets'
            Plug 'vim-scripts/nginx.vim', { 'for': ['nginx', 'markdown'] }
            Plug 'tmux-plugins/vim-tmux', { 'for': ['tmux', 'markdown'] }
            Plug 'erikzaadi/vim-ansible-yaml', { 'for' : ['yaml', 'ansible', 'markdown'] }
        " Misc end
    " Plugs end

