require "nvchad.mappings"

local map = vim.keymap.set
local allModes = { 'n', 'v', 's', 'o' }

map("n", "<A-Left>",  "<C-w>h", { desc = "Window left" })
map("n", "<A-Down>",  "<C-w>j", { desc = "Window down" })
map("n", "<A-Up>",    "<C-w>k", { desc = "Window up" })
map("n", "<A-Right>", "<C-w>l", { desc = "Window right" })

map("i", "<A-Left>",  "<Esc><C-w>h", { desc = "Window left" })
map("i", "<A-Down>",  "<Esc><C-w>j", { desc = "Window down" })
map("i", "<A-Up>",    "<Esc><C-w>k", { desc = "Window up" })
map("i", "<A-Right>", "<Esc><C-w>l", { desc = "Window right" })

map(allModes, ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>t", ":split | terminal<CR>")
map("n", "<leader>vt", ":vsplit | terminal<CR>")

map('n', '<C-S-Up>', ':resize -2<CR>')
map('n', '<C-S-Down>', ':resize +2<CR>')
map('n', '<C-S-Left>', ':vertical resize -2<CR>')
map('n', '<C-S-Right>', ':vertical resize +2<CR>')

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map('v', '<', '<gv')
map('v', '>', '>gv')
map('v', "<S-Down>", ":m '>+1<CR>gv=gv")
map('v', "<S-Up>", ":m '<-2<CR>gv=gv")

map("t", "<Esc>", [[<C-\><C-n>]])
map("n", "<leader>u", ":UndotreeShow<CR>")

vim.keymap.del({ "n", "i" }, "<C-s>")
