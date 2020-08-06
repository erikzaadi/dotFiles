" Vim Plug Configs
    let g:plug_timeout                   = 180

    let g:UltiSnipsSnippetDirectories=[$DOTFILESDIR.'/vim/snippets']


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

    let g:node_version = substitute(system('cat ~/.nvm/alias/default'), '\n', '', '')

    let g:fzf_layout = {
        \ 'window': {
        \ 'width': 0.8, 'height': 0.7, 'highlight': 'Terminal'
        \ }
    \ }
    let g:gitgutter_map_keys = 0
    let g:gitgutter_sign_added = '•'
    let g:gitgutter_sign_modified = '•'
    let g:gitgutter_sign_removed = '•'
    let g:gitgutter_sign_modified_removed = '•'
    let g:gitgutter_highlight_lines = 0

    let g:ale_enable_signs               = 1
    let g:ale_virtualenv_dir_names = ['.venv', '.env']
    let g:ale_linters = { 'javascript': ['eslint'] , 'python': ['pycodestyle'] }
    let g:ale_fixers = {'javascript': ['prettier'], 'typescript': ['prettier'], 'typescriptreact': ['prettier'] }
    " let g:ale_lint_delay = 800
    let g:ale_fix_on_save = 1

    " let g:prettier#exec_cmd_async = 1
    " let g:prettier#autoformat = 0
    " let g:prettier#config#arrow_parens = 'always'

    " if !has('gui_running')
    "   set t_Co=256
    " endif


    let g:ale_sign_warning = '▲'
    let g:ale_sign_error = '✗'
    hi link ALEWarningSign GitGutterChange
    hi link ALEErrorSign GitGutterDelete

    let g:lightline#ale#indicator_ok = '✓'

    let g:lightline = {
      \ 'colorscheme': 'jellybeans',
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
      \   'gitbranch': 'fugitive#head',
      \ },
      \ 'component_type': {
      \   'readonly': 'error',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error'
      \ },
      \ }

    let g:used_javascript_libs           = 'underscore,angularjs,chai,jquery'
    let g:netrw_liststyle                = 3
    let g:netrw_hide                    = 0
    let g:delimitmate_expand_cr          = 2

    let g:markdownfmt_autosave           = 0

    let g:markdownfmt_command = 'mdfmt'

    let g:markdown_fenced_languages = ['python', 'sh', 'nginx', 'bash=sh', 'scala', 'javascript', 'yaml', 'json', 'go', 'tmux', 'ansible']

    let g:EasyGrepFilesToExclude         = '*.swp,*~,.git/*,node_modules/*'
    let g:EasyGrepCommand='rg'

    " if (has("autocmd") && !has("gui_running"))
    "     augroup colorset
    "         autocmd!
    "         let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    "         autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
    "     augroup END
    " endif

    " let g:onedark_terminal_italics = 1

    let g:gruvbox_transp_bg = 1
    let g:gruvbox_italic = 1
    let g:python_interpreter= "/usr/local/opt/python@3.8/bin/python"


" Vim Plug Configs end
