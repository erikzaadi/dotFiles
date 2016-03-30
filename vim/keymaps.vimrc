" Keymaps
    let mapleader = "\<Space>""
    map <silent> <F2> :NERDTreeToggle<CR>
    map <silent> <F5> :NERDTreeFind<CR>
    map <silent> <F3> <ESC>:GitFiles<RETURN>
    map <silent> <Leader>f <ESC>:FZF<RETURN>
    map <silent> <F4> <ESC>:CtrlPFunky<RETURN>
    nnoremap <Leader>w :w<CR>
    nnoremap <Leader>o :GitFiles<CR>
    vmap <Enter> <Plug>(EasyAlign)
    "Oy vei, trying without arrows
""    nnoremap <up> <nop>
""    nnoremap <down> <nop>
""    nnoremap <left> <nop>
""    nnoremap <right> <nop>
""    inoremap <up> <nop>
""    inoremap <down> <nop>
""    inoremap <left> <nop>
""    inoremap <right> <nop>
    map <F1> <Esc>
    map <F6> <Esc> :lnext<CR>
    map <F8> <Esc> :TagbarToggle<CR>
    map <F12> <Esc> :YcmCompleter GoTo<CR>
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
    nnoremap <Leader>gps :Dispatch! git push<CR>
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

    " Keymaps end
