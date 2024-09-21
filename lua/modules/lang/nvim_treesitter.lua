require('nvim-treesitter.configs').setup({
    ensure_installed = { 'rust', 'lua', 'toml' },
    auto_install = true,
    ignore_install = { 'phpdoc' },
    highlight = {
        enable = true,
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
    },
})
