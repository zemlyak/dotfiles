local opt = vim.opt
local g = vim.g

-- потом включу
-- vim.cmd([[
    -- syntax off
    -- filetype off
    -- filetype plugin indent off
-- ]])

-- Настройки вима

opt.ruler = true
opt.autoread = true
opt.number = true
opt.smartcase = true
opt.scrolloff = 5
opt.sidescrolloff = 5
opt.title = true
opt.titlestring="%f%m"
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.showmode = false
opt.termguicolors = true
opt.wrap = false


-- Плагины --
vim.g.delimitMate_expand_cr = 1
vim.g.delimitMate_expand_space = 1
vim.NERDTreeShowHidden = 1
vim.g.NERDTreeWinPos = "right"

-- Бинды (очень много) --
vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<F2>", ":NERDTreeToggle<CR>", {})
vim.g.switch_mapping = "<leader>s"


