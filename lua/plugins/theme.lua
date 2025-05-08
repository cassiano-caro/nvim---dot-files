-- configurando o tema do neovim (escolhi por enquanto o cattpuccin pq eh bonitinho e quebra um galho)






return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- opções: latte, frappe, macchiato, mocha
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}

