" Vim Plug Configs
    let g:plug_timeout                   = 180
    let NERDTreeShowHidden               = 1
    let NERDTreeIgnore                   = ['\.pyc$','\.swp$']                 "ignore compiled python files
    let g:syntastic_ignore_files         = ['\.py$']
    let NERDTreeMouseMode                = 3
    let g:syntastic_yaml_checkers        = ['jsyaml']
    let g:syntastic_go_checkers          = ['golint', 'govet', 'errcheck']
    let g:go_fmt_command                 = "goimports"
    let g:syntastic_check_on_open        = 0
    let g:syntastic_auto_loc_list        = 1
    let g:syntastic_javascript_checkers  = ['jshint']
    let g:syntastic_enable_signs         = 1
    let g:syntastic_scala_checkers       = ['']
    let g:syntastic_mode_map             = { 'mode': 'passive',
                                    \ 'active_filetypes': ['javascript', 'ansible', 'go'],
                                    \ 'passive_filetypes': ['java', 'scala'] }
    let g:airline_powerline_fonts        = 1
    let g:airline_theme                  = 'solarized'
    let g:UltiSnipsUsePythonVersion      = 2
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_confirm_extra_conf         = 0
    let g:UltiSnipsSnippetsDir           = "~/.vim/plugged/vim-snippets/UltiSnips/"
    let g:UltiSnipsExpandTrigger         = "<c-f>"
    let g:used_javascript_libs           = 'underscore,angularjs,chai,jquery'
    let g:netrw_liststyle                = 3
    let g:delimitmate_expand_cr          = 2
    let g:markdownfmt_command            = 'mdfmt'
    let g:EasyGrepFilesToExclude         = '*.swp,*~,.git/*,node_modules/*'
    set grepprg=git\ grep\ -n
    let g:EasyGrepCommand = 1

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    set completefunc+=emoji#complete
    set omnifunc+=emoji#complete
" Vim Plug Configs end
