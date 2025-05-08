-- init.lua arquivo de inicialização do neovim :)



 vim.g.mapleader = " "
 vim.g.maplocalleader = " "


require("config.lazy")

-- Carregar os keymaps *depois* que os plugins estiverem prontos
vim.schedule(function()
  require("config.keymaps")
end)
