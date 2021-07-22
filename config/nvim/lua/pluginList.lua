local present, _ = pcall(require, "packerInit")
local packer

if present then
    packer = require "packer"
else
    return false
end

local use = packer.use


return require('packer').startup(function(use)
        use { 
	'wbthomason/packer.nvim',
	event = "VimEnter"
	}
        
	use {
	'Shougo/vimproc.vim',
	run = "make -j4"
	}
	
	use 'akinsho/nvim-bufferline.lua'
        
	use 'AndrewRadev/switch.vim'
        
        use {
            'hoob3rt/lualine.nvim',
            config = function()
                require "plugins.statusline"
            end
        }
        
	use 'Raimondi/delimitMate'
        
        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
                require "plugins.compe"
            end,
            wants = "LuaSnip",
            requires = {
                {
                    "L3MON4D3/LuaSnip",
                    wants = "friendly-snippets",
                    event = "InsertCharPre",
                    config = function()
                        require "plugins.luasnip"
                    end
                },
                {
                    "rafamadriz/friendly-snippets",
                    event = "InsertCharPre"
                }
            }
        }

	use 'kyazdani42/nvim-web-devicons'

	use {
            "nvim-treesitter/nvim-treesitter",
            event = "BufRead",
        }

        --use 'nvim-treesitter/nvim-treesitter-textobjects'
        
        use {
            "kabouzeid/nvim-lspinstall",
            event = "BufRead"
        }
        
        use {
            "neovim/nvim-lspconfig",
            after = "nvim-lspinstall",
            config = function()
                require "plugins.lspconfig"
            end
        }
        
        use {
            'shaunsingh/nord.nvim',
            after = "packer.nvim",
            config = function()
                require "theme"
            end
        }
        
	use 'mhinz/vim-startify'
        
	use 'scrooloose/nerdtree'
	
	use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            setup = function()
                require("plugins.indent").blankline()
            end
        }

        use {
            "tweekmonster/startuptime.vim",
            cmd = "StartupTime"
        }

        use {
            "onsails/lspkind-nvim",
            event = "BufRead",
            config = function()
                require("plugins.lspkind").lspkind()
            end
        }

        use 'norcalli/nvim-colorizer.lua'
end)
