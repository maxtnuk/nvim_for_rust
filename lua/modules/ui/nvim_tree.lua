require('nvim-tree').setup({
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
    on_attach = function(bufnr)
        local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        local ok, api = pcall(require, 'nvim-tree.api')
        assert(ok, 'api module is not found')
        vim.keymap.set('n', '<CR>', api.node.open.tab_drop, opts('Tab drop'))
    end,
})
