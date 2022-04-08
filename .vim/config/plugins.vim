filetype plugin on

" ############################################################################## 
" 				 Plug autoload
" ############################################################################## 

" automatically downloads vim-plug to your machine if not found.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Define plugins to install
call plug#begin('~/.vim/plugged')

	" Browse the file system
	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'preservim/tagbar'
	Plug 'svermeulen/vim-easyclip'

	Plug 'tpope/vim-fugitive'
	Plug 'mileszs/ack.vim'
	Plug 'tpope/vim-commentary'
	"Plug 'voldikss/vim-floaterm'

	" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'airblade/vim-rooter'

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
	Plug 'ayu-theme/ayu-vim' " or other package manager
	Plug 'nanotech/jellybeans.vim'
	Plug 'Matsuuu/pinkmare'

	" C++ Development
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ##############################################################################################
"  NERDTree Settings 
" ##############################################################################################

let NERDTreeShowHidden=1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeIgnore = ['node_modules']
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>  " open and close file tree
" nmap <leader>n :NERDTreeFind<CR>  " open current buffer in file tree
autocmd BufEnter * lcd %:p:h

" ##############################################################################################
"  Lightline settings 
" ##############################################################################################
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[none]'

let g:lightline = {
	\ 'colorscheme': 'ayu_dark',
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

"let g:lightline.colorscheme 	 = 'ayu_mirage'
"let g:lightline.colorscheme 	 = 'PaperColor_dark'
"let g:lightline.colorscheme 	 = 'Tomorrow_Night'
"let g:lightline.colorscheme 	 = 'Tomorrow_Night_Eighties'
"let g:lightline.colorscheme 	 = 'PaperColor_light'
"let g:lightline.colorscheme 	 = 'one'
"let g:lightline.colorscheme 	 = 'ayu_dark'
"let g:lightline.colorscheme 	 = 'darcula'
"let g:lightline.colorscheme 	 = 'wombat'
