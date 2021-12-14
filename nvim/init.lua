local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- Packer + get Packer if missing
local execute = vim.api.nvim_command
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

require('plugs')
require('plugconfs')
require('filetypes')
require('keymaps')
require('defaults')

cmd 'colorscheme nord' -- fixes bad backgrounds
cmd 'colorscheme gruvbox'
-- cmd 'hi Normal guibg=NONE ctermbg=NONE'
-- cmd 'hi Pmenu guibg=NONE ctermbg=NONE'
