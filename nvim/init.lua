local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

opt.termguicolors   = true

-- Packer + get Packer if missing
local execute = vim.api.nvim_command
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

g.node_version = '17.2.0'
g.node_bin_dir = string.format('%s/.nvm/versions/node/.nvm/versions/node/v%s/bin/', os.getenv('HOME'), node_version)

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

require('plugs')
require('plugconfs')
require('filetypes')
require('keymaps')
require('defaults')

-- cmd 'colorscheme nord' -- fixes bad backgrounds
-- cmd 'hi Normal guibg=NONE ctermbg=NONE'
-- cmd 'hi Pmenu guibg=NONE ctermbg=NONE'
--[[ require("gruvbox").setup({
  transparent_mode = true,
}) ]]
cmd(":set background=dark")
cmd(string.format('colorscheme %s', g.current_theme))
