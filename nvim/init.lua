vim.cmd [[
  set encoding=utf-8
  set fileencoding=utf-8  "默认为空
  set fileencodings=ucs-bom,utf-8,default,latin1 "默认值
]]


-- 不在 ~/.config/nvim/
-- vim.opt.runtimepath:append(',~/.dotfiles/nvim')
-- the directory `~/.dotfiles/nvim` should be soft link rather then `init.lua` file
require "user.options"
require "user.lualine"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.nvim-tree"
require "user.bufferline"
require "user.comment"
require "user.keymaps"
