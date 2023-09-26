syntax on                                                                   " Turn syntax highlighting on
filetype plugin indent on                                                   " Turn on the filetype plugin
"set sessionoptions=blank,buffers,folds,help,resize,tabpages,winpos,winsize  " Set session persistence options
set enc=utf-8                                                               " Set UTF-8 encoding
set fenc=utf-8
set termencoding=utf-8
set nocompatible                                                            " Disable vi compatibility (emulation of old bugs)
set autoindent                                                              " Use indentation of previous line
set smartindent                                                             " Use intelligent indentation for C
set tabstop=4                                                               " Tab width is 4 spaces
set shiftwidth=4                                                            " Indent also with 4 spaces
set expandtab                                                               " Expand tabs to spaces
set nowrap                                                                  " Do not wrap lines
set noequalalways                                                           " Do not maintain window-size ratio (when having multiple window splits I don't find it desirable)
set ignorecase
set smartcase
set incsearch
set hlsearch                                                                " Highlight all search results
set number                                                                  " Turn line numbers on
set showmatch                                                               " Highlight matching braces
set comments=sl:/*,mb:\ *,elx:\ */                                          " Intelligent comments
"set wildmode=longest:full                                                   " Use intelligent file completion like in the bash
set wildmode=longest:full,full
set wildmenu
set hidden                                                                  " Allow changing buffers without saving them
set cul                                                                   " Highlight the current line
set backspace=2                                                             " Backspace tweaks
set backspace=indent,eol,start
set smarttab
set t_Co=256
set laststatus=2
set clipboard=unnamed,unnamedplus
set splitbelow
set termguicolors

set scrolloff=3
set autoread
set confirm 
set noswapfile
set ruler
set showcmd
set foldenable
set foldlevel=100
set foldmethod=indent
set mouse+=a
set mousemodel=popup
set guioptions-=T 
set ch=1	 
"set mousehide
set history=1000
set showtabline=2
" set noshowmode
" set cursorline
" set signcolumn=number
 set nobackup "Some servers have issues with backup files, see #649.
 set nowritebackup
"set cmdheight=2 "Give more space for displaying messages.
 set updatetime=300 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
 set shortmess+=c " Don't pass messages to |ins-completion-menu|.

if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end
