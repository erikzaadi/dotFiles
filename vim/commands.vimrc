" Commands
    command! -nargs=+ -complete=file -bar AgArgs Ag <args>
    command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
    "http://vim.wikia.com/wiki/Create_underlines,_overlines,_and_strikethroughs_using_combining_characters
    " modify selected text using combining diacritics
    command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
    command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
    command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
    command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')
" Commands End
