" Functions

    function! LightLineAsuncRun() abort
        return g:asyncrun_status
    endfunction

    function! s:CombineSelection(line1, line2, cp)
      execute 'let char = "\u'.a:cp.'"'
      execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
    endfunction

" Functions End
