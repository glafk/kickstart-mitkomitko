-- Dashboard is a sleek, modern startup screen
-- https://github.com/nvimdev/dashboard-nvim

local plugins = {
  'https://github.com/nvimdev/dashboard-nvim',
  'https://github.com/nvim-tree/nvim-web-devicons', -- Required for the icons to look right
}

-- Add it to the standard plugins list and load them
vim.pack.add(plugins)

-- Configuration for the "Street Cafe" Dashboard
require('dashboard').setup({
  theme = 'hyper', -- The sleek, modern cyberpunk look
  config = {
    week_header = {
      enable = true, 
    },
    shortcut = {
      -- Note: 'group' uses the highlight groups from your theme.lua
      { 
        desc = '󰊄 Projects', 
        group = '@property', -- Electric Mint
        action = 'Telescope oldfiles', 
        key = 'p' 
      },
      { 
        desc = '󰈞 Find File', 
        group = 'Label', 
        action = 'Telescope find_files', 
        key = 'f' 
      },
      { 
        desc = ' New File', 
        group = 'DiagnosticHint', 
        action = 'ene | startinsert', 
        key = 'n' 
      },
      { 
        desc = ' Config', 
        group = 'Number', -- Cyberpunk Amber
        action = 'edit $MYVIMRC', 
        key = 'c' 
      },
    },
    project = {
      enable = true,
      limit = 8,
      icon = '󰏗 ',
      label = ' Recent Projects:',
      action = 'Telescope find_files cwd=',
    },
    mru = {
      limit = 10,
      icon = ' ',
      label = ' Most Recent Files:',
    },
    footer = { "The Street Cafe is Open." },
  },
})
