local g   = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

g.strip_whitespace_on_save  = 1
g.noautochdir               = 1
g.strip_whitespace_confirm  = 0
g.is_posix                  = true
-- NetRW
g.netrw_liststyle           = 1 -- Detail View
g.netrw_sizestyle           = 'H' -- Human-readable file sizes
-- g.netrw_list_hide        = '\(^\|\s\s\)\zs\.\S\+' -- hide dotfiles
g.netrw_hide                = 1 -- hide dotfiles by default
g.netrw_banner              = 0 -- Turn off banner

opt.backup                  = false
opt.swapfile                = false
opt.history                 = 256
opt.timeout                 = false
opt.ttimeout                = true
opt.timeoutlen              = 50 -- Time to wait after ESC (default causes an annoying delay)
opt.modeline                = true
opt.modelines               = 5
opt.autowrite               = true
opt.autoread                = true
opt.hidden                  = true
opt.hlsearch                = true
opt.incsearch               = true
opt.tabstop                 = 4
opt.softtabstop             = 4
opt.sts                     = 4
opt.sw                      = 4
opt.expandtab               = true
opt.mouse                   = ''                     -- duck the mouse
opt.mousehide               = true
opt.showmatch               = true               -- Show matching brackets.
opt.visualbell              = false             -- No blinking
opt.errorbells              = false             -- STFU.
opt.encoding                = 'utf8'
opt.ai                      = true
opt.wrap                    = true
opt.number                  = true
opt.shortmess               = 'atTIF' -- Hide enter to continue for external apps - GIT
opt.cmdheight               = 1
opt.termbidi                = true
opt.background              = dark
opt.laststatus              = 2
-- opt.guioptions          -= LR
opt.wildmode                = { 'list:longest' ,'full' }
-- opt.wildignore          += *.pyc
opt.showmode                = false
-- opt.completeopt          = noinsert,noselect,menuone
opt.listchars               = 'tab:▸\\ ,trail:·'
opt.list                    = true
opt.backspace               = { 'indent', 'eol', 'start' }
opt.spellfile               = string.format('%s/.vim/vim-spell-en.utf-8.add', vim.env.HOME)
-- opt.complete            += kspel
opt.spell                   = false
opt.spelllang               = { 'en_us' }
opt.conceallevel            = 0
opt.concealcursor           = 'niv'
opt.signcolumn              = 'yes'


-- Colors
-- opt.term         = 'xterm-256color'
opt.termguicolors   = true
opt.exrc            = true
