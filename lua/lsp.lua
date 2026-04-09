-- lua/lsp.lua

local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
	vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Go to type definition" })

	vim.keymap.set("n", "gr", function()
		require("telescope.builtin").lsp_references({
			include_declaration = false,
			show_line = true,
		})
	end, { buffer = bufnr, desc = "References (Telescope)" })

	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover docs" })
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })

	vim.keymap.set("n", "<leader>sw", function()
		require("telescope.builtin").lsp_dynamic_workspace_symbols()
	end, { buffer = bufnr, desc = "Workspace symbols" })
end

-- Attach on_attach to every LSP client that connects
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			on_attach(client, args.buf)
		end
	end,
})

local capabilities = require("blink.cmp").get_lsp_capabilities()

-- clangd
vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=never",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=none",
	},
	filetypes = { "c", "cpp" },
	root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
	capabilities = capabilities,
})
vim.lsp.enable("clangd")

-- pyright
vim.lsp.config("pyright", {
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", ".git" },
	capabilities = capabilities,
})
vim.lsp.enable("pyright")

-- lua-language-server
vim.lsp.config("lua_ls", {
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".git" },
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
})
vim.lsp.enable("lua_ls")
