local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

opt.termguicolors   = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

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
