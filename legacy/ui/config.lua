-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local config = {}

function config.zephyr()
    vim.cmd('colorscheme zephyr')
end

function config.galaxyline()
    require('modules.ui.eviline')
end

function config.dashboard()
    local home = os.getenv('HOME')
    local db = require('dashboard')
    db.session_directory = home .. '/.cache/nvim/session'
    db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
    db.preview_file_height = 12
    db.preview_file_width = 80
    db.custom_center = {
        {
            icon = '  ',
            desc = 'Update Plugins                          ',
            shortcut = 'SPC p u',
            action = 'PackerUpdate',
        },
        {
            icon = '  ',
            desc = 'Recently opened files                   ',
            action = 'DashboardFindHistory',
            shortcut = 'SPC f h',
        },
        {
            icon = '  ',
            desc = 'Find File                              ',
            action = 'Telescope find_files find_command=rg,--hidden,--files',
            shortcut = 'SPC f f',
        },
    }
end

function config.nvim_bufferline()
    require('bufferline').setup({
        options = {
            modified_icon = '✥',
            buffer_close_icon = '',
            always_show_bufferline = false,
        },
    })
end

function config.nvim_tree()
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
end

return config
