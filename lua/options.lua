local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4

opt.smartindent = true
opt.termguicolors = false

-- neotree
require("neo-tree").setup({
	window = {
		position = "right",
	},
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = false,
		},
	},
})
require("blink.cmp").setup({
	keymap = {
		preset = "default",

		--        ["<Tab>"] = { "select_and_accept", "fallback" },
		--        ["<S-Tab>"] = { "select_prev", "fallback" },

		["<Tab>"] = { "accept", "fallback" },
	},

	completion = {
		menu = {
			auto_show = true,
		},

		documentation = {
			auto_show = true,
		},
	},

	sources = {
		default = {
			"lsp",
			"path",
			"buffer",
		},
	},
})
opt.background = "dark"
-- vim.cmd('colorscheme catppuccin')
vim.cmd.colorscheme("catppuccin")

local transparent_groups = {
	-- Main editor
	"Normal",
	"NormalNC",
	"NormalFloat",
	"EndOfBuffer",

	-- Side columns
	"SignColumn",
	"FoldColumn",
	"LineNr",
	"CursorLineNr",

	-- Bars
	"StatusLine",
	"StatusLineNC",
	"WinBar",
	"WinBarNC",
	"TabLine",
	"TabLineFill",
	"TabLineSel",

	-- Window borders / separators
	"WinSeparator",
	"VertSplit",

	-- Neo-tree
	"NeoTreeNormal",
	"NeoTreeNormalNC",
	"NeoTreeEndOfBuffer",
	"NeoTreeFloatNormal",
	"NeoTreeFloatBorder",
}

for _, group in ipairs(transparent_groups) do
	vim.api.nvim_set_hl(0, group, { bg = "none" })
end

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		local clients = vim.lsp.get_clients({
			bufnr = args.buf,
		})

		for _, client in ipairs(clients) do
			if client:supports_method("textDocument/formatting") then
				vim.lsp.buf.format({
					bufnr = args.buf,
				})
				break
			end
		end
	end,
})

require("nvim-autopairs").setup({});
