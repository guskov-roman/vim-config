syntax on                                                                   " Turn syntax highlighting on
filetype plugin indent on                                                   " Turn on the filetype plugin
set enc=utf-8                                                               " Set UTF-8 encoding
set fenc=utf-8
set termencoding=utf-8
set nocompatible                                                            " Disable vi compatibility (emulation of old bugs)
set tabstop=4                                                               " Tab width is 4 spaces
set shiftwidth=4                                                            " Indent also with 4 spaces
set expandtab                                                               " Expand tabs to spaces
set nowrap                                                                  " Do not wrap lines
set noequalalways                                                           " Do not maintain window-size ratio (when having multiple window splits I don't find it desirable)
set ignorecase
set smartcase
set incsearch
set hlsearch                                                                " Highlight all search results
set number relativenumber                                                   " Turn line numbers on
set showmatch                                                               " Highlight matching braces
set wildmode=longest:full,full
set wildmenu
set hidden                                                                  " Allow changing buffers without saving the
set backspace=2                                                             " Backspace tweaks
set backspace=indent,eol,start
set laststatus=2
set clipboard=unnamed,unnamedplus
set smarttab
set t_Co=256
set splitbelow
set scrolloff=3
set autoread
set confirm 
set ruler
set showcmd
set foldenable
set foldlevel=100
set foldmethod=indent
set mouse+=a
set mousemodel=popup
set guioptions-=T 
set ch=1	 
set history=1000
set showtabline=2
set updatetime=300  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience
set termguicolors

if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

source ~/.vim/.plugins.vimrc
source ~/.vim/.colorscheme.vimrc
source ~/.vim/.keybinding.vimrc

" ALE: reasonable defaults from webinstall.dev/vim-ale
" source ~/.vim/plugins/ale.vim
