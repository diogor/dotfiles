require("plugins")
require("keymaps")

HOME = os.getenv("HOME")

vim.opt.exrc=true
vim.opt.tabstop=4 
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.smartindent=true
vim.opt.relativenumber=true
vim.opt.number=true
vim.opt.hidden=true
vim.opt.undodir=HOME .. "/.vim/undodir"
vim.opt.undofile=true
vim.opt.incsearch=true
vim.opt.termguicolors=true
vim.opt.scrolloff=8
vim.opt.signcolumn="yes"
vim.opt.updatetime=100

vim.diagnostic.config({
  virtual_text = true
})

-- this part is telling Neovim to use the lsp server
local servers = { 'pyright', 'tsserver', 'jdtls', 'gopls' }
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        }
    }
end

-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end

vim.cmd([[
set nohlsearch
set noerrorbells
set nowrap
set noswapfile
set nobackup
set noshowmode

colorscheme tokyonight-night

]])

