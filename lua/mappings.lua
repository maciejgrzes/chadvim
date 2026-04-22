require "nvchad.mappings"

local map = vim.keymap.set
local allModes = {'n', 'v', 's', 'o'}

map(allModes, ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>t", ":split | terminal<CR>")
map("n", "<leader>vt", ":vsplit | terminal<CR>")

map('n', '<C-Left>', '<C-w>h', opts) -- left
map('n', '<C-Down>', '<C-w>j', opts) -- down
map('n', '<C-Up>', '<C-w>k', opts) -- up
map('n', '<C-Right>', '<C-w>l', opts) -- right

map('n', '<C-S-Up>', ':resize -2<CR>', opts)
map('n', '<C-S-Down>', ':resize +2<CR>', opts)
map('n', '<C-S-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-S-Right>', ':vertical resize +2<CR>', opts)

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

map('v', "<S-Down>", ":m '>+1<CR>gv=gv")
map('v', "<S-Up>", ":m '<-2<CR>gv=gv")

map("t", "<Esc>", [[<C-\><C-n>]])

map('n', "<leader>u", ":UndotreeShow<CR>")
