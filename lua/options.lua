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
	open_files_do_not_replace_types = { "Trouble", "qf", "edgy" },
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
-- vim.cmd('colorscheme default')
vim.cmd.colorscheme("dracula")

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

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwSetttings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_netrw_gitignore = 1
