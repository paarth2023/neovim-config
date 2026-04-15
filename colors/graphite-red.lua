vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "cyberterm_graphite_red"

local c = {
	-- base surfaces (match Ghostty)
	bg      = "#1e1f22",
	bg2     = "#2a2c31",
	bg3     = "#25272c",
	black   = "#16171a",

	-- foregrounds
	fg      = "#d0d0d0",
	fg_dim  = "#9a9a9a",
	comment = "#6f737a",

	-- accent ramp (graphite-red)
	cursor  = "#e05c5c",
	red     = "#c24a4a",
	cyan    = "#8a96a3",
	blue    = "#6f7a85",
	violet  = "#bd7d8c",
	yellow  = "#d2b07a",
	blue_lo = "#96b4b4",
}

local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- ── editor chrome ──────────────────────────────────────────────────────────
hi("Normal", { fg = c.fg, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = c.bg3 })
hi("NormalNC", { fg = c.fg_dim, bg = c.bg })
hi("LineNr", { fg = c.comment })
hi("CursorLine", { bg = c.bg2 })
hi("CursorLineNr", { fg = c.cursor, bold = true })
hi("SignColumn", { bg = c.bg })
hi("ColorColumn", { bg = c.bg2 })
hi("StatusLine", { fg = c.fg, bg = c.black })
hi("StatusLineNC", { fg = c.comment, bg = c.black })
hi("TabLine", { fg = c.comment, bg = c.black })
hi("TabLineSel", { fg = c.fg, bg = c.bg2 })
hi("TabLineFill", { bg = c.black })
hi("VertSplit", { fg = c.bg2 })
hi("WinSeparator", { fg = c.bg2 })
hi("Visual", { bg = c.bg2, fg = c.fg })
hi("Search", { fg = c.bg, bg = c.cursor })
hi("IncSearch", { fg = c.bg, bg = c.cyan })
hi("MatchParen", { fg = c.cursor, bold = true, underline = true })
hi("Pmenu", { fg = c.fg, bg = c.bg3 })
hi("PmenuSel", { fg = c.cursor, bg = c.bg2, bold = true })
hi("PmenuSbar", { bg = c.bg2 })
hi("PmenuThumb", { bg = c.comment })
hi("FloatBorder", { fg = c.comment, bg = c.bg3 })
hi("WinBar", { fg = c.fg_dim, bg = c.bg })
hi("Folded", { fg = c.comment, bg = c.bg2 })
hi("FoldColumn", { fg = c.comment, bg = c.bg })
hi("EndOfBuffer", { fg = c.bg2 })
hi("NonText", { fg = c.bg2 })
hi("SpecialKey", { fg = c.comment })
hi("Whitespace", { fg = c.bg2 })
hi("Conceal", { fg = c.comment })
hi("Directory", { fg = c.cyan })
hi("Title", { fg = c.cursor, bold = true })
hi("Question", { fg = c.cyan })
hi("MoreMsg", { fg = c.cyan })
hi("ModeMsg", { fg = c.fg_dim })
hi("ErrorMsg", { fg = c.red, bold = true })
hi("WarningMsg", { fg = c.yellow })

-- ── syntax ─────────────────────────────────────────────────────────────────
hi("Comment", { fg = c.comment, italic = true })
hi("Keyword", { fg = c.cursor, bold = true })
hi("Function", { fg = c.fg, bold = true })
hi("String", { fg = c.blue_lo })
hi("Number", { fg = c.yellow })
hi("Float", { fg = c.yellow })
hi("Boolean", { fg = c.yellow })
hi("Constant", { fg = c.yellow })
hi("Identifier", { fg = c.fg_dim })
hi("Type", { fg = c.blue })
hi("Typedef", { fg = c.blue })
hi("Operator", { fg = c.cyan })
hi("PreProc", { fg = c.violet })
hi("Include", { fg = c.violet })
hi("Define", { fg = c.violet })
hi("Macro", { fg = c.violet })
hi("Special", { fg = c.cursor })
hi("SpecialChar", { fg = c.cyan })
hi("Delimiter", { fg = c.fg_dim })
hi("Statement", { fg = c.cursor })
hi("Conditional", { fg = c.cursor, bold = true })
hi("Repeat", { fg = c.cursor, bold = true })
hi("Label", { fg = c.cyan })
hi("StorageClass", { fg = c.blue })
hi("Structure", { fg = c.blue })
hi("Error", { fg = c.red, bold = true })
hi("Todo", { fg = c.cursor, bold = true })
hi("Underlined", { underline = true })

-- ── treesitter ─────────────────────────────────────────────────────────────
hi("@variable", { fg = c.fg })
hi("@variable.builtin", { fg = c.cyan })
hi("@variable.parameter", { fg = c.fg_dim })
hi("@variable.member", { fg = c.fg_dim })
hi("@function", { fg = c.fg, bold = true })
hi("@function.builtin", { fg = c.cursor })
hi("@function.call", { fg = c.fg })
hi("@function.macro", { fg = c.violet })
hi("@method", { fg = c.fg, bold = true })
hi("@method.call", { fg = c.fg })
hi("@constructor", { fg = c.blue })
hi("@keyword", { fg = c.cursor, bold = true })
hi("@keyword.function", { fg = c.cursor, bold = true })
hi("@keyword.operator", { fg = c.cyan })
hi("@keyword.return", { fg = c.red })
hi("@keyword.import", { fg = c.violet })
hi("@type", { fg = c.blue })
hi("@type.builtin", { fg = c.blue, italic = true })
hi("@type.definition", { fg = c.blue })
hi("@string", { fg = c.blue_lo })
hi("@string.escape", { fg = c.cyan })
hi("@string.special", { fg = c.cyan })
hi("@number", { fg = c.yellow })
hi("@float", { fg = c.yellow })
hi("@boolean", { fg = c.yellow })
hi("@constant", { fg = c.yellow })
hi("@constant.builtin", { fg = c.yellow, italic = true })
hi("@comment", { fg = c.comment, italic = true })
hi("@operator", { fg = c.cyan })
hi("@punctuation", { fg = c.fg_dim })
hi("@punctuation.bracket", { fg = c.fg_dim })
hi("@punctuation.delimiter", { fg = c.fg_dim })
hi("@tag", { fg = c.cursor })
hi("@tag.attribute", { fg = c.blue })
hi("@tag.delimiter", { fg = c.comment })
hi("@namespace", { fg = c.violet })
hi("@attribute", { fg = c.violet })
hi("@field", { fg = c.fg_dim })
hi("@property", { fg = c.fg_dim })
hi("@label", { fg = c.cyan })
hi("@include", { fg = c.violet })
hi("@preproc", { fg = c.violet })
hi("@conditional", { fg = c.cursor, bold = true })
hi("@repeat", { fg = c.cursor, bold = true })
hi("@exception", { fg = c.red, bold = true })

-- ── LSP semantic tokens ────────────────────────────────────────────────────
hi("@lsp.type.function", { fg = c.fg, bold = true })
hi("@lsp.type.method", { fg = c.fg, bold = true })
hi("@lsp.type.keyword", { fg = c.cursor, bold = true })
hi("@lsp.type.type", { fg = c.blue })
hi("@lsp.type.class", { fg = c.blue })
hi("@lsp.type.variable", { fg = c.fg })
hi("@lsp.type.parameter", { fg = c.fg_dim })
hi("@lsp.type.property", { fg = c.fg_dim })
hi("@lsp.type.macro", { fg = c.violet })
hi("@lsp.type.comment", { fg = c.comment, italic = true })
hi("@lsp.type.string", { fg = c.blue_lo })
hi("@lsp.type.number", { fg = c.yellow })
hi("@lsp.type.operator", { fg = c.cyan })
hi("@lsp.type.namespace", { fg = c.violet })

-- ── diagnostics ────────────────────────────────────────────────────────────
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.yellow })
hi("DiagnosticInfo", { fg = c.blue })
hi("DiagnosticHint", { fg = c.cyan })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.cyan })
hi("DiagnosticVirtualTextError", { fg = c.red, bg = c.bg2 })
hi("DiagnosticVirtualTextWarn", { fg = c.yellow, bg = c.bg2 })
hi("DiagnosticVirtualTextInfo", { fg = c.blue, bg = c.bg2 })
hi("DiagnosticVirtualTextHint", { fg = c.cyan, bg = c.bg2 })
hi("DiagnosticFloatingError", { fg = c.red })
hi("DiagnosticFloatingWarn", { fg = c.yellow })
hi("DiagnosticFloatingInfo", { fg = c.blue })
hi("DiagnosticFloatingHint", { fg = c.cyan })

-- ── diff / git signs ───────────────────────────────────────────────────────
hi("DiffAdd", { fg = c.blue_lo, bg = "#3a3028" })
hi("DiffDelete", { fg = c.red, bg = "#3d2828" })
hi("DiffChange", { fg = c.yellow, bg = "#382e28" })
hi("DiffText", { fg = c.cursor, bg = "#402e28", bold = true })
hi("GitSignsAdd", { fg = c.blue_lo })
hi("GitSignsChange", { fg = c.yellow })
hi("GitSignsDelete", { fg = c.red })
hi("GitSignsAddNr", { fg = c.blue_lo })
hi("GitSignsChangeNr", { fg = c.yellow })
hi("GitSignsDeleteNr", { fg = c.red })

-- ── telescope ──────────────────────────────────────────────────────────────
hi("TelescopeBorder", { fg = c.comment, bg = c.bg3 })
hi("TelescopeNormal", { fg = c.fg, bg = c.bg3 })
hi("TelescopePromptBorder", { fg = c.blue, bg = c.bg3 })
hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg3 })
hi("TelescopePromptPrefix", { fg = c.cursor })
hi("TelescopeSelection", { fg = c.cursor, bg = c.bg2, bold = true })
hi("TelescopeSelectionCaret", { fg = c.cursor })
hi("TelescopeMatching", { fg = c.cursor, bold = true })
hi("TelescopePreviewTitle", { fg = c.cyan })
hi("TelescopeResultsTitle", { fg = c.comment })
hi("TelescopePromptTitle", { fg = c.blue })

-- ── neo-tree ───────────────────────────────────────────────────────────────
hi("NeoTreeNormal", { fg = c.fg_dim, bg = c.bg })
hi("NeoTreeNormalNC", { fg = c.fg_dim, bg = c.bg })
hi("NeoTreeRootName", { fg = c.cursor, bold = true })
hi("NeoTreeDirectoryName", { fg = c.cyan })
hi("NeoTreeDirectoryIcon", { fg = c.cyan })
hi("NeoTreeFileName", { fg = c.fg_dim })
hi("NeoTreeFileIcon", { fg = c.comment })
hi("NeoTreeGitAdded", { fg = c.blue_lo })
hi("NeoTreeGitModified", { fg = c.yellow })
hi("NeoTreeGitDeleted", { fg = c.red })
hi("NeoTreeIndentMarker", { fg = c.bg2 })
hi("NeoTreeExpander", { fg = c.comment })
hi("NeoTreeDotfile", { fg = c.comment })
hi("NeoTreeGitIgnored", { fg = c.comment, italic = true })

-- nvim-tree compat
hi("NvimTreeNormal", { fg = c.fg_dim, bg = c.bg })
hi("NvimTreeFolderName", { fg = c.cursor })
hi("NvimTreeGitDirty", { fg = c.yellow })
hi("NvimTreeRootFolder", { fg = c.cursor, bold = true })

-- ── which-key ──────────────────────────────────────────────────────────────
hi("WhichKey", { fg = c.cursor })
hi("WhichKeyGroup", { fg = c.cyan })
hi("WhichKeyDesc", { fg = c.fg_dim })
hi("WhichKeyBorder", { fg = c.comment })
hi("WhichKeySeparator", { fg = c.comment })
hi("WhichKeyFloat", { bg = c.bg3 })

-- ── indent-blankline ───────────────────────────────────────────────────────
hi("IblIndent", { fg = c.bg2 })
hi("IblScope", { fg = c.comment })

-- ── nvim-notify / noice ────────────────────────────────────────────────────
hi("NotifyERRORBorder", { fg = c.red })
hi("NotifyWARNBorder", { fg = c.yellow })
hi("NotifyINFOBorder", { fg = c.blue })
hi("NotifyDEBUGBorder", { fg = c.comment })
hi("NotifyERRORTitle", { fg = c.red, bold = true })
hi("NotifyWARNTitle", { fg = c.yellow, bold = true })
hi("NotifyINFOTitle", { fg = c.blue, bold = true })
hi("NotifyERRORBody", { fg = c.fg })
hi("NotifyWARNBody", { fg = c.fg })
hi("NotifyINFOBody", { fg = c.fg })

-- ── parrot.nvim / chat buffers ─────────────────────────────────────────────
hi("ParrotUser", { fg = c.cyan, bold = true })
hi("ParrotAssistant", { fg = c.fg_dim })
hi("ParrotBorder", { fg = c.comment })
