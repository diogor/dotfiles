local plugins = {
    { 'nvim-telescope/telescope.nvim',
            dependencies = {
            {
                "isak102/telescope-git-file-history.nvim",
                dependencies = { "tpope/vim-fugitive" }
            }
        }
    },
    { 'folke/tokyonight.nvim', branch = 'main' },
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    'airblade/vim-gitgutter',
    { 'fatih/vim-go', build = ':GoUpdateBinaries' },
    'folke/lsp-colors.nvim',
    'kyazdani43/nvim-web-devicons',
    'folke/trouble.nvim',
    'itchyny/lightline.vim',
    'williamboman/mason.nvim',
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'ThePrimeagen/harpoon',
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    'mbbill/undotree',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lua',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'nvim-tree/nvim-web-devicons',
    'nvim-tree/nvim-tree.lua',
    'christoomey/vim-tmux-navigator',
    'prettier/vim-prettier',
    'folke/neodev.nvim',
    'sbdchd/neoformat',
    'numToStr/prettierrc.nvim',
    'kdheepak/lazygit.nvim',
    'nvim-neotest/nvim-nio',
    'f-person/git-blame.nvim',
    { 'LunarVim/breadcrumbs.nvim', dependencies = { 'SmiteshP/nvim-navic' } },
    'nvim-pack/nvim-spectre',
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    'github/copilot.vim',
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    }
}
local opts = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)
require("mason").setup()
require("mason-lspconfig").setup()
local harpoon = require("harpoon")
harpoon:setup()
require("nvim-navic").setup {
    lsp = {
        auto_attach = true,
        preference = { "pylsp", "pyright" }
    },
}
require("breadcrumbs").setup()

require("telescope").setup({
    -- Your telescope config here
})
require("telescope").load_extension("git_file_history")

vim.g['lightline'] = {
  colorscheme = 'rosepine',
  active = {
    left = {{'mode', 'paste'}, {'readonly', 'absolutepath', 'modified'}}
  },
  tabline = {
    left = {{'buffers'}},
    right = {{'close'}}
  },
  component_expand = {
    buffers = 'lightline#bufferline#buffers'
  },
  component_type = {
    buffers = 'tabsel'
  }
}

