-- NEOVIM CONFIG!

-- Options

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
vim.opt.swapfile = false

-- Globals

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps

vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>M")
vim.keymap.set("n", "<C-b>", "<C-b>M")

vim.keymap.set("n", "<leader>c", "1z=")
vim.keymap.set("n", "<leader>st", ":setlocal spell spelllang=en_gb<CR>")
vim.keymap.set("n", "<leader>sf", ":setlocal spell spelllang=<CR>")


vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>")

vim.keymap.set("n", "<leader>o", ":Oil<CR>")

-- Autocmd

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.expand(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end

-- Plugins

vim.pack.add({
    { src = "https://github.com/EdenEast/nightfox.nvim" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/echasnovski/mini.notify" },
    { src = "https://github.com/echasnovski/mini.pairs" },
    { src = "https://github.com/echasnovski/mini.icons" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
})

require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.icons").setup()
require("oil").setup()
require("mini.notify").setup()

vim.notify = require('mini.notify').make_notify()

vim.lsp.enable({ "lua_ls", "clangd", "racket_langserver", "tinymist" })

vim.cmd("colorscheme carbonfox")
vim.cmd(":hi statusline guibg=NONE")
vim.cmd("set completeopt+=noselect")
