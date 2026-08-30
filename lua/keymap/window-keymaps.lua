-- bind <C-W + j> to <C-j> and so on
--

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

-- vim.keymap.set("n", "<C-h>", "<C-w>>", { noremap = true })
-- vim.keymap.set("n", "<C-l>", "<C-w><", { noremap = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>-", { noremap = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>+", { noremap = true })

vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<cr>", { noremap = true })
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<cr>", { noremap = true })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { noremap = true })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { noremap = true })

-- vim.keymap.set("n", "<C-J>", "<C-w>J", { noremap = true })
-- vim.keymap.set("n", "<C-H>", "<C-w>H", { noremap = true })
-- vim.keymap.set("n", "<C-K>", "<C-w>K", { noremap = true })
-- vim.keymap.set("n", "<C-L>", "<C-w>L", { noremap = true })
