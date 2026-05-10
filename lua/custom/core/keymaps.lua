-- Toggle sidebar (Like Ctrl+B in VSCode)
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Explorer: Toggle [E]xplorer' })

-- Focus current file in explorer
vim.keymap.set('n', '<leader>ef', ':Neotree reveal<CR>', { desc = 'Explorer: [E]xplorer [F]ocus' })

-- Optional: Floating explorer
vim.keymap.set('n', '<leader>E', ':Neotree float<CR>', { desc = 'Explorer: Float [E]xplorer' })

-- Easier window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window' })
