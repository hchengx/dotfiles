local options = {
  backup = false,                          -- 备份                       creates a backup file 
  clipboard = "unnamedplus",               -- 允许系统板粘贴             allows neovim to access the system clipboard
  cmdheight = 2,                           -- 底部命令行高度             more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- 设置补全操作方式           mostly just for cmp
  conceallevel = 0,                        -- 禁用隐藏功能               so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- 字符编码                   the encoding written to a file
  hlsearch = true,                         -- 启用搜索高亮               highlight all matches on previous search pattern
  ignorecase = true,                       -- 忽视大小写                 ignore case in search patterns
  mouse = "a",                             -- 允许使用鼠标               allow the mouse to be used in neovim
  pumheight = 10,                          -- 设置弹出式菜单的最大高度   pop up menu height
  showmode = false,                        -- 底部不显示当前编辑模式     we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- 始终显示标签页选项卡       always show tabs
  smartcase = true,                        -- 开启智能大小写匹配         smart case
  smartindent = true,                      -- 智能缩进                   make indenting smarter again
  splitbelow = true,                       -- 垂直方向向下分屏           force all horizontal splits to go below current window
  splitright = true,                       -- 水平方向向右分屏           force all vertical splits to go to the right of current window
  swapfile = false,                        -- 不启用交换文件             creates a swapfile
  -- termguicolors = true,                    --                         set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- 插入模式下等待下个按键时间 time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- 设置更新文本对象的时间间隔 faster completion (4000ms default)
  writebackup = false,                     -- 保存文件时是否备份原文件   if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- 将Tab自动转换为空格        convert tabs to spaces
  shiftwidth = 2,                          -- 缩进命令时缩进的宽度       the number of spaces inserted for each indentation
  tabstop = 2,                             -- 插入模式下Tab键的空格数    insert 2 spaces for a tab
  cursorline = true,                       -- 突出显示当前行             highlight the current line
  number = true,                           -- 行号显示                   set numbered lines
  relativenumber = false,                  -- 不显示相对行号             set relative numbered lines
  numberwidth = 4,                         -- 行号的宽度                 set number column width to 2 {default 4}
  signcolumn = "yes",                      -- 标记列                     always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- 光标距离屏幕上下一定行数内时，滚动屏幕 is one of my fav
  sidescrolloff = 8,                       -- 同理
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  undofile = true,                         -- 开启持久化撤销，即可以撤销到打开文件前的记录
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end


vim.cmd "set whichwrap+=<,>,[,],h,l"       -- 允许光标行首行尾换行
vim.cmd [[set iskeyword+=-]]               -- 将-看成单词的一部分
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
