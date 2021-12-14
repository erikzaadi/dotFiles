lua << EOF
-- vi: ft=lua

-- Setup nvim-cmp.
local cmp = require'cmp'

vim.opt.spelllang = { 'en_us' }

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


require('telescope').setup{
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
}

require('telescope').load_extension('fzf')

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
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
    }, {
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
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require'lspconfig'.tsserver.setup{}
  require'lspconfig'.yamlls.setup{filetypes={ "yaml", "yaml.ansible" }}
  require'lspconfig'.bashls.setup{}
  require'lspconfig'.terraformls.setup{}
  require'lspconfig'.graphql.setup{}
  require'lspconfig'.dockerls.setup{}
  require'lspconfig'.jsonls.setup {
      commands = {
        Format = {
          function()
            vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
          end
        }
      }
  }
EOF
