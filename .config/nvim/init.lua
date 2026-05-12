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

--vim.cmd.colorscheme("github-monochrome-dark")
--vim.cmd.colorscheme("monoglow")
--vim.cmd.colorscheme("vague")
--vim.cmd.colorscheme("zenbones")
vim.cmd.colorscheme("tokyonight")
--vim.cmd.colorscheme("poimandres")
--vim.cmd.colorscheme("embark")
--vim.cmd.colorscheme("darkvoid")
--vim.cmd.colorscheme("bluewery")
--vim.cmd.colorscheme("lush")
--vim.cmd.colorscheme("nord")

local function set_transparent() -- set UI component to transparent
	local groups = {
		"Normal",
--		"NormalNC",
--		"EndOfBuffer",
--		"NormalFloat",
--		"FloatBorder",
		"SignColumn",
        "StatusLine",
--		"StatusLineNC",
--		"TabLine",
--		"TabLineFill",
--		"TabLineSel",
--		"ColorColumn",
--      "HeaderLine",
	}
	for _, g in ipairs(groups) do
		vim.api.nvim_set_hl(0, g, { bg = "none" })
	end
end

set_transparent()

-- LSP
vim.lsp.enable('gleam')
