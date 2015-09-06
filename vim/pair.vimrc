" Vim config - optimized for AWESOMENESS

" Vundle
    " Setting up Vundle - the vim plugin bundler
        let iCanHazVundle=1
        let vundle_readme=expand("~/.vim/bundle/Vundle.vim/README.md")
        if !filereadable(vundle_readme) 
            echo "Installing Vundle.."
            echo ""
            silent !mkdir -p ~/.vim/bundle
            silent !git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
            let iCanHazVundle=0
        endif
        set nocompatible              " be iMproved, required
        filetype off                  " required
        set rtp+=~/.vim/bundle/Vundle.vim/
        call vundle#begin()
        Plugin 'gmarik/Vundle.vim'

    " Setting up Vundle - the vim plugin bundler end

    " Bundles
        " General Vim
            Plugin 'scrooloose/nerdtree'
            Plugin 'tpope/vim-fugitive'
            Plugin 'tpope/vim-eunuch'
            Plugin 'ctrpvim/ctrlp.vim'
            Plugin 'SirVer/ultisnips'
            Plugin 'scrooloose/syntastic'
            Plugin 'tacahiroy/ctrlp-funky'
            Plugin 'bling/vim-airline'
            Plugin 'Valloric/YouCompleteMe'
            Plugin 'Raimondi/delimitMate'
            Plugin 'junegunn/vim-easy-align'
            Plugin 'tpope/vim-dispatch'
        " General Vim end
    
        " Color Schemes
            Plugin 'altercation/vim-colors-solarized'
        " Color Schemes end
        " Misc
            Plugin 'honza/vim-snippets'
            Plugin 'vim-scripts/nginx.vim' 
            Plugin 'chase/vim-ansible-yaml'
        " Misc end
    " Bundles end
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :PluginInstall
    endif

" Vundle end

"Set Vim defaults
    set nobackup
    set noswapfile
    set history=256                " Number of things to remember in history.
    set notimeout
    set ttimeout
    set timeoutlen=50             " Time to wait after ESC (default causes an
    " annoying delay)
    set modeline
    set modelines=5                " default numbers of lines to read for
    set autowrite                  " Writes on make/shell commands
    set autoread
    set hidden                     " The current buffer can be put to the
    " background without writing to disk
    set hlsearch                   " highlight search
    set incsearch                  " show matches while typing
    let g:is_posix = 1             " vim's default is archaic bourne shell,
    set tabstop=4                  " tab size eql 4 spaces
    set softtabstop=4
    set sts=4
    set sw=4
    set expandtab
    " set tw=120
    " set winwidth=120 nice idea, but a bit annoying on small terminalz
    " set winminwidth=120
    set mouse=a "enable mouse in GUI mode
    set mousehide                 " Hide mouse after chars typed
    set showmatch                 " Show matching brackets.
    set novisualbell              " No blinking
    set noerrorbells              " No noise.
    set cc=121 " Right column
    set encoding=utf8
    set ai "Auto indent
    set wrap "Wrap lines
    set number                    " Line numers
    set shortmess=atTI " Hide enter to continue for external apps - GIT
    set cmdheight=1
    try
        lang en_US
    catch
    endtry
    "set exrc			" enable per-directory .vimrc files
    "set secure         " disable unsafe commands in local .vimrc files

    "http://vim.wikia.com/wiki/Create_underlines,_overlines,_and_strikethroughs_using_combining_characters
    " modify selected text using combining diacritics
    command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
    command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
    command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
    command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')
    
    function! s:CombineSelection(line1, line2, cp)
      execute 'let char = "\u'.a:cp.'"'
      execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
    endfunction
" Vim defaults end

" Keymaps
    vmap <Enter> <Plug>(EasyAlign)
" Keymaps end

" Filetype overrides
     " Python
        au BufNewFile,BufRead *.py set shiftwidth=4 tabstop=4 softtabstop=4
        au FileType python set shiftwidth=4 tabstop=4 softtabstop=4
     " Python End
     
     " Javascript / Coffeescript / Node
        au BufNewFile,BufRead *.coffee set filetype=coffee
        "au! BufRead,BufNewFile *.json set filetype=json 
        au BufRead,BufNewFile *.ejs set filetype=html
        au BufRead,BufNewFile *.eco set filetype=html
        au BufNewFile,BufRead *.coffee,*.js set shiftwidth=2 tabstop=2 softtabstop=2
        au FileType javascript,coffee set softtabstop=2 tabstop=2 shiftwidth=2
    " Javascript / Coffeescript / Node end

    " Web
        au BufNewFile,BufRead *.less set filetype=less
        au BufRead,BufNewFile *.jade set filetype=jade
        au BufNewFile,BufRead *.styl set filetype=stylus
        au BufNewFile,BufRead *.stylus set filetype=stylus
        au FileType jade,stylus set softtabstop=2 tabstop=2 shiftwidth=2
    " Web end

    " Misc
        au BufNewFile,BufRead *tmux.conf set filetype=tmux
        au BufNewFile,BufRead *.pp set filetype=puppet
        autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
        au BufNewFile,BufReadPost *.md set filetype=markdown
        let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'stylus', 'python']
    " Misc end
 " Filetype overrides end


" Vim Plugin Configs
    set background=dark
    set t_Co=256
    "let g:solarized_termcolors=256
    "let g:solarized_termtrans=1

    set laststatus=2
    set guioptions-=LR
    set wildmode=list:longest,full


    let NERDTreeShowHidden                = 1
    let NERDTreeIgnore                    = ['\.pyc$','\.swp$']                 "ignore compiled python files
    set wildignore+=*.pyc
    set wildignore+=**/node_modules
    let g:syntastic_ignore_files          = ['\.py$']
    let NERDTreeMouseMode                 = 3
    let g:syntastic_python_checkers       = ['pylint']
    let g:syntastic_check_on_open         = 0
    let g:syntastic_auto_loc_list         = 1
    let g:syntastic_style_warning_symbol  = '☔'
    let g:syntastic_style_error_symbol    = '⚑'
    let g:syntastic_error_symbol          = '✗'
    let g:syntastic_warning_symbol        = '⚠'
    
    let g:syntastic_mode_map                = { 'mode': 'passive',
                                    \ 'active_filetypes': [],
                                    \ 'passive_filetypes': ['java'] }
    let g:airline_powerline_fonts           = 1
    let g:airline_theme                     = 'solarized'
    let g:UltiSnipsUsePythonVersion         = 2
    let g:jedi#rename_command               = "<S-F12>"
    let g:ycm_add_preview_to_completeopt    = 0
    let g:ycm_confirm_extra_conf            = 0
    set completeopt-=preview

    let g:UltiSnipsSnippetsDir              = "~/.vim/bundle/vim-snippets/UltiSnips/"
    let g:UltiSnipsExpandTrigger            = "<c-f>"
    "let g:user_emmet_leader_key='<C-s>'
    "let g:UltiSnips.always_use_first_snippet = 1
    "
    let g:used_javascript_libs              = 'underscore,angularjs,chai,jquery'
    let g:tmuxcomplete#trigger              = 'omnifunc'
    let g:airline#extensions#branch#format  = 'Git_flow_branch_format'
    let g:netrw_liststyle                   = 3
    let g:delimitmate_expand_cr             = 2

    call vundle#end() 
    filetype plugin indent on " load filetype plugins/indent settings
    colorscheme solarized
    syntax on                      " enable syntax
    call togglebg#map("<F5>")
 

" Vim Plugin Configs end
