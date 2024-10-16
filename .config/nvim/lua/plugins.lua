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
    'williamboman/mason-lspconfig.nvim',
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
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v1.x' },
    'nvim-tree/nvim-web-devicons',
    'nvim-tree/nvim-tree.lua',
    'christoomey/vim-tmux-navigator',
    'prettier/vim-prettier',
    'folke/neodev.nvim',
    'sbdchd/neoformat',
    'numToStr/prettierrc.nvim',
    'kdheepak/lazygit.nvim',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'jay-babu/mason-nvim-dap.nvim',
    'mxsdev/nvim-dap-vscode-js',
    'nvim-neotest/nvim-nio',
    'f-person/git-blame.nvim',
    { 'LunarVim/breadcrumbs.nvim', dependencies = { 'SmiteshP/nvim-navic' } },
    'nvim-pack/nvim-spectre',
    { 'Exafunction/codeium.vim', event = 'BufEnter' },
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
require("mason-nvim-dap").setup()
require("mason-lspconfig").setup()
local harpoon = require("harpoon")
harpoon:setup()
require("nvim-navic").setup {
    lsp = {
        auto_attach = true,
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

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python", "java", "javascript", "go", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --    local max_filesize = 100 * 1024 -- 100 KB
    --    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --    if ok and stats and stats.size > max_filesize then
    --        return true
    --    end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true
  }
}
