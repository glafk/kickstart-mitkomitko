if vim.g.neovide then
    -- Configuration settings
    vim.g.neovide_fullscreen = true
    vim.g.neovide_cursor_animation_length = 0.13
    vim.g.neovide_cursor_trail_size = 0.8
    
    -- Setting the font (adjust for your preferred Nerd Font)
    vim.o.guifont = "Monaspace Neon NF"
    vim.g.neovide_cursor_vfx_mode = "railgun"

    vim.g.neovide_opacity = 0.93
    vim.g.neovide_background_color = "#14151e"
    
    -- Helper to toggle fullscreen with a keybind if you need to exit
    vim.keymap.set('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", { silent = true })
    
    -- Allow pasting with Ctrl+V in Command-line mode
    vim.keymap.set('c', '<C-v>', '<C-R>+', { noremap = true, silent = false })
    
    -- Allow pasting with Ctrl+V in Insert mode
    vim.keymap.set('i', '<C-v>', '<C-R>+', { noremap = true, silent = false })
    
    -- Allow pasting with Ctrl+V in Normal mode
    -- This mimics standard behavior by putting the text after the cursor
    vim.keymap.set('n', '<C-v>', '"+p', { noremap = true, silent = false })

    -- Allow copying with Ctrl+C in Visual mode
    vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = false })
end
