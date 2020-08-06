" Keymaps
    let mapleader = "\<Space>""

    nnoremap Q <nop>

    " noremap <Up> <Nop>
    " noremap <Down> <Nop>
    " noremap <Left> <Nop>
    " noremap <Right> <Nop>

    map <silent> <Leader>a <ESC>:AgArgs<space>
    map <silent> <Leader>f <ESC>:GitFiles<RETURN>
    map <silent> <Leader>c <ESC>:GitFiles?<RETURN>
    map <silent> <Leader>F <ESC>:Files<RETURN>
    map <silent> <Leader>g <ESC>:Explore<RETURN>
    map <silent> <Leader>h <ESC>:Buffers<RETURN>
    map <silent> <Leader>r <ESC>:lnext<RETURN>
    map <silent> <Leader>d <ESC>:ALEGoToDefinition<RETURN>
    nmap <silent> <Leader>= <ESC>:Prettier<RETURN>
    nmap <silent> <Leader>] <Plug>(ale_next_wrap)
    nnoremap K :Ag <C-R><C-W><CR>
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
    nnoremap <Leader>gpu :AsyncRun git pushu<CR>
    nnoremap <Leader>gpf :Gpush --force-with-lease<CR>
    nnoremap <Leader>gpr :Ginitpull<CR>
    map q: :q
    nmap <silent>  <Leader>;  :next $MYVIMRC<CR>
    nmap <silent>  <Leader><Leader>;  :source $MYVIMRC<CR>

    nmap <leader><tab> :tabnext<CR>
    nmap <leader><S-Tab> :tabprevious<CR>

    " Insert mode completion
    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)

" Keymaps end
