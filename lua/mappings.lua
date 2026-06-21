require "nvchad.mappings"

local map = vim.keymap.set
local mc = require("multicursor-nvim")
mc.setup()

local allModes = { 'n', 'v', 's', 'o' }

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

map({ "n", "x" }, "<C-Up>",   function() mc.lineAddCursor(-1) end, { desc = "Add cursor up" })
map({ "n", "x" }, "<C-Down>", function() mc.lineAddCursor(1)  end, { desc = "Add cursor down" })
map({ "n", "x" }, "<C-s>",    function() mc.matchAddCursor(1) end, { desc = "Add cursor on next match" })
map({ "n", "x" }, "<C-x>",    mc.matchSkipCursor, { desc = "Skip next match" })

map("n", "<esc>", function()
  if not mc.cursorsEnabled() then mc.enableCursors()
  else mc.clearCursors() end
end)
