local colors = {
  bg        = "#14151e", -- Midnight Ink
  fg        = "#f8f8f2", -- Warm White
  purple    = "#c77dff", -- Primary Accent (Keywords/Functions)
  green     = "#3cb371", -- Sea Green (Strings/Constants)
  slate     = "#4cc9f0", -- Slate Blue (Comments/UI)
  crimson   = "#7b1a1a", -- Dark Blood (Errors/Urgency)
  amber     = "#ff9e64", -- Cyberpunk Orange (Numbers/Built-ins)
  mint      = "#2cf9ad", -- High-energy technical green
  line_bg   = "#1a1b26", -- Current line highlight
  selection = "#2e303e", -- Visual selection
}

local hl = vim.api.nvim_set_hl

-- --- Base Editor UI ---
hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
hl(0, "NormalFloat", { fg = colors.fg, bg = colors.bg })
hl(0, "CursorLine", { bg = colors.line_bg })
hl(0, "StatusLine", { fg = colors.slate, bg = colors.line_bg })
hl(0, "WinSeparator", { fg = colors.selection, bg = colors.bg })
hl(0, "Pmenu", { fg = colors.fg, bg = colors.line_bg })
hl(0, "PmenuSel", { fg = colors.bg, bg = colors.purple })
-- --- Standard Syntax ---
hl(0, "Keyword", { fg = colors.purple, bold = true })
hl(0, "Function", { fg = colors.purple })
hl(0, "String", { fg = colors.green })
hl(0, "Comment", { fg = colors.slate, italic = true })
hl(0, "Constant", { fg = colors.green })
hl(0, "Type", { fg = colors.amber })
hl(0, "Number", { fg = colors.amber })
hl(0, "Boolean", { fg = colors.amber, bold = true })
hl(0, "Operator", { fg = colors.purple })

-- --- Treesitter (Modern Syntax) ---
hl(0, "@property", {fg = colors.mint})
hl(0, "@variable", { fg = colors.fg })
hl(0, "@variable.builtin", { fg = colors.amber })   -- 'self' in python
hl(0, "@variable.member", { fg = colors.mint })
hl(0, "@keyword", { fg = colors.purple, bold = true })
hl(0, "@function", { fg = colors.purple })
hl(0, "@string", { fg = colors.green })
hl(0, "@comment", { fg = colors.slate, italic = true })
hl(0, "@type", { fg = colors.amber })
hl(0, "@property", { fg = colors.purple })         -- Keys in JSON/YAML
hl(0, "@field", { fg = colors.mint })
hl(0, "@parameter", { fg = colors.fg, italic = true })

-- --- Neo-tree (Sidebar) ---
hl(0, "NeoTreeNormal", { fg = colors.fg, bg = colors.bg })
hl(0, "NeoTreeNormalNC", { fg = colors.fg, bg = colors.bg })
hl(0, "NeoTreeDirectoryName", { fg = colors.slate })
hl(0, "NeoTreeDirectoryIcon", { fg = colors.slate })
hl(0, "NeoTreeFileName", { fg = colors.fg })
hl(0, "NeoTreeSymbolicLinkTarget", { fg = colors.purple })
hl(0, "NeoTreeRootName", { fg = colors.purple, bold = true })
hl(0, "NeoTreeGitModified", { fg = colors.amber })
hl(0, "NeoTreeGitUntracked", { fg = colors.mint, italic = true })
hl(0, "NeoTreeGitAdded", { fg = colors.green })
hl(0, "NeoTreeIndentMarker", { fg = colors.selection })

-- --- Diagnostics & Git ---
hl(0, "Error", { fg = colors.fg, bg = colors.crimson })
hl(0, "DiagnosticError", { fg = colors.crimson })
hl(0, "DiagnosticWarn", { fg = colors.amber })
hl(0, "DiagnosticOk", { fg = colors.green })
hl(0, "DiagnosticInfo", { fg = colors.slate })

hl(0, "GitSignsAdd", { fg = colors.green })
hl(0, "GitSignsChange", { fg = colors.amber })
hl(0, "GitSignsDelete", { fg = colors.crimson })

-- --- UI Accents ---
hl(0, "Search", { fg = colors.bg, bg = colors.amber })
hl(0, "Visual", { bg = colors.selection })
hl(0, "ColorColumn", { bg = colors.line_bg })
hl(0, "LineNr", { fg = colors.selection })
hl(0, "CursorLineNr", { fg = colors.purple, bold = true })

-- --- Language Specifics ---
-- Python
hl(0, "pythonBuiltin", { fg = colors.amber })
hl(0, "pythonDecorator", { fg = colors.amber, italic = true })
hl(0, "pythonInclude", { fg = colors.purple, bold = true })
hl(0, "pythonAttribute", { fg = colors.mint })

-- JSON / YAML
hl(0, "jsonKeyword", { fg = colors.purple })
hl(0, "yamlBlockMappingKey", { fg = colors.purple })

-- --- Blink.cmp (Completion Menu) ---
-- This sets the background of the selected item to Mint and the text to dark for high contrast
hl(0, "BlinkCmpMenuSelection", { fg = colors.bg, bg = colors.mint, bold = true })

-- Optional: If you use the "label" (the text part) or "kind" (the icon part) 
-- and want them to stay distinct while highlighted:
hl(0, "BlinkCmpLabelSelected", { fg = colors.bg, bg = colors.mint, bold = true })
hl(0, "BlinkCmpKindSelected", { fg = colors.bg, bg = colors.mint })

-- Ensuring standard Pmenu matches for other plugins
hl(0, "PmenuSel", { fg = colors.bg, bg = colors.mint, bold = true })

-- --- Dashboard Highlights ---
hl(0, "DashboardHeader", { fg = colors.amber })
hl(0, "DashboardFooter", { fg = colors.slate, italic = true })
hl(0, "DashboardProjectTitle", { fg = colors.mint, bold = true })
hl(0, "DashboardProjectIcon", { fg = colors.mint })
hl(0, "DashboardMruTitle", { fg = colors.amber, bold = true })
hl(0, "DashboardMruIcon", { fg = colors.amber })

-- This makes the button shortcuts pop in your Electric Mint
hl(0, "DashboardShortCut", { fg = colors.mint })

-- Hide line numbers, fold columns, and indent lines on the dashboard
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  callback = function()
    vim.opt_local.number = false         -- Hide line numbers
    vim.opt_local.relativenumber = false -- Hide relative numbers
    vim.opt_local.signcolumn = "no"      -- Hide the gutter (git signs/diagnostics)
    vim.opt_local.cursorline = false     -- Optional: hide the highlight line

    -- If you use an indent-blankline plugin, disable it for dashboard
    if pcall(require, "ibl") then
      require("ibl").setup_buffer(0, { enabled = false })
    end
  end,
})
