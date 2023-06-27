local colorscheme = "onedark"
require(colorscheme).setup {
  highlights = {
   ["@lsp.type.macro"] = {fmt = 'bold', fg = '#8f5daf'},         -- macro
   ["@lsp.type.parameter"] = {fg = '#306b72'},                   -- function parameter
   ["@lsp.type.property"] = {fg = '#7ca6b7', fmt = 'underline'}, -- property
   ["@lsp.type.namespace"] = {fg = '#00d780', fmt = 'bold'},     -- namespace
   ["@lsp.type.variable"] = {fg = '#26cdca'},                    -- variable
   ["@lsp.type.builtinType"] = {fg = '#33ccff'},                 -- builtinType
   ["@lsp.type.class"] = {fg = '#729de3', fmt = 'bold'},
   ["@lsp.type.struct"] = {fg = '#729de3', fmt = 'bold'},
   ['@lsp.type.method'] = {fg = '#e5b124', fmt = 'underline'},
   ['@lsp.type.function'] = {fg = '#e5b124'},

--   TSKeyword = {fg = '#33ccff'},
   ["@keyword"] = {fg = '#33ccff'},
   ['@include'] = {fg = '#33ccff'},
   ['@define'] = {fg = '#33ccff'},

  }
}
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
