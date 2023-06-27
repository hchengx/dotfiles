local opts = { noremap = true, silent = true }                  -- 不递归，静默

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)                           -- 清除空格键的作用
vim.g.mapleader = " "                                          -- 映射空格为leader键
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)                            -- 移动窗口的焦点，而不是移动光标
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

local builtin = require('telescope.builtin')                        -- 搜索
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})           -- 文件名搜索
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

keymap("n", "<M-h>", ":BufferLineCyclePrev<cr>", opts)               -- 转到左边buffer (cycle) 
keymap("n", "<M-l>", ":BufferLineCycleNext<cr>", opts)               -- 转到右边buffer (cycle)
keymap("n", "<M-1>", ":BufferLineGoToBuffer 1<cr>", opts)            -- 转到第一个buffer (下面的类似)
keymap("n", "<M-2>", ":BufferLineGoToBuffer 2<cr>", opts)
keymap("n", "<M-3>", ":BufferLineGoToBuffer 3<cr>", opts)
keymap("n", "<M-4>", ":BufferLineGoToBuffer 4<cr>", opts)
keymap("n", "<M-w>", ":bd<cr>", opts)                                -- 关闭当前buffer

keymap("n", "<leader>s", ":lua vim.lsp.buf.format()<cr>", opts)      -- 格式化
