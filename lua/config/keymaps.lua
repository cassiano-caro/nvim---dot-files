-- keymaps para o neovim

vim.keymap.set("n", "<C-b>", ":Neotree reveal left<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", ":Neotree close<CR>", { noremap = true, silent = true })

-- Configura tab para 4 espaços
vim.opt.expandtab = true -- usa espaços em vez de tab
vim.opt.shiftwidth = 4   -- tamanho da indentação
vim.opt.tabstop = 4      -- tab se comporta como 4 espaços
vim.opt.softtabstop = 4  -- ao apertar tab, insere 4 espaços

-- Opcional: ativa indentação inteligente
vim.opt.smartindent = true

local ls = require("luasnip")

vim.keymap.set({ "i" }, "<C-K>", function()
    ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
    ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
    ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
