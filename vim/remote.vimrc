" Vim config - optimized for minimalism

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif
set nocompatible              " be iMproved, required
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dkprice/vim-easygrep'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'mtscout6/syntastic-local-eslint.vim', { 'for' : ['javascript', 'json', 'markdown'] }
Plug 'moll/vim-node', { 'for' : ['javascript', 'json', 'markdown'] }
Plug 'isRuslan/vim-es6', { 'for' : ['javascript', 'json', 'markdown'] }
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': ['jinja', 'jinja2']}
Plug 'vim-scripts/nginx.vim', { 'for': ['nginx', 'markdown'] }
Plug 'tmux-plugins/vim-tmux', { 'for': ['tmux', 'markdown'] }
Plug 'pearofducks/ansible-vim'
Plug 'docker/docker' , {'rtp': 'contrib/syntax/vim/'}
Plug 'robbles/logstash.vim'


call plug#end()

colorscheme solarized
call togglebg#map("<F7>")


" Defaults
set nobackup
set noswapfile
set tabstop=4
set number
set softtabstop=4
set sts=4
set sw=4
set background=dark

" Filetypes
au BufNewFile,BufRead *tmux.conf set filetype=tmux
au BufNewFile,BufRead *.j2 set filetype=jinja
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'stylus', 'python', 'go', 'yaml', 'ansible', 'nginx', 'sh', 'bash=sh', 'zsh']
" Spell-check Markdown files
 autocmd FileType markdown setlocal spell
" Spell-check Git messages
autocmd FileType gitcommit setlocal spell
au BufNewFile,BufRead *.yaml set filetype=yaml.ansible

" Keymaps
let mapleader = "\<Space>""
map <silent> <F2> :NERDTreeToggle<CR>
map <silent> <F5> :NERDTreeFind<CR>
map <silent> <F3> <ESC>:GitFiles<RETURN>
map <silent> <F4> <ESC>:Files<RETURN>

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
let NERDTreeShowHidden               = 1
let NERDTreeIgnore                   = ['\.pyc$','\.swp$']                 "ignore compiled python files
let g:syntastic_ignore_files         = ['\.py$']
let g:syntastic_yaml_checkers        = ['jsyaml']
let g:syntastic_check_on_open        = 0
let g:syntastic_auto_loc_list        = 1
let g:syntastic_javascript_checkers  = ['eslint']
let g:syntastic_enable_signs         = 1
let g:airline_powerline_fonts        = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme                  = 'solarized'
let g:UltiSnipsUsePythonVersion      = 2
let g:UltiSnipsSnippetsDir           = "~/.vim/plugged/vim-snippets/UltiSnips/"
let g:UltiSnipsExpandTrigger         = "<c-f>"
let g:netrw_liststyle                = 3
let g:EasyGrepFilesToExclude         = '*.swp,*~,.git/*,node_modules/*'
set grepprg=git\ grep\ -n
let g:EasyGrepCommand = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
