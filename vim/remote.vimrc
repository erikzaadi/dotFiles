" Vim config - optimized for minimalism-ish

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif
set nocompatible              " be iMproved, required
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'lifepillar/gruvbox8'
Plug 'pangloss/vim-javascript', { 'for' : ['javascript', 'jsx', 'json'] }
Plug 'tmux-plugins/vim-tmux', { 'for': ['tmux'] }
Plug 'moll/vim-node', { 'for' : ['javascript', 'json'] }
Plug 'isRuslan/vim-es6', { 'for' : ['javascript', 'json'] }
Plug 'vim-scripts/nginx.vim', { 'for': ['nginx'] }
Plug 'pearofducks/ansible-vim', { 'for' : ['yaml', 'ansible'] }
Plug 'robbles/logstash.vim'

" Defaults
set nobackup
set noswapfile
set tabstop=4
set number
set softtabstop=4
set sts=4
set sw=4
set background=dark
set backspace=indent,eol,start
" Filetypes
au BufNewFile,BufRead *tmux.conf set filetype=tmux
au BufNewFile,BufRead *.j2 set filetype=jinja
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
" Spell-check Markdown files
autocmd FileType markdown setlocal spell
" Spell-check Git messages
autocmd FileType gitcommit setlocal spell
au BufNewFile,BufRead *.yaml set filetype=yaml.ansible
au BufNewFile,BufRead *.yml set filetype=yaml.ansible

" Keymaps
let mapleader = "\<Space>""
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)


" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

map <silent> <Leader>a <ESC>:AgArgs<space>
map <silent> <Leader>f <ESC>:GitFiles<RETURN>
map <silent> <Leader>c <ESC>:GitFiles?<RETURN>
map <silent> <Leader>F <ESC>:Files<RETURN>
map <silent> <Leader>g <ESC>:Explore<RETURN>
map <silent> <Leader>h <ESC>:Buffers<RETURN>
map <silent> <Leader>r <ESC>:lnext<RETURN>
map <silent> <Leader>d <ESC>:YcmCompleter GoTo<RETURN>
map <silent> <Leader>D <ESC>:YcmCompleter GetDoc<RETURN>
map <silent> <Leader>ll <ESC>:YcmCompleter FixIt<RETURN>
map <silent> <Leader>nn <ESC>:YcmCompleter RefactorRename<space>
map <silent> <Leader>R <ESC>:lprevious<RETURN>
map <silent> <Leader>e <ESC>:cnext<RETURN>
map <silent> <Leader>E <ESC>:cprevious<RETURN>
map <silent> <Leader>t <ESC>:lopen<RETURN>
map <silent> <Leader>T <ESC>:copen<RETURN>
nnoremap K :Ag <C-R><C-W><CR>:cw<CR>
vmap <Enter> <Plug>(EasyAlign)
imap <F1> <Esc>
nmap <F1> <Esc>
vmap <F1> <Esc>
map <F1> <Esc>
nnoremap <Leader><Leader>h :noh<CR>
nnoremap <Leader><Leader>r :redraw!<CR>
nnoremap <A-down> <C-W>+
nnoremap <A-up> <C-W>-
nnoremap <A-left> <C-W><
nnoremap <A-right> <C-W>>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)


" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Vim Plug Configs
let g:plug_timeout                   = 180
let g:UltiSnipsUsePythonVersion      = 3
let g:UltiSnipsSnippetsDir           = "~/.vim/plugged/vim-snippets/UltiSnips/"
let g:UltiSnipsExpandTrigger         = "<c-f>"
let g:netrw_liststyle                = 3
let g:EasyGrepFilesToExclude         = '*.swp,*~,.git/*,node_modules/*'
set grepprg=git\ grep\ -n
let g:EasyGrepCommand = 1

set statusline+=%#warningmsg#
set statusline+=%*


call plug#end()
colorscheme gruvbox8
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
