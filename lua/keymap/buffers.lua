-- First buffer plugin
-- Keymap for moving to the next buffer

vim.keymap.set('n', '<leader>bn', '<cmd>bn<cr>', { desc = "moving to the next buffer" })

-- list buffers

vim.keymap.set('n', '<leader>ls', '<cmd>ls<cr>', { desc = "list buffers" })

-- previous buffer

vim.keymap.set('n', '<leader>bp', '<cmd>bp<cr>', { desc = "moving to the prev buff" })

vim.keymap.set("n", "<leader>be", "<cmd>Telescope buffers<cr>", { desc = "show buffers" })
