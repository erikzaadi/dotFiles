" Keymaps
    let mapleader = "\<Space>""

    nnoremap Q <nop>

    " noremap <Up> <Nop>
    " noremap <Down> <Nop>
    " noremap <Left> <Nop>
    " noremap <Right> <Nop>

    map <silent> <Leader>a <ESC>:RgArgs<space>
    map <silent> <Leader>f <ESC>:GitFiles<RETURN>
    map <silent> <Leader>c <ESC>:GitFiles?<RETURN>
    map <silent> <Leader>F <ESC>:Files<RETURN>
    map <silent> <Leader>g <ESC>:Explore<RETURN>
    " map <silent> <Leader>h <ESC>:Buffers<RETURN>
    "
    if has('nvim')
        nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>
        nnoremap <silent> <Leader>k <cmd>lua vim.lsp.buf.hover()<CR>
        nnoremap <silent> <Leader>r <cmd>lua vim.lsp.buf.references()<CR>
        nnoremap <silent> <Leader>R <cmd>lua vim.lsp.buf.rename()<CR>
        nnoremap <silent> <Leader>t <cmd>lua vim.lsp.buf.type_definition()<CR>
        nnoremap <silent> <Leader>I <cmd>lua vim.lsp.buf.formatting()<CR>
        nnoremap <silent> <Leader>[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
        nnoremap <silent> <Leader>] <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
    else
        nmap <silent> <Leader>] <Plug>(ale_next_wrap)
        nmap <silent> <Leader>[ <Plug>(ale_previous_wrap)
        map <silent> <Leader>d <ESC>:ALEGoToDefinition<RETURN>
        map <silent> <Leader>r <ESC>:ALERename<RETURN>
        map <silent> <Leader>I <ESC>:ALEOrganizeImports<RETURN>
        map <silent> <Leader>R <ESC>:ALEFindReferences<RETURN>
        map <silent> <Leader>k <ESC>:ALEHover<RETURN>
    endif

    map <silent> <Leader>i <ESC>:ALEFix<RETURN>

    nnoremap K :Rg <C-R><C-W><CR>
    vmap <Enter> <Plug>(EasyAlign)
    imap <F1> <Esc>
    nmap <F1> <Esc>
    vmap <F1> <Esc>
    map <F1> <Esc>
    nnoremap <Leader><Leader>h :noh<CR>
    nnoremap <Leader><Leader>r :redraw!<CR>
    nnoremap <A-down> <C-W>+
    nnoremap <A-up> <C-W>-
    nnoremap <A-left> <C-W>>
    nnoremap <A-right> <C-W><

    " inoremap <C-Space> <C-x><C-o>
    " inoremap <C-@> <C-Space>

    inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
                \ "\<lt>C-n>" :
                \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
                \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
                \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
    imap <C-@> <C-Space>

    " fugitive git bindings -
    " http://www.reddit.com/r/vim/comments/21f4gm/best_workflow_when_using_fugitive/
    nnoremap <Leader>gs :Gstatus<CR>
    nnoremap <Leader>gc :Gcommit -v -q<CR>
    nnoremap <Leader>gd :Gdiff<CR>
    nnoremap <Leader>gm :Gmove<Space>
    nnoremap <Leader>go :Git checkout<Space>
    nnoremap <Leader>gps :Git push<CR>
    nnoremap <Leader>gpu :AsyncRun git pushu<CR>
    nnoremap <Leader>gpf :Git push --force-with-lease<CR>
    nnoremap <Leader>gpr :Ginitpull<CR>
    nnoremap <Leader>grm :Git rebase -i master<CR>
    map q: :q
    " autocmd FileType typescript setlocal completeopt+=menu,preview

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
