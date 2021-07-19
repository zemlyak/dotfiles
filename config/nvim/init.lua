local api = vim.api
local M = {}

vim.cmd [[packadd packer.nvim]]

vim.o.completeopt = "menuone,noselect"
vim.g.delimitMate_expand_cr = 1
vim.g.delimitMate_expand_space = 1
vim.g.switch_mapping = "<leader>s"
vim.NERDTreeShowHidden = 1
vim.g.NERDTreeWinPos = "right"
vim.g.airline_powerline_fonts = 1


vim.g.mapleader = " "
api.nvim_set_keymap("n", "<F2>", ":NERDTreeToggle<CR>", {})

api.nvim_command("set backupdir=$XDG_CACHE_HOME/vim/backup termguicolors number relativenumber autoread smartcase scrolloff=5 sidescrolloff=5 titlestring=%f%m title nobackup nowritebackup noswapfile noshowmode nowrap ruler")
api.nvim_command("colorscheme nord")

require('packer').startup(function(use)
	use 'Shougo/vimproc.vim'
	use 'wbthomason/packer.nvim'
	use 'AndrewRadev/switch.vim'
	use 'Raimondi/delimitMate'
	use 'kyazdani42/nvim-web-devicons'
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'kabouzeid/nvim-lspinstall'
	use 'hrsh7th/nvim-compe'
	use 'neovim/nvim-lspconfig'
	use 'arcticicestudio/nord-vim'
	use 'mhinz/vim-startify'
	use 'scrooloose/nerdtree'
	use 'norcalli/nvim-colorizer.lua'
end)

require'lspinstall'.setup() -- important

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
