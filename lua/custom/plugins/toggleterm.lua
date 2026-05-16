local function gh(repo) return 'https://github.com/' .. repo end

-- 1. Register the plugin using native vim.pack
vim.pack.add {{src = gh 'akinsho/toggleterm.nvim'}}

-- 2. Explicitly configure the plugin right below it
require("toggleterm").setup({
  size = 15,
  open_mapping = [[<C-t>]],
  hide_numbers = true,
  shade_terminals = true,
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
})

-- 3. Map the specialized terminal-mode mappings
local opts = { buffer = 0 }
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
