"" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/plugged')
"
" Declare the list of plugins.
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'AndrewRadev/switch.vim'
Plug 'benekastah/neomake'
Plug 'Raimondi/delimitMate'
Plug 'ryanoasis/vim-devicons'
Plug 'arcticicestudio/nord-vim'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'norcalli/nvim-colorizer.lua'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
let mapleader = " "

" Colorscheme
colorscheme nord

"Vim options
set backupdir=$XDG_CACHE_HOME/vim/backup
set termguicolors
set number relativenumber
set autoread
set smartcase
set scrolloff=5
set sidescrolloff=5
set titlestring=%f%m
set title
set nobackup
set nowritebackup
set noswapfile
set noshowmode
set nowrap
set ruler


"" Plugin options
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:switch_mapping = "<leader>s"
let NERDTreeShowHidden = 1
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\~$', '\.swo$', '\.swp$', '\.git$', '\.hg', '\.svn', '\.bzr', '\.settings', '\.project', '\.DS_Store', '^node_modules$']
let g:airline_powerline_fonts = 1

" remaps
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <F2> :NERDTreeToggle<CR>
cmap w!! w !sudo tee %

" use system clipboard
if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
