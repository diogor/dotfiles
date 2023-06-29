local lsp = require('lsp-zero')
local cmp = require('cmp')

lsp.preset('recommended')

lsp.setup_nvim_cmp({
  mapping = lsp.defaults.cmp_mappings({
    ['<Tab>'] = vim.NIL,
  })
})

local servers = { 'pyright', 'tsserver', 'jdtls', 'gopls' }
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        }
    }
end
lsp.setup()

