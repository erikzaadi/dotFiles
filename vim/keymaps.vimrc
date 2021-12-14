" Keymaps
    let mapleader = "\<Space>""

    nnoremap Q <nop>

    " noremap <Up> <Nop>
    " noremap <Down> <Nop>
    " noremap <Left> <Nop>
    " noremap <Right> <Nop>
    "
    if has('nvim')
        nnoremap <silent><leader>F <cmd>Telescope find_files<cr>
        nnoremap <silent><leader>f <cmd>Telescope git_files<cr>
        nnoremap <silent><leader>a <cmd>Telescope live_grep<cr>
        nnoremap <silent><leader>K <cmd>Telescope grep_string<cr>
        nnoremap <silent><leader>e <cmd>Telescope file_browser<cr>
        nnoremap <silent><leader>b <cmd>Telescope buffers<cr>
        nnoremap <silent><leader>h <cmd>Telescope help_tags<cr>
        nnoremap <silent><leader>i <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>
        nnoremap <silent><Leader>d <cmd>lua vim.lsp.buf.definition()<CR>
        nnoremap <silent><Leader>k <cmd>lua vim.lsp.buf.hover()<CR>
        nnoremap <silent><Leader>r <cmd>lua vim.lsp.buf.references()<CR>
        nnoremap <silent><Leader>R <cmd>lua vim.lsp.buf.rename()<CR>
        nnoremap <silent><Leader>t <cmd>lua vim.lsp.buf.type_definition()<CR>
        nnoremap <silent><Leader>I <cmd>lua vim.lsp.buf.formatting()<CR>
        nnoremap <silent><Leader>[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
        nnoremap <silent><Leader>] <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
    endif

    " map <silent> <Leader>i <ESC>:ALEFix<RETURN>

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

    " inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
    "             \ "\<lt>C-n>" :
    "             \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
    "             \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
    "             \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
    " imap <C-@> <C-Space>

    " fugitive git bindings -
    " http://www.reddit.com/r/vim/comments/21f4gm/best_workflow_when_using_fugitive/
    nnoremap <silent><Leader>gs :Git<CR>
    nnoremap <silent><Leader>gc :Git commit -v -q<CR>
    nnoremap <silent><Leader>gd :Gdiff<CR>
    nnoremap <silent><Leader>gm :Gmove<Space>
    nnoremap <silent><Leader>go :Git checkout<Space>
    nnoremap <silent><Leader>gps :Git push<CR>
    nnoremap <silent><Leader>gpu :AsyncRun git pushu<CR>
    nnoremap <silent><Leader>gpf :Git push --force-with-lease<CR>
    nnoremap <silent><Leader>gpr :Ginitpull<CR>
    nnoremap <silent><Leader>grm :Git rebase -i master<CR>
    map q: :q
    " autocmd FileType typescript setlocal completeopt+=menu,preview

    nmap <silent>  <Leader>;  :next $MYVIMRC<CR>
    nmap <silent>  <Leader><Leader>;  :source $MYVIMRC<CR>

    nmap <leader><tab> :tabnext<CR>
    nmap <leader><S-Tab> :tabprevious<CR>

    " " Insert mode completion
    " imap <c-x><c-k> <plug>(fzf-complete-word)
    " imap <c-x><c-f> <plug>(fzf-complete-path)
    " imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    " imap <c-x><c-l> <plug>(fzf-complete-line)

" Keymaps end
