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
vim.opt.hlsearch=false
vim.opt.wrap=false
vim.opt.backup=false
vim.opt.swapfile=false
vim.opt.showmode=false
vim.opt.errorbells=false
vim.api.nvim_set_option("clipboard","unnamed")

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

vim.cmd('colorscheme tokyonight-night')
