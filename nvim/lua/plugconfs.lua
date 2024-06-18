local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local g   = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local expand = vim.fn.expand

g.current_theme = 'gruvbox-material'

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

require('nvim-mapper').setup({
    no_map = true,
    search_path = os.getenv('HOME') .. '/.config/nvim/lua',
})

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
        --[[ borderchars = {
            prompt = { '─', ' ', ' ', ' ', '─', '─', ' ', ' ' },
            results = { ' ' },
            preview = { ' ' },
        }, ]]
    },
}

local telescope_extensions = {
    'mapper',
    'ultisnips',
    'ui-select',
}

for i, telescope_extension in ipairs(telescope_extensions) do
    Telescope.load_extension(telescope_extension)
end

local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            end
        end, { 'i', 's' }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'bazel' },
        { name = 'spell' },
        -- { name = 'treesitter' },
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
        { name = 'buffer' },
    })
})

cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' },
    })
})

local lsp = require 'lspconfig'

local on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md for full list
local servers = {
    'sqlls',
    'yamlls',
    'tsserver',
    'eslint',
    'dockerls',
    'terraformls',
    'tflint',
    'bashls',
    'groovyls',
    'html',
    -- 'metals',
    'jsonls',
    -- 'anakin_language_server',
    -- 'jedi_language_server',
    'ruff_lsp',
    'pylsp',
    -- 'graphql',
    'gopls',
    'bashls',
}
for _, proto in ipairs(servers) do
    lsp[proto].setup {
        on_attach = on_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }
end

lsp.pylsp.setup {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    pylsp = {
        settings = {
            plugins = {
                autopep8 = {
                    enabled = true
                },
                yapf = {
                    enabled = false
                },
                pyflakes = {
                    enabled = false
                },
                black = {
                    enable = false
                }
            }
        }
    }
}

g.plug_timeout                = 180
g.UltiSnipsSnippetDirectories = {string.format('%s/vim/snippets', vim.env.DOTFILESDIR)}
g.netrw_liststyle             = 3
g.netrw_hide                  = 0
g.delimitmate_expand_cr       = 2
g.markdownfmt_autosave        = 0
g.markdownfmt_command         = 'mdfmt'
g.markdown_fenced_languages   = {
    'python', 'sh', 'nginx', 'bash=sh',
    'scala', 'javascript', 'yaml', 'json',
    'go', 'tmux', 'ansible',
}
-- g.gruvbox_transp_bg           = 1
-- g.gruvbox_italic              = 1
g.python_host_prog            = expand('~/.pyenv/shims/python')
g.python3_host_prog           = expand('~/.pyenv/shims/python')
g.python_interpreter          = expand('~/.pyenv/shims/python')

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

require('trouble').setup {
    position = 'bottom',
    height = 10,
    icons = true,
    action_keys = {
        close = 'q',
        cancel = '<esc>',
        refresh = 'r',
    },
    auto_open = false,
    auto_close = true,
}

function prettier_current_file()
    local filename = vim.api.nvim_buf_get_name(0)
    local root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
    local command = ':silent %!' .. root .. '/node_modules/.bin/prettier --stdin-filepath ' .. filename
    vim.cmd(command)
end

function random_fortuned_cow()
    math.randomseed(os.time())
    local cowsay_list = vim.split(table.concat(vim.fn.systemlist('cowsay -l | tail -n +2'), ' '), ' ')
    local random_index = math.random(#cowsay_list)
    local random_cow = cowsay_list[random_index]


    local fortune_cow = vim.fn.systemlist('fortune -s | cowsay -f ' .. random_cow)

    return fortune_cow
end

local alpha = require'alpha'
local startify = require'alpha.themes.startify'
startify.section.header.val = random_fortuned_cow()
alpha.setup(startify.config)


--[[ require('gruvbox').setup({
   transparent_mode = true,
}) ]]

--[[ g.nord_disable_background = true
g.moonlight_disable_background = true
g.seoul256_disable_background = true
g.solarized_disable_background = true ]]

require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'E501', 'W503'},
          maxLineLength = 100
        }
      }
    }
  }
}

require("go").setup({
     dap_debug_keymap = false, -- set keymaps for debugger
     -- launch_json = cmd('pwd') .. "/.vscode/launch.json"
})

g.gruvbox_material_foreground = "original"
g.gruvbox_material_transparent_background = 1
g.gruvbox_material_enable_bold = 1
g.gruvbox_material_dim_inactive_windows = 1
g.gruvbox_material_better_performance = 1
