-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/erikzaadi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/erikzaadi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/erikzaadi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/erikzaadi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/erikzaadi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Dockerfile.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim",
    url = "https://github.com/ekalinin/Dockerfile.vim"
  },
  ["Vim-Jinja2-Syntax"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/Vim-Jinja2-Syntax",
    url = "https://github.com/Glench/Vim-Jinja2-Syntax"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["cmp-bazel"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/cmp-bazel",
    url = "https://github.com/alexander-born/cmp-bazel"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  ["conflict-marker.vim"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/conflict-marker.vim",
    url = "https://github.com/rhysd/conflict-marker.vim"
  },
  delimitMate = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/delimitMate",
    url = "https://github.com/Raimondi/delimitMate"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["ginitpull.vim"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/ginitpull.vim",
    url = "https://github.com/AndrewRadev/ginitpull.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/gruvbox-community/gruvbox"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/gv.vim",
    url = "https://github.com/junegunn/gv.vim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  loremipsum = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/loremipsum",
    url = "https://github.com/vim-scripts/loremipsum"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-transparent"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/nvim-transparent",
    url = "https://github.com/xiyaowong/nvim-transparent"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presenting.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/presenting.vim",
    url = "https://github.com/sotte/presenting.vim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-css-color",
    url = "https://github.com/ap/vim-css-color"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-graphql"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/vim-graphql",
    url = "https://github.com/jparise/vim-graphql"
  },
  ["vim-isotope"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-isotope",
    url = "https://github.com/segeljakt/vim-isotope"
  },
  ["vim-markdownfmt"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/vim-markdownfmt",
    url = "https://github.com/moorereason/vim-markdownfmt"
  },
  ["vim-merginal"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-merginal",
    url = "https://github.com/idanarye/vim-merginal"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-ripgrep",
    url = "https://github.com/jremmen/vim-ripgrep"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-smoothie",
    url = "https://github.com/psliwka/vim-smoothie"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-stripper"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-stripper",
    url = "https://github.com/itspriddle/vim-stripper"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-terraform",
    url = "https://github.com/hashivim/vim-terraform"
  },
  ["vim-tmux"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/vim-tmux",
    url = "https://github.com/tmux-plugins/vim-tmux"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-toml",
    url = "https://github.com/cespare/vim-toml"
  },
  ["vim-ultisnips-css"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/vim-ultisnips-css",
    url = "https://github.com/rstacruz/vim-ultisnips-css"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vim-vinegar",
    url = "https://github.com/tpope/vim-vinegar"
  },
  ["vim-virtualenv"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/vim-virtualenv",
    url = "https://github.com/jmcantrell/vim-virtualenv"
  },
  ["vimproc.vim"] = {
    loaded = true,
    path = "/Users/erikzaadi/.local/share/nvim/site/pack/packer/start/vimproc.vim",
    url = "https://github.com/Shougo/vimproc.vim"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType css ++once lua require("packer.load")({'vim-ultisnips-css'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType graphql ++once lua require("packer.load")({'vim-graphql'}, { ft = "graphql" }, _G.packer_plugins)]]
vim.cmd [[au FileType tmux ++once lua require("packer.load")({'vim-tmux'}, { ft = "tmux" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'vim-virtualenv'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType jinja ++once lua require("packer.load")({'Vim-Jinja2-Syntax'}, { ft = "jinja" }, _G.packer_plugins)]]
vim.cmd [[au FileType Dockerfile ++once lua require("packer.load")({'Dockerfile.vim'}, { ft = "Dockerfile" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-tmux', 'Dockerfile.vim', 'vim-graphql', 'vim-virtualenv', 'vim-markdownfmt', 'presenting.vim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType jinja2 ++once lua require("packer.load")({'Vim-Jinja2-Syntax'}, { ft = "jinja2" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/Vim-Jinja2-Syntax/ftdetect/jinja.vim]], true)
vim.cmd [[source /Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/Vim-Jinja2-Syntax/ftdetect/jinja.vim]]
time([[Sourcing ftdetect script at: /Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/Vim-Jinja2-Syntax/ftdetect/jinja.vim]], false)
time([[Sourcing ftdetect script at: /Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/vim-tmux/ftdetect/tmux.vim]], true)
vim.cmd [[source /Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/vim-tmux/ftdetect/tmux.vim]]
time([[Sourcing ftdetect script at: /Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/vim-tmux/ftdetect/tmux.vim]], false)
time([[Sourcing ftdetect script at: /Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/docker-compose.vim]], true)
vim.cmd [[source /Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/docker-compose.vim]]
time([[Sourcing ftdetect script at: /Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/docker-compose.vim]], false)
time([[Sourcing ftdetect script at: /Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/Dockerfile.vim]], true)
vim.cmd [[source /Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/Dockerfile.vim]]
time([[Sourcing ftdetect script at: /Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/Dockerfile.vim]], false)
time([[Sourcing ftdetect script at: /Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/vim-graphql/ftdetect/graphql.vim]], true)
vim.cmd [[source /Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/vim-graphql/ftdetect/graphql.vim]]
time([[Sourcing ftdetect script at: /Users/erikzaadi/.local/share/nvim/site/pack/packer/opt/vim-graphql/ftdetect/graphql.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
