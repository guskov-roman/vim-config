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
    " Plug 'jeetsukumaran/vim-buffergator'
    Plug 'voldikss/vim-floaterm'

	Plug 'svermeulen/vim-easyclip'
    Plug 'dkprice/vim-easygrep'

	Plug 'tpope/vim-fugitive'
	Plug 'mileszs/ack.vim'
	Plug 'tpope/vim-commentary'

 	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

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
    Plug 'cdelledonne/vim-cmake'
    " Plug 'Valloric/YouCompleteMe'

call plug#end()
