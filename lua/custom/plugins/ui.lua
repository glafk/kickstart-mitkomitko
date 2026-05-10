require("neo-tree").setup({
  window = {
position = "right",
    width = 40,
    mappings = {
      ["<space>"] = "none", -- Disable space so it doesn't interfere with your leader key
    },
  },
  filesystem = {
    follow_current_file = {
      enabled = true, -- This makes the explorer highlight the file you're currently in
    },
    filtered_items = {
      hide_dotfiles = false, -- Show hidden files (like .gitignore)
      hide_gitignored = false,
    },
  },
})
