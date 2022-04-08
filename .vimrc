" default settings
syntax on
set number	
set scrolloff=3
set wrap
set showmatch
set autoread
set confirm 
set noswapfile
set incsearch 
set hlsearch	
set ignorecase	
set smartcase
set nocompatible
set termencoding=utf8 
set encoding=utf-8
set ruler
set showcmd
set foldenable
set foldlevel=100
set foldmethod=indent
set mouse=a
set mousemodel=popup
set hidden
set guioptions-=T 
set ch=1	 
set mousehide
set autoindent
set nowrap
set history=1000
set wildmenu
set t_Co=256
set splitbelow
set backspace=indent,eol,start
set laststatus=2
set showtabline=2
set noshowmode
set clipboard=unnamed,unnamedplus
set cursorline
set ttymouse=xterm2

set nobackup "Some servers have issues with backup files, see #649.
set nowritebackup
" set cmdheight=2 "Give more space for displaying messages.
set updatetime=300 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set shortmess+=c " Don't pass messages to |ins-completion-menu|.

" #########################################################################
" extended config
" #########################################################################
source ~/.vim/config/plugins.vim         " Plugins
source ~/.vim/config/colorscheme.vim 	 " Color schemas
source ~/.vim/config/key-binding.vim 	 " key binding
" source ~/.vim/config/coc-keybinding.vim  " coc key binding, disable by default 
