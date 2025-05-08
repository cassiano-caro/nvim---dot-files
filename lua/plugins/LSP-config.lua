-- plugins/lsp.lua

return {
    -- Mason
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                },
            },
        })
        end,
    },

    -- Mason LSPConfig
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                automatic_installation = true,
        })
        end,
    },

    -- LSPConfig
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        -- Pega a lista dos servers instalados e configura cada um
        mason_lspconfig.setup_handlers = mason_lspconfig.setup_handlers or function(_) end -- compatibilidade

        mason_lspconfig.get_installed_servers = mason_lspconfig.get_installed_servers or function() return {} end -- compat

        for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
            lspconfig[server_name].setup({})
            end
            end,
    },
}
