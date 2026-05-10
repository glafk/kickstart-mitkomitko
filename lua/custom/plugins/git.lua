local function gh(repo) return 'https://github.com/' .. repo end
vim.pack.add {{src = gh 'kdheepak/lazygit.nvim'}}

vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = 'Git: [L]azy[G]it' })
