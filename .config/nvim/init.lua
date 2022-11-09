HOME = os.getenv("HOME")

vim.g.mapleader=" "
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

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')

Plug 'nvim-telescope/telescope.nvim'
Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'airblade/vim-gitgutter'
Plug('fatih/vim-go', { ['do'] = ':GoUpdateBinaries' })

vim.call('plug#end')

vim.cmd([[
set nohlsearch
set noerrorbells
set nowrap
set noswapfile
set nobackup

colorscheme tokyonight-night

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
]])
