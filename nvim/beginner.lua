local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

opt.termguicolors   = true

-- Bootstrap plugin manager
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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

-- Plugs
    require('lazy').setup({
        'tpope/vim-fugitive',
        'tpope/vim-eunuch',
        'tpope/vim-surround',
        'jrop/jq.nvim',
        'b3nj5m1n/kommentary', -- sorry tpope
        'junegunn/vim-easy-align',
        'vim-scripts/loremipsum',
        'editorconfig/editorconfig-vim',
        'neovim/nvim-lspconfig',
        {
            'nvimdev/guard.nvim',
            config  = function ()
                vim.g.guard_config = {
                    fmt_on_save = false,
                    lsp_as_default_formatter = true,
                }
            end,
            dev = false,
        },
        {
            'lewis6991/gitsigns.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim'
            },
        },
        {
            'nvim-tree/nvim-tree.lua',
            dependencies = 'nvim-tree/nvim-web-devicons',
        },
        {
          "ibhagwan/fzf-lua",
          -- optional for icon support
          dependencies = { "nvim-tree/nvim-web-devicons" },
        },
        {
            'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate',
        },
        'shaunsingh/nord.nvim',
        'sainnhe/gruvbox-material',
        {
            'nvim-lualine/lualine.nvim',
            dependencies = {'nvim-tree/nvim-web-devicons', opt = true},
        },
        {
            'nvim-telescope/telescope.nvim',
            dependencies = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} },
        },
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        {
            'gregorias/nvim-mapper',
            dependencies = 'nvim-telescope/telescope.nvim',
            config = function() require'nvim-mapper'.setup{} end,
        }
    })

-- Plug Confs

    g.current_theme = 'gruvbox-material' -- or 'nord'

    require'nvim-treesitter.configs'.setup {
        auto_install = false,
        ensure_installed = {
            'bash', 'javascript', 'typescript',
            'yaml', 'css',
            'go', 'html', 'json', 'prisma',
            'scala', 'graphql', 'lua', 'tsx',
            'markdown', 'markdown_inline', 'python'
        },
        highlight = {
            enable = true,
            disable = { 'markdown' },

            additional_vim_regex_highlighting = false,
        },
    }

    require'nvim-tree'.setup {
        actions = {
            change_dir = {
                enable = false,
            },
        },
    }

    local telescopeactions = require('telescope.actions')
    local Telescope = require('telescope')
    Telescope.setup{
        defaults = {
            vimgrep_arguments = {
                '/opt/homebrew/bin/rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                -- '-u',
            },
            -- initial_mode = 'insert',
            file_ignore_patterns = { 'node_modules' },
            file_sorter =  require'telescope.sorters'.get_fuzzy_file,
            color_devicons = true,
            mappings = {
                i = {
                    ['<esc>'] = telescopeactions.close,
                },
            },
        },
    }

    local lsp = require 'lspconfig'

    local on_attach = function(client, bufnr)
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        --Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    end

    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md for full list
    local servers = {
        'sqlls',
        'yamlls',
        'eslint',
        'dockerls',
        'terraformls',
        'tflint',
        'bashls',
        'groovyls',
        'html',
        'jsonls',
        'ruff',
        'gopls',
        'bashls',
        'typescript-tools',
    }
    for _, proto in ipairs(servers) do
        lsp[proto].setup {
            on_attach = on_attach,
            capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        }
    end

    require'lualine'.setup({
        theme = g.current_theme,
        options = {
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            theme = g.current_theme
        },
        sections = {lualine_a = {
            {'mode', fmt = function(str) return str:sub(1,1) end}},
            lualine_b = {'branch'}}
        }
    )

    local ft = require('guard.filetype')
    ft("typescript,javascript,typescriptreact,javascriptreact,svelte")
      -- :fmt('prettier')
      :fmt({ fn = function() vim.cmd('EslintFixAll') end })
      :append('lsp')

-- Keymaps

    g.mapleader = ' '
    Mapper = require('nvim-mapper')
    local function map(mode, keyMap, command, description, category, opts)
      local options = {noremap = true, silent=true}
      if opts then options = vim.tbl_extend('force', options, opts) end
      Mapper.map(mode, keyMap, command, options, category or '', string.format('%s-%s', mode, keyMap), description or '')
    end

    map('n', '<leader>m', '<cmd>Telescope mapper<cr>', 'Show all keymaps')
    map('n', '<leader>F', '<cmd>Telescope find_files<cr>', 'Find all files')
    map('n', '<leader>f', '<cmd>Telescope git_files<cr>', 'Find files in git')
    map('n', '<leader>a', '<cmd>lua require(\'telescope.builtin\').live_grep{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>', 'Live grep (!)')
    map('n', 'K', '<cmd>lua require(\'telescope.builtin\').grep_string{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>', 'Grep word under cursor')
    map('n', '<leader>e', '<cmd>NvimTreeFindFileToggle<cr>', 'Open tree at current file')
    map('n', '<leader>E', '<cmd>:NvimTreeToggle<cr>', 'Toggle File Tree')
    map('n', '<leader>I', '<cmd>Lspsaga code_action<cr>', 'Show Code Actions')
    map('n', '<leader>d', '<cmd>Lspsaga goto_definition<CR>', 'Go to Definition')
    map('n', '<leader>D', '<cmd>Lspsaga goto_type_definition<CR>', 'Go to Type Definition')
    map('n', '<leader>T', '<cmd>Lspsaga peek_type_definition<CR>', 'Show type definition')
    map('n', '<leader>k', '<cmd>Lspsaga hover_doc<CR>', 'Show info (hoover) on cursor')
    map('n', '<leader>r', '<cmd>Lspsaga finder<CR>', 'Show references / definitions')
    map('n', '<leader>R', '<cmd>Lspsaga rename<CR>', 'Rename')
    map('n', '<leader>i', '<cmd>lua vim.lsp.buf.format()<CR>', 'FORMAT ZE THINGZ')
    cmd 'xmap <Enter> <Plug>(EasyAlign)'
    map('i', '<F1>', '<Esc>', 'Stop F1 Madness')
    map('n', '<F1>', '<Esc>', 'Stop F1 Madness')
    map('v', '<F1>', '<Esc>', 'Stop F1 Madness')
    map('', '<F1>', '<Esc>', 'Stop F1 Madness')
    map('n', '<leader><leader>h', ':noh<CR>', 'Remove highlights')
    -- http://www.reddit.com/r/vim/comments/21f4gm/best_workflow_when_using_fugitive/
    map('n', '<leader>gs', ':Git<CR>', 'Status', 'Git')
    map('n', '<leader>gc', ':Git commit -v -q<CR>', 'Commit', 'Git')
    map('n', '<leader>gd', ':Gdiff<CR>', 'Diff', 'Git')
    map('n', '<leader>gm', ':Gmove<Space>', 'Move', 'Git')
    map('n', '<leader>go', ':Git checkout<Space>', 'Checkout', 'Git')
    map('n', '<leader>gps', ':Git push<CR>', 'Push', 'Git')
    map('n', '<leader>gpu', ':AsyncRun git pushu<CR>', 'Push (add tracked remote)', 'Git')
    map('n', '<leader>gpf', ':Git push --force-with-lease<CR>', 'Push force', 'Git')

-- Init

cmd(":set background=dark")
cmd(string.format('colorscheme %s', g.current_theme))
