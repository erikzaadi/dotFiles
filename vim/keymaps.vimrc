" Keymaps
    let mapleader = "\<Space>""

    nnoremap Q <nop>

    map <silent> <Leader>f <ESC>:GitFiles<RETURN>
    map <silent> <Leader>c <ESC>:GitFiles?<RETURN>
    map <silent> <Leader>F <ESC>:Files<RETURN>
    map <silent> <Leader>g <ESC>:Explore<RETURN>
    map <silent> <Leader>h <ESC>:Buffers<RETURN>
    map <silent> <Leader>d <ESC>:YcmCompleter GoToDefinition<RETURN>
    map <silent> <Leader>r <ESC>:lnext<RETURN>
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

    " fugitive git bindings -
    " http://www.reddit.com/r/vim/comments/21f4gm/best_workflow_when_using_fugitive/
    nnoremap <Leader>gs :Gstatus<CR>
    nnoremap <Leader>gc :Gcommit -v -q<CR>
    nnoremap <Leader>gd :Gdiff<CR>
    nnoremap <Leader>gm :Gmove<Space>
    nnoremap <Leader>go :Git checkout<Space>
    nnoremap <Leader>gps :Gpush<CR>
    map q: :q
    nmap <silent>  <Leader>;  :next $MYVIMRC<CR>
    nmap <silent>  <Leader><Leader>;  :source $MYVIMRC<CR>

    " Mapping selecting mappings
    nmap <leader><tab> <plug>(fzf-maps-n)
    xmap <leader><tab> <plug>(fzf-maps-x)
    omap <leader><tab> <plug>(fzf-maps-o)

    " Insert mode completion
    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    " Toggle Colorscheme
    nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
        \ ? substitute(g:colors_name, 'dark', 'light', '')
        \ : substitute(g:colors_name, 'light', 'dark', '')
        \ )<cr>
" Keymaps end
