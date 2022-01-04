local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local g   = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'bash', 'javascript', 'typescript',
        'python', 'yaml', 'css', 'dockerfile',
        'go', 'html', 'json', 'prisma',
        'scala', 'graphql', 'lua', 'tsx',
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

require'nvim-tree'.setup({})

require('nvim-mapper').setup({
    no_map = true,
    search_path = os.getenv('HOME') .. '/.config/nvim/lua',
})

local telescopeactions = require('telescope.actions')
local Telescope = require('telescope')
Telescope.setup{
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
    },
    defaults = {
        vimgrep_arguments = {
            '/usr/local/bin/rg',
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

Telescope.load_extension('mapper')
Telescope.load_extension('fzf')
Telescope.load_extension('ultisnips')


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
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'bazel' },
        { name = 'spell' },
        { name = 'treesitter' },
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
    'prismals',
    'dockerls',
    'terraformls',
    'tflint',
    'bashls',
    'groovyls',
    'html',
    -- 'metals',
    'jsonls',
    'pylsp',
    -- 'graphql',
    'gopls',
    'eslint',
}
for _, proto in ipairs(servers) do
    lsp[proto].setup {
        on_attach = on_attach,
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }
end

g.plug_timeout                = 180
g.UltiSnipsSnippetDirectories = {string.format('%s/vim/snippets', vim.env.DOTFILESDIR)}
-- g.node_version             = substitute(system('cat ~/.nvm/alias/default'), '\n', '', '')
-- g.node_bin_dir             = expand('~/.nvm/versions/node/v'.g:node_version.'/bin/')
g.netrw_liststyle             = 3
g.netrw_hide                  = 0
g.delimitmate_expand_cr       = 2
g.markdownfmt_autosave        = 0
g.markdownfmt_command         = 'mdfmt'
g.markdown_fenced_languages   = {'python', 'sh', 'nginx', 'bash=sh', 'scala', 'javascript', 'yaml', 'json', 'go', 'tmux', 'ansible'}
g.gruvbox_transp_bg           = 1
g.gruvbox_italic              = 1
g.python_interpreter          = '/usr/local/opt/python/libexec/bin/python'

require('transparent').setup({
    enable = true, -- boolean: enable transparent
    extra_groups = { -- table/string: additional groups that should be clear
    -- In particular, when you set it to 'all', that means all avaliable groups

    -- example of akinsho/nvim-bufferline.lua
    'BufferLineTabClose',
    'BufferlineBufferSelected',
    'BufferLineFill',
    'BufferLineBackground',
    'BufferLineSeparator',
    'BufferLineIndicatorSelected',
},
exclude = {}, -- table: groups you don't want to clear
})


require'lualine'.setup({
    options = {
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
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

require('gitsigns').setup()

local eslint_node_version = '17.2.0'
local eslint_node_bin_dir = string.format('%s/.nvm/versions/node/v%s/bin', os.getenv('HOME'), eslint_node_version)

function prettier_current_file()
    local filename = vim.api.nvim_buf_get_name(0)
    local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    local command = ':silent %!' .. root .. '/node_modules/.bin/prettier --stdin-filepath ' .. filename
    vim.cmd(command)
end
