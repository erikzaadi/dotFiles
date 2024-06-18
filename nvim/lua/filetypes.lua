local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local g   = vim.g      -- a table to access global variables

-- Filetype overrides
 -- Python
    cmd 'au BufNewFile,BufRead *.py set shiftwidth=4 tabstop=4 softtabstop=4 expandtab'
    cmd 'au FileType python set shiftwidth=4 tabstop=4 softtabstop=4 expandtab'
 -- Python End
    cmd 'au BufNewFile,BufRead *.star set shiftwidth=2 tabstop=2 softtabstop=2 expandtab filetype=bzl'


 -- Javascript / Coffeescript / Node
    cmd 'au BufNewFile,BufRead *.coffee,*.js,*.jsx set shiftwidth=2 tabstop=2 softtabstop=2 expandtab'
    cmd 'au BufNewFile,BufRead *.json set conceallevel=0'
    cmd 'autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart'
    cmd 'autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear'
    cmd 'au FileType javascript,coffee,typescript,typescriptreact,jsx,tsx,ts set softtabstop=2 tabstop=2 shiftwidth=2 expandtab'
-- Javascript / Coffeescript / Node end

-- Go
    cmd 'au BufNewFile,BufRead *.go set shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab'
-- Go end

-- Web
-- Web end

-- Java
    cmd 'au BufNewFile,BufRead *.java set tags=$PWD/.tags'
-- Java end

-- Misc
    cmd 'au BufNewFile,BufRead *tmux.conf set filetype=tmux'
    cmd 'au BufNewFile,BufRead *.j2 set filetype=jinja'
    cmd 'au BufNewFile,BufRead Jenkinsfile set filetype=groovy'
    cmd 'autocmd FileType gitcommit call setpos(\'.\', [0, 1, 1, 0])'
    cmd 'au BufNewFile,BufReadPost *.md set filetype=markdown'
    cmd 'au BufNewFile,BufReadPost *.mdx set filetype=markdown'
    g.markdown_fenced_languages = {'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'stylus', 'python', 'go', 'yaml', 'sh', 'bash=sh', 'zsh', 'groovy'}
    -- Spell-check Markdown files
    cmd 'autocmd FileType markdown setlocal spell'
    -- Spell-check Git messages
    cmd 'autocmd FileType gitcommit setlocal spell'
    cmd 'au BufNewFile,BufRead *.prisma setfiletype graphql'
    --[[ cmd 'au BufNewFile,BufRead *.yaml set filetype=yaml.ansible'
    cmd 'au BufNewFile,BufRead *.yml set filetype=yaml.ansible' ]]
    cmd 'au FileType markdown nmap <leader>s :<C-u>call markdownfmt#Format()<CR>'
    cmd 'au BufNewFile,BufRead *.nacl set filetype=salto.vhdl'
-- Misc end
-- Filetype overrides end
