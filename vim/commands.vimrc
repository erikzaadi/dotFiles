" Commands
    " command! -nargs=+ -complete=file -bar AgArgs Ag <args>
    command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
    command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
" Commands End
