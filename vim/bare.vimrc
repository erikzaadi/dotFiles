set nocompatible              " be iMproved, required

autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

hi Normal guibg=NONE ctermbg=NONE
hi Pmenu guibg=NONE ctermbg=NONE
filetype plugin indent on
if !exists("g:syntax_on")
    syntax enable
endif
