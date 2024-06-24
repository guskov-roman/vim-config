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
" set clipboard=unnamed
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
set omnifunc=syntaxcomplete#Complete

if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end


" automatically downloads vim-plug to your machine if not found.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

    Plug 'tpope/vim-fugitive'

    Plug 'tpope/vim-commentary'
 	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

 	" Lightline status line and buffer
	Plug 'itchyny/lightline.vim'
	Plug 'mengelbrecht/lightline-bufferline'

	" Color scheme
	Plug 'jacoborus/tender.vim'
	Plug 'kristijanhusak/vim-hybrid-material'
	Plug 'morhetz/gruvbox'
	Plug 'sonph/onehalf', {'rtp': 'vim' }
	Plug 'rakr/vim-one'
	Plug 'sainnhe/everforest'
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'ayu-theme/ayu-vim'
	Plug 'nanotech/jellybeans.vim'
    Plug 'adrian5/oceanic-next-vim'
    Plug 'joshdick/onedark.vim'

call plug#end()

" ====================== Plugins Settings =================================

let $FZF_DEFAULT_COMMAND = "find . -type f -not -path '*/\.git/*'"

" Close the quickfix buffer
autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix"| quit |endif


let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[NONE]'

" \ 'colorscheme': ayu_dark, ayu_mirage, wombat, Tomorrow_Night_Bright, materia, material, onehalfdark

let g:lightline = {
	\ 'colorscheme': 'onehalfdark',
	\ 'tabline' : {
	\	'left': [['buffers']], 'right': [['close']]
	\},
	\ 'active': {
	\	'left':  [[ 'mode', 'paste', 'readonly' ],
	\                ['fugitive', 'filename', 'modified' ]],
    	\	'right': [[ 'lineinfo' ],
    	\              	 [ 'percent' ],
    	\              	 [ 'fileformat', 'fileencoding', 'filetype', ]]
	\ },
	\ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
	\ 'component_type': {'buffers': 'tabsel'},
	\ 'component_function': {
	\   'fugitive': 'LightlineFugitive',
	\   'filename': 'LightlineFilename'
	\ }
	\ }
" Function to check if the file has been modified
function! LightlineModified()
	return &ft =~# 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
" Function to check the read-only property
function! LightlineReadonly()
	return &ft !~? 'help\|vimfiler' && &readonly ? 'RO' : ''
endfunction
" Function to get the current branch from Fugitive
function! LightlineFugitive()
	if &ft !~? 'vimfiler' && exists('*FugitiveHead')
		return FugitiveHead()
	endif
	return ''
endfunction

" ====================== Color Schemas  =================================
"
" set background=dark
" let g:enable_italic_font = 1
" let g:hybrid_transparent_background = 1
" colorscheme hybrid_material

" colorscheme gruvbox
" set background=dark
" let g:gruvbox_contrast_dark = 'soft'
" let g:gruvbox_italic = 1

 " colorscheme gruvbox
 " let g:gruvbox_contrast_light = 'soft'
 " let g:gruvbox_italic = 1

" colorscheme one
" set background=dark
" " set background=light
" let g:one_allow_italics = 1 " I love italic for comments

" set background=dark
" set background=light
" colorscheme PaperColor

" colorscheme jellybeans
" let g:jellybeans_use_lowcolor_black = 1
" let g:jellybeans_use_term_italics = 1
" let g:jellybeans_use_gui_italics = 1


let g:oceanic_italic_comments = 1
let g:oceanic_bold = 0
colorscheme oceanicnext

" My Default colors
let g:terminal_ansi_colors = [
	\ '#2d3037', '#ab485f', '#45ac90', '#ab863b',
	\ '#407baf', '#756187', '#42939f', '#ccdddd',
	\ '#2d3037', '#ff597a', '#55ffcc', '#ffc03e',
	\ '#4daeff', '#a683bc', '#51d6e5', '#ffffff']

" let g:terminal_ansi_colors = [
"   \'#282828', '#CC241D', '#98971A', '#D79921',
"   \'#458588', '#B16286', '#689D6A', '#D65D0E',
"   \'#fb4934', '#b8bb26', '#fabd2f', '#83a598',
"   \'#d3869b', '#8ec07c', '#fe8019', '#FBF1C7' ]

" ====================== Keys Mapping =================================

" remap lead key, bei default '\'
let mapleader = ","

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

"Move to the next buffer
nmap <leader>l :bnext<CR>
"Move to the previous buffer
nmap <leader>h :bprevious<CR>
"Close the current buffer and move to the previous one. This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>
"Show all open buffers and their status.
nmap <leader>b :Buffers<CR>

vmap <Tab> >gv
vmap <S-Tab> <gv

"Turn highlighting off till next search
map <silent> <leader>/ :nohlsearch<cr>

map <leader>f :Files<CR>

nnoremap <space> za
nnoremap <DEL> "_x
vnoremap <DEL> "_x

nnoremap d "_d
vnoremap d "_d
nnoremap dd "_dd

xnoremap p pgvy

noremap <Leader>y "+y
noremap <Leader>x "+x
noremap <Leader>p "+p
