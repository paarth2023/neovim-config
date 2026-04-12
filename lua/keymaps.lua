local M = {}
-- define common options
local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}
local harpoon = require("harpoon")
harpoon:setup()

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
-- Terminal window navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)
-- Resize with arrows
-- delta: 2 lines
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
-- format file on space+cf
vim.keymap.set("n", "<leader>cf", function()
	vim.lsp.buf.format({
		async = true,
		tabSize = 8,
		insertSpaces = false,
	})
end, { desc = "Format file" })

-- format file on write with excluded filetypes
local excluded_filetypes = {
	c = true,
	cpp = true,
	-- Add other filetypes here if needed
}

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		if excluded_filetypes[vim.bo.filetype] then
			return
		end

		vim.lsp.buf.format({
			async = false,
			tabSize = 8,
			insertSpaces = false,
		})
	end,
})

-- Terminal normal mode

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Grep in current working directory
vim.keymap.set("n", "<leader>gC", function()
	require("telescope.builtin").live_grep({
		cwd = vim.loop.cwd(),
		prompt_title = "Live Grep (CWD)",
	})
end, { desc = "Grep in CWD" })

-- list active buffers
vim.keymap.set("n", "<leader>bb", function()
	require("telescope.builtin").buffers({
		sort_lastused = true,
		ignore_current_buffer = true,
		previewer = false,
	})
end, { desc = "List open buffers" })
-- default telescope options
-- Useful Telescope buffer actions (default)

-- --<CR> → open buffer
--
-- --<C-d> → delete buffer
--
-- --<C-s> → open in horizontal split
--
-- --<C-v> → open in vertical split
--
-- --<C-t> → open in new tab
-- add buffer
vim.keymap.set("n", "<leader>ba", function()
	require("telescope.builtin").find_files({
		cwd = vim.uv.cwd(),
		hidden = true,
		no_ignore = false,
	})
end, { desc = "Find files in CWD" })

-- Find file (CWD)
vim.keymap.set("n", "<leader>f", function()
	require("telescope.builtin").find_files()
end, { desc = "Find file (CWD)" })

-- LSP Symbols (Floating)
vim.keymap.set("n", "<leader>ss", function()
	local builtin = require("telescope.builtin")
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		vim.notify("LSP: No client attached", vim.log.levels.WARN)
		return
	end

	builtin.lsp_document_symbols({
		layout_strategy = "center",
		layout_config = {
			width = 0.8,
			preview_cutoff = 1,
		},
		sorting_strategy = "ascending",
		border = true,
		results_title = "Results",
	})
end, { desc = "LSP Symbols (Floating)" })

-- Ex command keymap
-- NeoTree
vim.keymap.set("n", "<leader>E", ":Neotree reveal toggle left<CR>", { desc = "Toggle Explorer" })
vim.keymap.set("n", "<leader>e", ":Neotree reveal toggle float<CR>", { desc = "Floating Explorer" })

-- Bufferline navigation
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- Terminal
vim.keymap.set("n", "<leader>tt", "<cmd>terminal<cr>", { desc = "Open neovim terminal buffer" })
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Floating Terminal" })
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Horizontal Terminal" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Vertical Terminal" })

-- Harpoon
-- Add current file to Harpoon
vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "Harpoon add file" })

-- Toggle Harpoon quick menu
vim.keymap.set("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon menu" })

-- Debugging (DAP)
local dap = require("dap")
local dapui = require("dapui")
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue/Start" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Terminate" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle Debug UI" })

-- diagnostics
vim.keymap.set("n", "<leader>m", vim.diagnostic.open_float, { desc = "Line diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
-- Leetcode
vim.keymap.set("n", "<leader>l", ":Leet<CR>", opts)
vim.keymap.set("n", "<leader>lr", ":Leet run<CR>", opts)
vim.keymap.set("n", "<leader>ls", ":Leet submit<CR>", opts)
vim.keymap.set("n", "<leader>lm", ":Leet menu<CR>", opts)
vim.keymap.set("n", "<leader>ll", ":Leet list<CR>", opts)
vim.keymap.set("n", "<leader>lc", ":Leet console<CR>", opts)
vim.keymap.set("n", "<leader>lo", ":Leet open<CR>", opts)

-- Write and quit

vim.keymap.set("n", "<leader>q", ":q<CR>", opts)
vim.keymap.set("n", "<leader>qa", ":qa<CR>", opts)
vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<leader>wq", ":wq<CR>", opts)
vim.keymap.set("n", "<leader>wqa", ":wqa<CR>", opts)
vim.keymap.set("n", "<leader>qn", ":qa!<CR>", opts)

-- Terminal shortcut

-- vim.keymap.set("n", "<leader>t", ":terminal<CR>", opts)

-- Find files in root and current directories

vim.keymap.set("n", "<leader>fb", function()
	require("telescope").extensions.file_browser.file_browser()
end)

vim.keymap.set("n", "<leader>n", "<cmd>Telescope notify<cr>", { desc = "Notifications" })

-- fluoride.nvim
vim.keymap.set("n", "<leader>cp", "<cmd>Fluoride<cr>", { desc = "Fluoride.nvim : View and Reorder Code blocks" })

-- Litee Calltree

-- incoming calls

vim.keymap.set("n", "<leader>ci", ":lua vim.lsp.buf.incoming_calls()<cr>", { desc = "Litee: incoming calls" })

-- outgoing calls

vim.keymap.set("n", "<leader>co", ":lua vim.lsp.buf.outgoing_calls()<cr>", { desc = "Litee: outgoing calls" })
vim.keymap.set("v", "<leader>rp", function()
	-- yank the visual selection
	local lines = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = vim.fn.mode() })

	-- create a new scratch buffer
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.bo[buf].buftype = "nofile"
	vim.bo[buf].bufhidden = "wipe"
	vim.bo[buf].swapfile = false
	vim.bo[buf].modifiable = false -- read-only

	-- open it in a vertical split to the right
	vim.cmd("vsplit")
	local win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_buf(win, buf)
	vim.wo[win].winfixwidth = true
	vim.wo[win].number = false
	vim.wo[win].relativenumber = false
	vim.wo[win].wrap = true

	-- go back to the original window
	vim.cmd("wincmd p")
end, { desc = "Yank selection into read-only reference pane" })
