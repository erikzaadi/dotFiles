" Commands
    command! -nargs=+ -complete=file -bar AgArgs Ag <args>
    command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
    command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Commands End
