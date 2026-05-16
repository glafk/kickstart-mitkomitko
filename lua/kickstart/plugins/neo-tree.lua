-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

local plugins = {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

if vim.g.have_nerd_font then
  table.insert(plugins, 'https://github.com/nvim-tree/nvim-web-devicons') -- not strictly required, but recommended
end

vim.pack.add(plugins)

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  window = {
    position = "left", -- Default layout is a left sidebar
    width = 30,        -- Gives it a standard numeric width to prevent the crash
    mappings = {
      ['\\'] = 'close_window',
    },
  },
  filesystem = {
    use_libuv_file_watcher = true,
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },

    filtered_items = {
      visible = true,           -- Ensures filtered items are at least visible (dimmed)
      hide_dotfiles = false,     -- DO NOT hide dotfiles like .env, .gitignore, etc.
      hide_gitignored = false,   -- DO NOT hide files listed in your .gitignore
      -- Optional: Explicitly ban things you NEVER want to see (like the raw .git folder)
      never_show = {
        ".git",
        "node_modules",
      },
    },

    filters = {
      exclude = {".git", "node_modules"},
    },
  },
}
