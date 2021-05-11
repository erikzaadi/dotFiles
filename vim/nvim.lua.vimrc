lua << EOF
-- vi: ft=lua
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
