local tel = require('telescope.builtin')
local harpoon = require('harpoon')

-- Leader
vim.g.mapleader=" "

-- Mappings.
local opts = { noremap=true, silent=true }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'grr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<C-A-P>', tel.git_files, opts)
vim.keymap.set('n', '<C-p>', tel.find_files, opts)
vim.keymap.set('n', '<C-w>', tel.buffers, opts)
vim.keymap.set('n', '<C-s>', tel.lsp_document_symbols, opts)
vim.keymap.set('n', '<leader>fb', vim.cmd.NvimTreeToggle);

vim.keymap.set('n', '<leader>ff', function()
    tel.grep_string({ search = vim.fn.input('Grep > ') })
end, opts)
vim.keymap.set('n', '<leader>gs', vim.cmd.LazyGit);
vim.keymap.set('n', '<leader>a', function() harpoon:list():append() end)
vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set('n', '<C-,>', function() harpoon:list():select(1) end)
vim.keymap.set('n', '<C-.>', function() harpoon:list():select(2) end)
vim.keymap.set('n', '<C-;>', function() harpoon:list():select(3) end)
vim.keymap.set('n', '<C-/>', function() harpoon:list():select(4) end)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<leader>gb', vim.cmd.GitBlameToggle)

vim.keymap.set('n', '<leader>fp', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})

vim.cmd([[
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope git_file_history<cr>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
]])
vim.cmd([[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]])
