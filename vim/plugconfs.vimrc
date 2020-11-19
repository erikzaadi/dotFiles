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
    let g:node_bin_dir = expand('~/.nvm/versions/node/v'.g:node_version.'/bin/')

    let g:coc_node_path= g:node_bin_dir.'node'

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
    let g:ale_disable_lsp = 1
    let g:ale_open_list = 1
    let g:ale_set_quickfix = 0
    let g:ale_virtualenv_dir_names = ['.venv', '.env']
    let g:ale_completion_autoimport = 0
    let g:ale_completion_enabled = 0

    let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'python': ['pycodestyle'],
      \ 'go': ['gopls'],
    \}
    "
      " \ 'typescriptreact': ['eslint'],
      " \ 'typescript': ['eslint'],


    " let g:neoformat_verbose = 1
    let g:neoformat_only_msg_on_error = 1

    let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server']
    let g:lsp_settings_filetype_typescriptreact = ['typescript-language-server', 'eslint-language-server']
    let g:lsp_signs_enabled = 1
    let g:lsp_signs_error = {'text': '✗'}
    let g:lsp_signs_warning = {'text': '➜'}
    let g:lsp_signs_hint = {'text': '?'}

    let g:neoformat_typescript_prettier = {
                \ 'exe': g:node_bin_dir."prettier",
                \ 'args': ['--stdin-filepath', '"%:p"', '--parser', 'typescript', '--no-semi', '--single-quote', '--print-width', '100', '--arrow-parens', 'avoid'],
                \ 'stdin': 1,
                \ }

    let g:neoformat_enabled_typescript = ['prettier']

    let g:ale_fixers = ['prettier']
    let g:ale_typescript_prettier_options = '--no-semi --single-quote --trailing-comma all --print-width 100 --arrow-parens avoid'
    " let g:ale_typescriptreact_prettier_options = '--no-semi --single-quote --trailing-comma all --print-width 100 --arrow-parens avoid'

    let g:ale_linters_explicit = 1
    let g:ale_fixes_explicit = 1

    " let g:ale_lint_delay = 800
    " let g:ale_lint_on_text_changed = 'never'
    " let g:ale_lint_on_insert_leave = 0
    let g:ale_lint_on_save = 1
    let g:ale_fix_on_save = 0

    " let g:prettier#exec_cmd_async = 1
    " let g:prettier#autoformat = 0
    " let g:prettier#config#arrow_parens = 'always'

    " if !has('gui_running')
    "   set t_Co=256
    " endif


    let g:ale_sign_warning = '▲'
    let g:ale_sign_error = '✗'
    let g:lightline#ale#indicator_warnings = '▲'
    let g:lightline#ale#indicator_errors = '✗'

    hi link ALEWarningSign GitGutterChange
    hi link ALEErrorSign GitGutterDelete

    let g:lightline#ale#indicator_ok = '✓'



    let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'modified' ] ],
      \   'right': [['readonly', 'gitbranch', 'linter_warnings',
      \ 'linter_errors', 'linter_ok', 'linter_infos', 'asyncrun']]
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_infos': 'lightline#ale#infos',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \   'asyncrun': 'LightLineAsuncRun',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ 'component_type': {
      \   'readonly': 'error',
      \   'linter_checking': 'right',
      \   'linter_infos': 'right',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'right',
      \   'lsp': 'right',
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

    let g:gruvbox_transp_bg = 1
    let g:gruvbox_italic = 1

    let g:deoplete#enable_at_startup = 1

    let g:python_interpreter= "/usr/local/opt/python/libexec/bin/python"
    let g:tsuquyomi_disable_default_mappings = 1

    let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'dockerfile': [g:node_bin_dir.'docker-langserver',
    \ '--stdio'],
    \ 'json': [g:node_bin_dir.'vscode-json-languageserver',
    \ '--stdio'],
    \ 'go': ['~/.gocode/bin/gopls'],
    \ 'terraform': ['/usr/local/bin/terraform-ls', 'serve'],
    \ 'yaml': [g:node_bin_dir.'yaml-language-server',
    \ '--stdio'],
    \ }


    " \ 'typescript': [g:node_bin_dir.'typescript-language-server',
    " \ '--stdio'],
    " \ 'typescript.tsx': [g:node_bin_dir.'typescript-language-server',
    " \ '--stdio'],
    " \ 'typescriptreact': [g:node_bin_dir.'typescript-language-server',
    " \ '--stdio'],

    " \ 'typescriptreact': [g:node_bin_dir.'typescript-language-server',
    " \ '--stdio'],


    " Run gofmt on save
    autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" Vim Plug Configs end
"
" " " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif


" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction
