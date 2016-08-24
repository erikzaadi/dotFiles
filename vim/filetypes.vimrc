" Filetype overrides
     " Python
        au BufNewFile,BufRead *.py set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
        au FileType python set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
     " Python End

     " Javascript / Coffeescript / Node
        au BufNewFile,BufRead *.coffee set filetype=coffee
        "au! BufRead,BufNewFile *.json set filetype=json
        au BufRead,BufNewFile *.ejs set filetype=html
        au BufRead,BufNewFile *.eco set filetype=html
        au BufNewFile,BufRead *.coffee,*.js set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
        au FileType javascript,coffee set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
    " Javascript / Coffeescript / Node end

    " Go
        au BufNewFile,BufRead *.coffee,*.js set shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
    " Go end

    " Web
        au BufNewFile,BufRead *.less set filetype=less
        au BufRead,BufNewFile *.jade set filetype=jade
        au BufNewFile,BufRead *.styl set filetype=stylus
        au BufNewFile,BufRead *.stylus set filetype=stylus
        au FileType jade,stylus set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
    " Web end

    " Java
        au BufNewFile,BufRead *.java set tags=$PWD/.tags
    " Java end

    " Misc
        au BufNewFile,BufRead *tmux.conf set filetype=tmux
        au BufNewFile,BufRead *.pp set filetype=puppet
        au BufNewFile,BufRead *.j2 set filetype=jinja
        autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
        au BufNewFile,BufReadPost *.md set filetype=markdown
        let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'stylus', 'python', 'go', 'yaml', 'ansible', 'nginx', 'sh', 'bash=sh', 'zsh']
        " Spell-check Markdown files
        autocmd FileType markdown setlocal spell
        " Spell-check Git messages
        autocmd FileType gitcommit setlocal spell
        au BufNewFile,BufRead *.yaml set filetype=yaml.ansible
        au BufNewFile,BufRead *.yml set filetype=yaml.ansible
        au FileType markdown nmap <leader>s :<C-u>call markdownfmt#Format()<CR>
    " Misc end
 " Filetype overrides end
