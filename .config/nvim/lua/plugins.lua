vim.pack.add {
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/isak102/telescope-git-file-history.nvim",
    "https://github.com/tpope/vim-fugitive",
    'https://github.com/nvim-telescope/telescope.nvim',
    "https://github.com/nvim-mini/mini.icons",
    'https://github.com/stevearc/oil.nvim',
    "https://github.com/benomahony/oil-git.nvim",
    'https://github.com/itchyny/lightline.vim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/airblade/vim-gitgutter',
    'https://github.com/folke/lsp-colors.nvim',
    'https://github.com/folke/trouble.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/christoomey/vim-tmux-navigator',
    'https://github.com/sbdchd/neoformat',
    'https://github.com/kdheepak/lazygit.nvim',
    'https://github.com/f-person/git-blame.nvim',
    'https://github.com/SmiteshP/nvim-navic',
    'https://github.com/LunarVim/breadcrumbs.nvim',
    'https://github.com/nvim-pack/nvim-spectre',
    'https://github.com/echasnovski/mini.nvim',
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    "https://github.com/mason-org/mason.nvim",
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-path',
    'https://github.com/saadparwaiz1/cmp_luasnip',
    'https://github.com/hrsh7th/cmp-nvim-lua',
	'https://github.com/github/copilot.vim',
}

require("tokyonight").setup({
    transparent = true,
})

vim.cmd.packadd('nvim.undotree')

require("telescope").setup()
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

require("nvim-treesitter").setup({})
require'nvim-treesitter'.install { 'go', 'lua', 'python', 'javascript', 'typescript', 'php' }

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		local filetype = vim.bo.filetype
		if filetype and filetype ~= "" then
			pcall(vim.treesitter.start)
		end
	end,
})

require("oil").setup()
require("oil-git").setup()

require("nvim-web-devicons").setup()

require("nvim-navic").setup {
    lsp = {
        auto_attach = true,
        preference = { "pylsp", "pyright" }
    },
}
require("breadcrumbs").setup()

require('gitblame').setup {
     --Note how the `gitblame_` prefix is omitted in `setup`
    enabled = false,
}

require("mason").setup()
require("mason-lspconfig").setup()


local cmp = require('cmp')

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})
