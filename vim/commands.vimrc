" Commands
    command! -nargs=+ -complete=file -bar AgArgs Ag <args>
    command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
" Commands End
