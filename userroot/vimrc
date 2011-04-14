set nocompatible               " be iMproved
set history=256                " Number of things to remember in history.
set timeoutlen=250             " Time to wait after ESC (default causes an
" annoying delay)
set clipboard+=unnamed         " Yanks go on clipboard instead.
set modeline
set modelines=5                " default numbers of lines to read for
set autowrite                  " Writes on make/shell commands
set autoread

set nobackup
set nowritebackup
set directory=/tmp//           " prepend(^=) $HOME/.tmp/ to default path;
" use full path as backup filename(//)
set hidden                     " The current buffer can be put to the
" background without writing to disk
set hlsearch                   " highlight search
set incsearch                  " show matches while typing
let g:is_posix = 1             " vim's default is archaic bourne shell,
set tabstop=4                  " tab size eql 2 spaces
set softtabstop=4
set autoindent
syntax on                      " enable syntax
set mouse=a "enable mouse in GUI mode
set mousehide                 " Hide mouse after chars typed
set showmatch                 " Show matching brackets.
set novisualbell              " No blinking
set noerrorbells              " No noise.
set vb t_vb=                  " disable any beeps or flashes on error
set rtp+=~/.vim/vundle.git/
call vundle#rc()
Bundle 'https://github.com/altercation/vim-colors-solarized.git'
Bundle 'https://github.com/vim-scripts/nginx.vim.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/mattn/zencoding-vim.git'
colorscheme solarized
if has ('gui_running')
	set background=light
else
	set background=dark
endif
