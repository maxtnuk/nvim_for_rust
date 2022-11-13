-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend some vim mode key defines in this file

local keymap = require('core.keymap')
local nmap, imap, cmap, xmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap
local tmap = keymap.tmap
local vmap = keymap.vmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = ','

--- leaderkey
nmap({ ',', '', opts(noremap) })
xmap({ ',', '', opts(noremap) })

tmap({
  {'<Esc>', '<C-\\><C-n>', opts(noremap) }
})

-- usage example
nmap({
  -- noremal remap
  -- close buffer
  { '<C-x>k', cmd('bdelete'), opts(noremap, silent) },
  -- save
  { '<C-s>', cmd('write'), opts(noremap) },
  -- yank
  { 'Y', 'y$', opts(noremap) },
  -- toggle tree
  { '<F1>', cmd('NvimTreeToggle'), opts(noremap) },
  -- find files
  { '<Leader>ff', cmd('Telescope find_files'), opts(noremap) },
  { '<Leader>fg', cmd('Telescope grep_string'), opts(noremmap) },
  -- comment
  { '<C-/>', cmd('CommentToggle'), opts(noremap, silent) },
  -- reload vim
  { '<Leader>rr', ':source $MYVIMRC', opts(noremap) },
  -- lazygit
  { '<Leader>gg', cmd('LazyGit'), opts(noremap,silent) },
  -- terminal
  { 'tt', cmd('ToggleTerm size=70 direction="vertical" shell="bash" '), opts(noremap, silent) },
  -- buffer jump
  { ']b', cmd('bn'), opts(noremap) },
  { '[b', cmd('bp'), opts(noremap) },
  -- remove trailing white space
  { '<Leader>t', cmd('TrimTrailingWhitespace'), opts(noremap) },
  -- window jump
  { '<C-h>', '<C-w>h', opts(noremap) },
  { '<C-l>', '<C-w>l', opts(noremap) },
  { '<C-j>', '<C-w>j', opts(noremap) },
  { '<C-k>', '<C-w>k', opts(noremap) },
})

-- vmap({
--  { '<C-/>', cmd('CommentToggle'), opts(noremap, silent) },
-- })

-- barbar keymap
nmap({
  { '<A-,>', cmd('BufferPrevious'), opts(noremap, silent)},
  { '<A-.>', cmd('BufferNext'), opts(noremap, silent)},
  { '<A-<>', cmd('BufferMovePrevious'), opts(noremap, silent)},
  { '<A->>', cmd('BufferMoveNext'), opts(noremap, silent)},
  { '<Space>bb', cmd('BufferOrderByBufferNumber'), opts(noremap, silent)},
  { '<Space>bd', cmd('BufferOrderByDirectory'), opts(noremap, silent)},
  { '<Space>bl', cmd('BufferOrderByLanguage'), opts(noremap, silent)},
  { '<Space>bw', cmd('BufferOrderByWindowNumber'), opts(noremap, silent)},
  { '<A-c>', cmd('BufferClose'), opts(noremap, silent)},
  { '<A-p>', cmd('BufferPin'), opts(noremap, silent)},
})

-- lang setting
nmap({
  {'<C-]>', cmd('lua vim.lsp.buf.definition()'), opts(noremap,silent)},
  {'gh', cmd('RustHoverAction'), opts(noremap,silent)},
  {'gc', cmd('RustCodeAction'), opts(noremap,silent)},
  {'gD', cmd('lua vim.lsp.buf.implementation()'), opts(noremap,silent)},
  {'<C-k>', cmd('lua vim.lsp.buf.signature_help()'), opts(noremap,silent)},
  {'1gD', cmd('lua vim.lsp.buf.type_definition()'), opts(noremap,silent)},
  {'gr', cmd('lua vim.lsp.buf.references()'), opts(noremap,silent)},
  {'g0', cmd('lua vim.lsp.buf.document_symbol()'), opts(noremap,silent)},
  {'gw', cmd('lua vim.lsp.buf.workspace_symbol()'), opts(noremap,silent)},
})

imap({
  -- insert mode
  { '<C-h>', '<Bs>', opts(noremap) },
  { '<C-e>', '<End>', opts(noremap) },
})

-- commandline remap
cmap({ '<C-b>', '<Left>', opts(noremap) })
