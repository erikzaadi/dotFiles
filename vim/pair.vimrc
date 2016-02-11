" Vim config - optimized for pairing

" Plug
    " Setting up Plug - A minimalist Vim plugin manager
        if empty(glob('~/.vim/autoload/plug.vim'))
            silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall | source ~/.vimrc
        endif
        set nocompatible              " be iMproved, required
        call plug#begin('~/.vim/plugged')

    " Setting up Plug end
        " General Vim
            Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
            Plug 'tpope/vim-fugitive'
            Plug 'tpope/vim-eunuch'
            Plug 'ctrlpvim/ctrlp.vim', { 'on':  'CtrlP' }
            Plug 'dkprice/vim-easygrep'
            Plug 'junegunn/gv.vim'
            Plug 'SirVer/ultisnips'
            Plug 'scrooloose/syntastic'
            Plug 'Raimondi/delimitMate'
            Plug 'mbbill/undotree'
            Plug 'scrooloose/nerdcommenter'
            Plug 'junegunn/vim-easy-align'
            Plug 'airblade/vim-gitgutter'
            Plug 'editorconfig/editorconfig-vim'
        " General Vim end

        " Color Schemes
            Plug 'altercation/vim-colors-solarized'
        " Color Schemes end

        " Misc
            Plug 'honza/vim-snippets'
         " Misc end
    " Plugs end

" Plug end

"Set Vim defaults
    set nobackup
    set noswapfile
    set history=256                " Number of things to remember in history.
    set notimeout
    set ttimeout
    set timeoutlen=50             " Time to wait after ESC (default causes an
    " annoying delay)
    set modeline
    set modelines=5                " default numbers of lines to read for
    set autowrite                  " Writes on make/shell commands
    set autoread
    set lazyredraw
    set hidden                     " The current buffer can be put to the
    " background without writing to disk
    set hlsearch                   " highlight search
    set incsearch                  " show matches while typing
    let g:is_posix = 1             " vim's default is archaic bourne shell,
    set tabstop=4                  " tab size eql 4 spaces
    set softtabstop=4
    set sts=4
    set sw=4
    set expandtab
    " set tw=120
    " set winwidth=120 nice idea, but a bit annoying on small terminalz
    " set winminwidth=120
    set mouse=a "enable mouse in GUI mode
    set mousehide                 " Hide mouse after chars typed
    set showmatch                 " Show matching brackets.
    set novisualbell              " No blinking
    set noerrorbells              " No noise.
    "set cc=121 " Right column
    set encoding=utf8
    set ai "Auto indent
    set wrap "Wrap lines
    set number                    " Line numers
    set shortmess=atTI " Hide enter to continue for external apps - GIT
    set cmdheight=1
    try
        lang en_US
    catch
    endtry
    set background=dark
    set laststatus=2
    set guioptions-=LR
    set wildmode=list:longest,full
    set wildignore+=*.pyc
    set completeopt-=preview
    set listchars=tab:▸\ ,trail:·
    set list

    set spellfile=~/.vim/vim-spell-en.utf-8.add
    set complete+=kspell
    set spelllang=en_us
" Vim defaults end

" Vim Plug Configs
    let NERDTreeShowHidden                = 1
    let NERDTreeIgnore                    = ['\.pyc$','\.swp$']                 "ignore compiled python files
    let g:syntastic_check_on_open         = 0
    let g:syntastic_auto_loc_list         = 1
    let g:syntastic_enable_signs          = 1
    let g:UltiSnipsSnippetsDir   = "~/.vim/plugged/vim-snippets/UltiSnips/"
    let g:UltiSnipsExpandTrigger = "<c-f>"
    let g:netrw_liststyle        = 3
    let g:delimitmate_expand_cr  = 2
    call plug#end()
    colorscheme solarized
    call togglebg#map("<F5>")

" Vim Plug Configs end
