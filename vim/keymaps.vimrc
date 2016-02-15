" Keymaps
    let mapleader = "\<Space>""
    map <silent> <F2> :NERDTreeToggle<CR>
    map <silent> <F5> :NERDTreeFind<CR>
    map <silent> <F3> <ESC>:CtrlP<RETURN>
    map <silent> <F4> <ESC>:CtrlPFunky<RETURN>
    nnoremap <Leader>w :w<CR>
    nnoremap <Leader>o :CtrlP<CR>
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
    map <S-F6> <Esc> :lprev<CR>
    map <F8> <Esc> :TagbarToggle<CR>
    map <F12> <Esc> :YcmCompleter GoTo<CR>
    nnoremap <Leader><Leader>h :noh<CR>
    nnoremap <Leader><Leader>r :redraw!<CR>
    nnoremap <A-down> <C-W>+
    nnoremap <A-up> <C-W>-
    nnoremap <A-left> <C-W><
    nnoremap <A-right> <C-W>>
    nnoremap <Leader>o :CtrlP<CR>

    " fugitive git bindings -
    " http://www.reddit.com/r/vim/comments/21f4gm/best_workflow_when_using_fugitive/
    nnoremap <Leader>ga :Git add %:p<CR><CR>
    nnoremap <Leader>gs :Gstatus<CR>
    nnoremap <Leader>gc :Gcommit -v -q<CR>
    nnoremap <Leader>gd :Gdiff<CR>
    nnoremap <Leader>gp :Ggrep<Space>
    nnoremap <Leader>gm :Gmove<Space>
    nnoremap <Leader>gb :Git branch<Space>
    nnoremap <Leader>go :Git checkout<Space>
    nnoremap <Leader>gps :Dispatch! git push<CR>
    nnoremap <Leader>gpl :Dispatch! git pull<CR>
    map q: :q
    nmap <silent>  <Leader>;  :next $MYVIMRC<CR>
" Keymaps end
