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

vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- this is so nice!!
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.pack.add({
    { src = "https://github.com/EdenEast/nightfox.nvim" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/echasnovski/mini.pairs" },
    { src = "https://github.com/echasnovski/mini.icons" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/Olical/conjure" },
})

vim.g["conjure#mapping#doc_word"] = false

require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.icons").setup()
require("oil").setup()

vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")
vim.keymap.set("n", "<leader>fh", ":Pick help<CR>")
vim.keymap.set("n", "<leader>fb", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>fg", ":Pick grep_live<CR>")

vim.keymap.set("n", "<leader>,", ":Oil<CR>")

vim.lsp.enable({ "lua_ls", "clangd", "racket_langserver" })
vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format)

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
        end
    end,
})
vim.cmd("set completeopt+=noselect")

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.expand(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end

vim.cmd("colorscheme carbonfox")
vim.cmd(":hi statusline guibg=NONE")

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>t", ":Floaterminal<CR>")
