" Vim Plug Configs
    let g:plug_timeout                   = 180

    let NERDTreeShowHidden               = 1
    let NERDTreeIgnore                   = ['\.pyc$','\.swp$']                 "ignore compiled python files
    let NERDTreeMouseMode                = 3

    let g:go_metalinter_enabled          = ['vet', 'golint', 'errcheck']
    let g:go_fmt_command                 = "goimports"
    let g:go_fmt_fail_silently           = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_types             = 1
    let g:go_highlight_fields            = 1
    let g:go_highlight_generate_tags     = 1
    let g:go_metalinter_deadline         = "5s"
    let g:go_list_type                   = "quickfix"

    let g:ansible_extra_syntaxes         = "nginx.vim sh.vim json.vim"

    "let g:ale_open_list = 1
    "let g:ale_set_loclist = 0
    "let g:ale_set_quickfix = 1
    let g:ale_enable_signs               = 1
    let g:ale_virtualenv_dir_names = ['.venv', '.env']

    if !has('gui_running')
      set t_Co=256
    endif


    let g:ale_sign_warning = '▲'
    let g:ale_sign_error = '✗'
    highlight link ALEWarningSign String
    highlight link ALEErrorSign Title



    "let g:airline_powerline_fonts        = 0
    "let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
    "let g:airline_left_sep               = ''
    "let g:airline_right_sep              = ''
    "let g:airline_theme                  = 'solarized'
    let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [['readonly', 'linter_warnings', 'linter_errors', 'linter_ok', 'asyncrun']]
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK',
      \   'asyncrun': 'LightLineAsuncRun'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_type': {
      \   'readonly': 'error',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error'
      \ },
      \ }



    " https://github.com/statico/dotfiles


    function! LightLineAsuncRun() abort
        return g:asyncrun_status
    endfunction


    function! LightlineLinterWarnings() abort
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors
        return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
    endfunction
    function! LightlineLinterErrors() abort
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors
        return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
    endfunction
    function! LightlineLinterOK() abort
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors
        return l:counts.total == 0 ? '✓ ' : ''
    endfunction

    " Update and show lightline but only if it's visible (e.g., not in Goyo)
    autocmd User ALELint call s:MaybeUpdateLightline()
    function! s:MaybeUpdateLightline()
        if exists('#lightline')
            call lightline#update()
        end
    endfunction

    let g:UltiSnipsUsePythonVersion      = 2
    let g:UltiSnipsSnippetsDir           = "~/.vim/plugged/vim-snippets/UltiSnips/"
    let g:UltiSnipsExpandTrigger         = "<c-f>"

    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_confirm_extra_conf         = 0
    let g:ycm_gocode_binary_path = "$GOPATH/bin/gocode"
    let g:ycm_godef_binary_path = "$GOPATH/bin/godef"

    let g:used_javascript_libs           = 'underscore,angularjs,chai,jquery'
    let g:netrw_liststyle                = 3
    let g:delimitmate_expand_cr          = 2
    let g:markdownfmt_command            = 'mdfmt'

    let g:EasyGrepFilesToExclude         = '*.swp,*~,.git/*,node_modules/*'
    set grepprg=git\ grep\ -n
    let g:EasyGrepCommand = 1

    command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

    let g:solarized_termtrans = 1
    let g:solarized_term_italics = 1
    let g:solarized_termcolors = 256

    "set statusline+=%#warningmsg#
    "set statusline+=%{ALEGetStatusLine()}
    "set statusline+=%*


" Vim Plug Configs end
