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
	" Plug 'ryanoasis/vim-devicons'
	Plug 'preservim/tagbar'
    " Plug 'jeetsukumaran/vim-buffergator'
    Plug 'voldikss/vim-floaterm'

	Plug 'svermeulen/vim-easyclip'
    Plug 'dkprice/vim-easygrep'
    " Plug 'Valloric/ListToggle'

	Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
	Plug 'mileszs/ack.vim'
	Plug 'tpope/vim-commentary'

 	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
    " Plug 'airblade/vim-rooter'

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

    " Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" C++ Development
    "
    " Plug 'cdelledonne/vim-cmake'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'ycm-core/YouCompleteMe'

    " Python Development
    " Plug 'davidhalter/jedi-vim'
    " Plug 'dense-analysis/ale'

call plug#end()


let $FZF_DEFAULT_COMMAND = "find . -type f -not -path '*/\.git/*'"

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the quickfix buffer 
autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix"| quit |endif

let g:NERDTreeFileLines = 1

" let g:syntastic_quiet_messages = { "level": "warnings" }

let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

" show number of errors
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_completion_enabled = 0
