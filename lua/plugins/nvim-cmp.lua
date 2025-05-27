return {

    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
    "hrsh7th/nvim-cmp",

    -- inicio das configuracoes
    config = function()

    -- adicionei os simbolos manualmente (voce precisa ter uma nerd font para poder ver)
    local cmp_kinds = {
        Text = '  ',
        Method = '  ',
        Function = '  ',
        Constructor = '  ',
        Field = '  ',
        Variable = '  ',
        Class = '  ',
        Interface = '  ',
        Module = '  ',
        Property = '  ',
        Unit = '  ',
        Value = '  ',
        Enum = '  ',
        Keyword = '  ',
        Snippet = '  ',
        Color = '  ',
        File = '  ',
        Reference = '  ',
        Folder = '  ',
        EnumMember = '  ',
        Constant = '  ',
        Struct = '  ',
        Event = '  ',
        Operator = '  ',
        TypeParameter = '  ',
    }

    -- config para as sugestoes do copilot que sao as de previsao do vscode
    local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
    end

    -- iniciando as configuracoes do cmp (adaptei o codigo da pagina do git hub deles)
    local cmp = require('cmp')
    -- setup:
    cmp.setup({


            -- config dos snippets
            snippet = {
                expand = function(args)
                require('luasnip').lsp_expand(args.body)
                end,
            },



            -- Window config
            window = {
                completion = cmp.config.window.bordered(),
                  documentation = cmp.config.window.bordered(),
            },



            -- Mapping (configuracoes de teclado)
            mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = vim.schedule_wrap(function(fallback)
                if cmp.visible() and has_words_before() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
            end),
            }),

        -- configuracoes de formatacao
        formatting = {
            format = function(entry, vim_item)
                local lspkind_ok, lspkind = pcall(require, "lspkind")
                if not lspkind_ok then
                    vim_item.kind = string.format('%s %s', cmp_kinds[vim_item.kind] or '', vim_item.kind)
                    vim_item.menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[LaTeX]",
                    })[entry.source.name]
                    return vim_item
                    else
                        return lspkind.cmp_format()(entry, vim_item)
                        end
                        end,
        },

        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
            { name = 'copilot' },
        }, {
            { name = 'buffer' },
        })

    })
    end,

    }
}

