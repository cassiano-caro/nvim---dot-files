-- config do none ls

return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {

        -- para cada linguagem q eu adicionar para uso eu posso por um linter e um formaterr e ele vai formatar quando der espaco gf sozinho
    
        -- formaterr
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rubocop,

        -- diagnostics
        null_ls.builtins.diagnostics.rubocop,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
