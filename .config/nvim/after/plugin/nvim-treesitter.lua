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
