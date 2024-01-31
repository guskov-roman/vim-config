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
    " Plug 'ervandew/supertab'

	Plug 'svermeulen/vim-easyclip'
    Plug 'dkprice/vim-easygrep'

	Plug 'tpope/vim-fugitive'
	Plug 'mileszs/ack.vim'
	Plug 'tpope/vim-commentary'

 	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

    
    " Plug 'Konfekt/FastFold'
    " Plug 'tmhedberg/SimpylFold'

    " Airline status line plugins
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'

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

	" C++ Development
    " Plug 'cdelledonne/vim-cmake'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ################################### cmake and coc plugins ####################################################

" let g:cmake_link_compile_commands = 1
" let g:cmake_build_dir_location = '../build'

" set updatetime=300

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved
" set signcolumn=yes

" " Use tab for trigger completion with characters ahead and navigate
" " NOTE: There's always complete item selected by default, you may want to enable
" " no select by `"suggest.noselect": true` in your configuration file
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" " Make <CR> to accept selected completion item or notify coc.nvim to format
" " <C-g>u breaks current undo, please make your own choice
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window
" nnoremap <silent> K :call ShowDocumentation()<CR>

" function! ShowDocumentation()
"   if CocAction('hasProvider', 'hover')
"     call CocActionAsync('doHover')
"   else
"     call feedkeys('K', 'in')
"   endif
" endfunction

" " Highlight the symbol and its references when holding the cursor
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming
" nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)


" nmap <leader>cg :CMakeGenerate<cr>
" nmap <leader>cb :CMakeBuild<cr>
" nmap <leader>cc :CMakeClean<cr>
" nmap <leader>cq :CMakeClose<cr>
