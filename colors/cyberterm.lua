-- ~/.config/nvim/colors/cyberterm.lua

vim.cmd("highlight clear")
vim.g.colors_name = "cyberterm"

local c = {
	bg = "#030d06",
	bg2 = "#0a1f0e",
	fg = "#39ff6a",
	fg_dim = "#13a340",
	green_lo = "#1aff5e",
	cursor = "#00ffb3",
	red = "#ff2d6b",
	yellow = "#f0c040",
	blue = "#00c8ff",
	violet = "#cc44ff",
	cyan = "#33ffcc",
	black = "#0d2b14",
	comment = "#194d26",
}

local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- editor chrome
hi("Normal", { fg = c.fg, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = c.bg2 })
hi("LineNr", { fg = c.comment })
hi("CursorLine", { bg = c.bg2 })
hi("CursorLineNr", { fg = c.cursor, bold = true })
hi("SignColumn", { bg = c.bg })
hi("StatusLine", { fg = c.fg, bg = c.black })
hi("VertSplit", { fg = c.comment })
hi("Visual", { bg = c.bg2, fg = c.fg })
hi("Search", { fg = c.bg, bg = c.cursor })
hi("IncSearch", { fg = c.bg, bg = c.yellow })
hi("MatchParen", { fg = c.cyan, bold = true })

-- syntax
hi("Comment", { fg = c.comment, italic = true })
hi("Keyword", { fg = c.cursor, bold = true })
hi("Function", { fg = c.fg })
hi("String", { fg = c.green_lo })
hi("Number", { fg = c.yellow })
hi("Boolean", { fg = c.yellow })
hi("Constant", { fg = c.yellow })
hi("Identifier", { fg = c.fg_dim })
hi("Type", { fg = c.blue })
hi("Operator", { fg = c.cyan })
hi("PreProc", { fg = c.violet })
hi("Special", { fg = c.cursor })
hi("Error", { fg = c.red, bold = true })
hi("Todo", { fg = c.yellow, bold = true })

-- treesitter (@ groups override the legacy ones above)
hi("@variable", { fg = c.fg })
hi("@variable.builtin", { fg = c.cyan })
hi("@function", { fg = c.fg, bold = true })
hi("@function.builtin", { fg = c.cursor })
hi("@keyword", { fg = c.cursor, bold = true })
hi("@keyword.return", { fg = c.red })
hi("@type", { fg = c.blue })
hi("@type.builtin", { fg = c.blue, italic = true })
hi("@string", { fg = c.green_lo })
hi("@number", { fg = c.yellow })
hi("@comment", { fg = c.comment, italic = true })
hi("@operator", { fg = c.cyan })
hi("@punctuation", { fg = c.fg_dim })
hi("@tag", { fg = c.cursor })
hi("@tag.attribute", { fg = c.blue })

-- diagnostics
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.yellow })
hi("DiagnosticInfo", { fg = c.blue })
hi("DiagnosticHint", { fg = c.cyan })

-- diff / git signs
hi("DiffAdd", { fg = c.green_lo, bg = "#051a09" })
hi("DiffDelete", { fg = c.red, bg = "#1a0509" })
hi("DiffChange", { fg = c.yellow, bg = "#1a1200" })
hi("GitSignsAdd", { fg = c.green_lo })
hi("GitSignsChange", { fg = c.yellow })
hi("GitSignsDelete", { fg = c.red })

-- telescope
hi("TelescopeBorder", { fg = c.comment })
hi("TelescopeSelection", { bg = c.bg2, fg = c.cursor })
hi("TelescopeMatching", { fg = c.yellow, bold = true })

-- nvim-tree / neo-tree
hi("NvimTreeNormal", { fg = c.fg_dim, bg = c.bg })
hi("NvimTreeFolderName", { fg = c.cursor })
hi("NvimTreeGitDirty", { fg = c.yellow })
