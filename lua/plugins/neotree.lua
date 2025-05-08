-- configurações do neo tree

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x", -- usa a versão estável mais recente
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- opcional, ícones bonitos
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        position = "left",
        width = 30,
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_gitignored = true,
        },
      },
    })
  end,
}
