local lsp = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

lsp.preset('recommended')

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

lsp.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({
    buffer = bufnr,
    exclude = {'<Tab>'},
  })
end)
