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
    set mouse=                    "duck the mouse
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
    set noshowmode
    set completeopt-=preview
    set listchars=tab:▸\ ,trail:·
    set list
    set backspace=indent,eol,start

    set spellfile=~/.vim/vim-spell-en.utf-8.add
    set complete+=kspell
    set spelllang=en_us
    if has("termguicolors")
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
    endif
    "if has("macligatures")
    "    set macligatures
    "endif

    """ NetRW
    let g:netrw_liststyle = 1 " Detail View
    let g:netrw_sizestyle = "H" " Human-readable file sizes
    let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " hide dotfiles
    let g:netrw_hide = 1 " hide dotfiles by default
    let g:netrw_banner = 0 " Turn off banner
" Vim defaults end

