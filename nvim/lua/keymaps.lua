local g     = vim.g      -- a table to access global variables
local cmd   = vim.cmd
g.mapleader = ' '
Mapper = require('nvim-mapper')
local function map(mode, keyMap, command, description, category, opts)
  local options = {noremap = true, silent=true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  Mapper.map(mode, keyMap, command, options, category or '', string.format('%s-%s', mode, keyMap), description or '')
end
-- map('', 'Q', '<nop>')
-- map('', '<Up>', '<Nop>')
-- map('', '<Down>', '<Nop>')
-- map('', '<Left>', '<Nop>')
-- map('', '<Right>', '<Nop>')
map('n', '<leader>m', '<cmd>Telescope mapper<cr>', 'Show all keymaps')
map('n', '<leader>F', '<cmd>Telescope find_files<cr>', 'Find all files')
map('n', '<leader>f', '<cmd>Telescope git_files<cr>', 'Find files in git')
map('n', '<leader>a', '<cmd>lua require(\'telescope.builtin\').live_grep{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>', 'Live grep (!)')
map('n', 'K', '<cmd>lua require(\'telescope.builtin\').grep_string{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>', 'Grep word under cursor')
map('n', '<leader>e', '<cmd>NvimTreeFindFileToggle<cr>', 'Open tree at current file')
map('n', '<leader>Q', '<cmd>lua prettier_current_file()<cr>', 'Format file with prettier')
map('n', '<leader>E', '<cmd>:NvimTreeToggle<cr>', 'Toggle File Tree')
map('n', '<leader>b', '<cmd>Telescope buffers<cr>', 'Show buffers')
map('n', '<leader>h', '<cmd>Telescope help_tags<cr>', 'Toggle help')
map('n', '<leader>I', '<cmd>lua require(\'telescope.builtin\').lsp_code_actions()<cr>', 'Show Code Actions')
map('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', 'Go to Definition')
map('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', 'Show info (hoover) on cursor')
map('n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', 'Show references')
map('n', '<leader>R', '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename')
map('n', '<leader>t', ':TroubleToggle<cr>', 'Toggle trouble (document errors)')
map('n', '<leader>T', '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Show type definition')
map('n', '<leader>i', '<cmd>lua vim.lsp.buf.formatting()<CR>', 'FORMAT ZE THINGZ')
map('n', '<leader>[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'Goto previous lsp error')
map('n', '<leader>]', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'Goto next lsp error')
map('n', '<leader>s', '<cmd>:Telescope ultisnips theme=get_dropdown<cr>', 'Show snippets')
map('n', 'z=', '<Cmd>Telescope spell_suggest theme=get_dropdown<CR>', 'Spell suggestions')
cmd 'xmap <Enter> <Plug>(EasyAlign)'
Mapper.map_virtual('v', '<Enter>', '', {}, '', 'easy_align', 'Easy Align selected')
map('i', '<F1>', '<Esc>', 'Stop F1 Madness')
map('n', '<F1>', '<Esc>', 'Stop F1 Madness')
map('v', '<F1>', '<Esc>', 'Stop F1 Madness')
map('', '<F1>', '<Esc>', 'Stop F1 Madness')
map('n', '<leader><leader>h', ':noh<CR>', 'Remove highlights')
map('n', '<leader><leader>r', ':redraw!<CR>', 'Redraw (SHIT HIT THE FAN)')
map('n', '<A-down>', '<C-W>+', 'Resize (down)')
map('n', '<A-up>', '<C-W>-', 'Resize (up)')
map('n', '<A-left>', '<C-W>>', 'Resize (left)')
map('n', '<A-right>', '<C-W><', 'Resize (right)')
-- fugitive git bindings -
-- http://www.reddit.com/r/vim/comments/21f4gm/best_workflow_when_using_fugitive/
map('n', '<leader>gs', ':Git<CR>', 'Status', 'Git')
map('n', '<leader>gc', ':Git commit -v -q<CR>', 'Commit', 'Git')
map('n', '<leader>gd', ':Gdiff<CR>', 'Diff', 'Git')
map('n', '<leader>gm', ':Gmove<Space>', 'Move', 'Git')
map('n', '<leader>go', ':Git checkout<Space>', 'Checkout', 'Git')
map('n', '<leader>gps', ':Git push<CR>', 'Push', 'Git')
map('n', '<leader>gpu', ':AsyncRun git pushu<CR>', 'Push (add tracked remote)', 'Git')
map('n', '<leader>gpf', ':Git push --force-with-lease<CR>', 'Push force', 'Git')
map('n', '<leader>gpr', ':Ginitpull<CR>', 'Init Pull', 'Git')
map('n', '<leader>grm', ':Git rebase -i master<CR>', 'Rebase master', 'Git')
map('', 'q:', ':q', 'Fat fingers be gone')
map('n', '<leader>;', ':next $MYVIMRC<CR>', 'Open init.vim')
map('n', '<leader><leader>;', ':source $MYVIMRC<CR>', 'reload nvim config')
map('n', '<leader><tab>', ':tabnext<CR>', 'Next', 'Tabs')
map('n', '<leader><S-tab>', ':tabprevious<CR>', 'Previous', 'Tabs')
map('n', '<leader><M-tab>', ':tabnew<CR>', 'New', 'Tabs')
