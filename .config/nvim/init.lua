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

local sev = vim.diagnostic.severity

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = true,
  signs = {
    text = {
      [sev.ERROR] = '',
      [sev.WARN]  = '',
      [sev.INFO]  = '',
      [sev.HINT]  = '',
    },
  },
})

vim.cmd.colorscheme("tokyonight-night")

