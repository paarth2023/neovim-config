-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = { "unnamedplus", "unnamed" } -- use system clipboard
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a" -- allow the mouse to be used in nvim

-- Tab
vim.opt.tabstop = 2 -- number of visual spaces per TAB
vim.opt.softtabstop = 2 -- number of spaces in tab when editing
vim.opt.shiftwidth = 2 -- insert 4 spaces on a tab
vim.opt.expandtab = false -- tabs are spaces, mainly because of Python

-- UI config
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true  -- enable 24-bit RGB color in the TUI
vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint
-- vim.opt.timeout
vim.opt.timeout = true
vim.opt.timeoutlen = 1000

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- Breadcrumbs setup using nvim-navic
_G.get_winbar = function()
	local ok, navic = pcall(require, "nvim-navic")
	if ok and navic.is_available() then
		return navic.get_location()
	end
	return ""
end

vim.o.winbar = "%{%v:lua.get_winbar()%}"
