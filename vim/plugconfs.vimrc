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

    let g:gitgutter_map_keys = 0
    let g:gitgutter_sign_added = '•'
    let g:gitgutter_sign_modified = '•'
    let g:gitgutter_sign_removed = '•'
    let g:gitgutter_sign_modified_removed = '•'
    let g:gitgutter_highlight_lines = 0

    let g:ale_enable_signs               = 1
    let g:ale_virtualenv_dir_names = ['.venv', '.env']
    let g:ale_linters = { 'javascript': ['eslint'] }

    if !has('gui_running')
      set t_Co=256
    endif


    let g:ale_sign_warning = '▲'
    let g:ale_sign_error = '✗'
    hi link ALEWarningSign GitGutterChange
    hi link ALEErrorSign GitGutterDelete

    let g:lightline#ale#indicator_ok = '✓'

    let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'modified' ] ],
      \   'right': [['readonly', 'gitbranch', 'linter_warnings', 'linter_errors', 'linter_ok', 'asyncrun']]
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
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


    " ht https://github.com/statico/dotfiles

    let g:UltiSnipsUsePythonVersion      = 2
    let g:UltiSnipsSnippetsDir           = "~/.vim/plugged/vim-snippets/UltiSnips/"
    let g:UltiSnipsExpandTrigger         = "<c-f>"

    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_confirm_extra_conf         = 0
    let g:ycm_gocode_binary_path = "$GOPATH/bin/gocode"
    let g:ycm_godef_binary_path = "$GOPATH/bin/godef"
    let g:ycm_python_binary_path = '/usr/local/bin/python'
    let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
    let g:ycm_server_python_interpreter = '/usr/local/bin/python'

    let g:UltiSnipsUsePythonVersion = 3

    let g:used_javascript_libs           = 'underscore,angularjs,chai,jquery'
    let g:netrw_liststyle                = 3
    let g:delimitmate_expand_cr          = 2

    let g:markdownfmt_autosave           = 0

    let g:markdownfmt_command = 'mdfmt'

    let g:markdown_fenced_languages = ['python', 'sh', 'nginx', 'bash=sh', 'scala', 'javascript', 'yaml', 'json', 'go', 'tmux', 'ansible']

    let g:EasyGrepFilesToExclude         = '*.swp,*~,.git/*,node_modules/*'
    let g:EasyGrepCommand='rg'

    let g:solarized_termtrans = 1
    let g:solarized_term_italics = 1
    let g:solarized_termcolors = 256

" Vim Plug Configs end
