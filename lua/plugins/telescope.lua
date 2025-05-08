-- configurações do telescope e da ui do mesmo


return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
  local telescope = require('telescope')
  local themes = require('telescope.themes')

  telescope.setup({
    extensions = {
      ["ui-select"] = themes.get_dropdown({
        -- você pode colocar mais opções aqui, por exemplo:
        -- winblend = 10,
        -- previewer = false,
      }),
    },
  })

  -- Carrega a extensão ui-select
  telescope.load_extension('ui-select')
  end,
}
