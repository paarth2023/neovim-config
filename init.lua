vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.shell = "/bin/zsh"
-- require("dashboard")
require("options")
require("plugins")
require("keymaps")
require("colorscheme")
require("lsp")
--vim.opt.winseparator = true
vim.opt.fillchars:append({
	vert = "│", -- vertical split
	horiz = "─", -- horizontal split
	horizup = "┴", -- horizontal line with up-connection
	horizdown = "┬", -- horizontal line with down-connection
	vertleft = "┤", -- vertical line with left-connection
	vertright = "├", -- vertical line with right-connection
	verthoriz = "┼", -- cross
})
vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
	callback = function()
		local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
		if not normal.bg then
			return
		end
		io.write(string.format("\027]11;#%06x\027\\", normal.bg))
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.server_capabilities.documentSymbolProvider then
			require("nvim-navic").attach(client, bufnr)
		end
		local ft = vim.bo[bufnr].filetype
		if vim.tbl_contains({ "DressingInput", "NoiceInput", "TelescopePrompt" }, ft) then
			vim.diagnostic.enable(false, { bufnr = bufnr })
			vim.defer_fn(function()
				if vim.api.nvim_buf_is_valid(bufnr) then
					vim.lsp.buf_detach_client(bufnr, args.data.client_id)
				end
			end, 0)
		end
	end,
})

vim.api.nvim_create_autocmd("UILeave", {
	callback = function()
		io.write("\027]111\027\\")
	end,
})
vim.cmd("colorscheme nordic_blue_minimal")
