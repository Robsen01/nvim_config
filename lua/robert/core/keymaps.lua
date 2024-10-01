local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")
keymap.set("t", "jk", "<C-\\><C-n><C-w>h",{silent = true})

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>6", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
keymap.set("n", "<leader>4", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
keymap.set("n", "<leader>8", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
keymap.set("n", "<leader>5", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>");
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>"); 
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>"); 
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>");

vim.keymap.set("n", "<leader>)", 'ciw(<C-r>")<ESC>)', { noremap = true})
vim.keymap.set("n", "<leader>]", 'ciw[<C-r>"]<ESC>)', { noremap = true})
vim.keymap.set("n", "<leader>}", 'ciw{<C-r>"}<ESC>)', { noremap = true})

vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeToggle<CR>", { noremap = true})

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


