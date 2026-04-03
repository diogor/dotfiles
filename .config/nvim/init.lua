HOME = os.getenv("HOME")
vim.o.exrc=true
vim.o.tabstop=4 
vim.o.softtabstop=4
vim.o.shiftwidth=4
vim.o.expandtab=true
vim.o.smartindent=true
vim.o.relativenumber=true
vim.o.number=true
vim.o.hidden=true
vim.o.undodir=HOME .. "/.vim/undodir"
vim.o.undofile=true
vim.o.incsearch=true
vim.o.termguicolors=true
vim.o.scrolloff=8
vim.o.signcolumn="yes"
vim.o.updatetime=100
vim.o.hlsearch=false
vim.o.wrap=false
vim.o.backup=false
vim.o.swapfile=false
vim.o.showmode=false
vim.o.errorbells=false
vim.api.nvim_set_option("clipboard","unnamed")

require("plugins")
require("keymaps")

vim.diagnostic.config({
  virtual_text = true
})

-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = "", Warn = "", Hint = "", Info = "" } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end

vim.cmd.colorscheme("tokyonight-night")

