syntax on                                                                   " Turn syntax highlighting on
filetype plugin indent on                                                   " Turn on the filetype plugin
set enc=utf-8                                                               " Set UTF-8 encoding
set fenc=utf-8
set termencoding=utf-8

set colorcolumn=81
" execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=Black ctermfg=DarkRed

set nocompatible                                                            " Disable vi compatibility (emulation of old bugs)
set tabstop=4                                                               " Tab width is 4 spaces
set shiftwidth=4                                                            " Indent also with 4 spaces
set expandtab                                                               " Expand tabs to spaces
set nowrap                                                                  " Do not wrap lines
set noswapfile
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
   	Plug 'preservim/tagbar'
   	Plug 'scrooloose/nerdtree'

	" Lightline status line and buffer
	" Plug 'itchyny/lightline.vim'
	" Plug 'mengelbrecht/lightline-bufferline'

	" Color scheme
	" Plug 'jacoborus/tender.vim'
	" Plug 'morhetz/gruvbox'
	" Plug 'ayu-theme/ayu-vim'
	Plug 'nanotech/jellybeans.vim'
   	" Plug 'adrian5/oceanic-next-vim'
   	" Plug 'mkarmona/materialbox'

   	Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let $FZF_DEFAULT_COMMAND = "find . -type f -not -path '*/\.git/*'"


" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the quickfix buffer
autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix"| quit |endif

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

colorscheme jellybeans

let g:jellybeans_overrides = {
\    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
\              'ctermfg': 'Black', 'ctermbg': 'Yellow',
\              'attr': 'bold' },
\    'Comment': { 'guifg': 'cccccc' },
\    'MatchParen': { 'guifg': 'ffffff', 'guibg': '556779' },
\}

let g:jellybeans_use_term_italics = 1

"Move to the next buffer
nmap <leader>l :bnext<CR>
"Move to the previous buffer
nmap <leader>h :bprevious<CR>
"Close the current buffer and move to the previous one. This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>
"Show all open buffers and their status.
nmap <leader>b :Buffers<CR>


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

nmap <f8> :TagbarToggle<cr>
nmap <f12> :NERDTreeToggle<CR>

if has('multi_byte')
    if version >= 700
        " set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
        set listchars=tab:▸\ ,eol:¬
    else
        set listchars=tab:»\ ,trail:·,eol:¶,extends:>,precedes:<,nbsp:_
    endif
endif
nmap <leader>j :set list!<CR>

" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ "
" Coc settings
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ "
let g:coc_disable_startup_warning = 1

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> H :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
