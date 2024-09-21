local cmp = require('cmp')

cmp.setup({
    preselect = cmp.PreselectMode.Item,
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
    },
    -- You can set mappings if you want
    mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.config.disable,
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'calc' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'crates' },
    },
})
