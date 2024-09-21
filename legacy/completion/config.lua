-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local config = {}

function config.lua_snip()
    local ls = require('luasnip')
    local types = require('luasnip.util.types')
    ls.config.set_config({
        history = true,
        enable_autosnippets = true,
        updateevents = 'TextChanged,TextChangedI',
        ext_opts = {
            [types.choiceNode] = {
                active = {
                    virt_text = { { '<- choiceNode', 'Comment' } },
                },
            },
        },
    })
    require('luasnip.loaders.from_lua').lazy_load({ paths = vim.fn.stdpath('config') .. '/snippets' })
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_vscode').lazy_load({
        paths = { './snippets/' },
    })
end

return config
