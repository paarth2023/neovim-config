vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = vim.version.range("3") },
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"https://github.com/ribru17/bamboo.nvim",
	"https://github.com/saghen/blink.lib",
	"https://github.com/Saghen/blink.cmp",
	"https://github.com/windwp/nvim-autopairs",
})
local cmp = require("blink.cmp")
cmp.build():pwait()
require("mason").setup({})
require("toggleterm").setup({})
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key"
			}
		}
	},
	pickers = {
	},
	extensions = {
	}
})
