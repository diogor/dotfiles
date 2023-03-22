local lsp = require('lsp-zero')
local cmp = require('cmp')

lsp.preset('recommended')

lsp.setup_nvim_cmp({
  mapping = lsp.defaults.cmp_mappings({
    ['<Tab>'] = vim.NIL,
  })
})

lsp.setup()

