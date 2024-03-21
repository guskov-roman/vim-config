"set colorcolumn=100
"highlight ColorColumn ctermbg=Black ctermfg=DarkRed

" set background=dark
" let g:enable_italic_font = 1
" let g:hybrid_transparent_background = 1
" colorscheme hybrid_material

" colorscheme gruvbox
" set background=dark
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_italic = 1

" colorscheme gruvbox
" let g:gruvbox_contrast_light = 'soft'
" let g:gruvbox_italic = 1

" colorscheme tender

" colorscheme onehalflight
" colorscheme onehalfdark
"
" colorscheme onedark


" colorscheme one
" set background=dark  
" set background=light 
" let g:one_allow_italics = 1 " I love italic for comments

" set background=dark
" set background=light
" colorscheme PaperColor

" colorscheme jellybeans
" let g:jellybeans_use_lowcolor_black = 1
" let g:jellybeans_use_term_italics = 1
" let g:jellybeans_use_gui_italics = 1

" colorscheme everforest
" " set background=light
" set background=dark
" let g:everforest_better_performance=1
" " 'hard', 'medium'(default), 'soft'
" let g:everforest_background='soft' 

let g:oceanic_italic_comments = 1
let g:oceanic_bold = 0
colorscheme oceanicnext

" let ayucolor="dark" " dark light mirage
" colorscheme ayu


" colorscheme gotham256

" ##############################################################################################
"  Terminal color settings 
" ##############################################################################################

" let g:terminal_ansi_colors = [
"     \'#eeeeee', '#af0000', '#008700', '#5f8700',
"     \'#0087af', '#878787', '#005f87', '#444444',
"     \'#bcbcbc', '#d70000', '#d70087', '#8700af',
"     \'#d75f00', '#d75f00', '#005faf', '#005f87' ]

" let g:terminal_ansi_colors = [
"      \'#000000', '#F92672', '#BAED00', '#EBCE00', 
"      \'#00BEF3', '#BAA0F0', '#71C0ED', '#EAEAEA',
"      \'#333333', '#FA397E', '#C1F600', '#FFE000',
"      \'#00C2F9', '#C6ABFF', '#79CEFF', '#FFFFFF'] 

" My Default colors
let g:terminal_ansi_colors = [
	\ '#2d3037', '#ab485f', '#45ac90', '#ab863b',
	\ '#407baf', '#756187', '#42939f', '#ccdddd',
	\ '#2d3037', '#ff597a', '#55ffcc', '#ffc03e', 
	\ '#4daeff', '#a683bc', '#51d6e5', '#ffffff']
"
"
" let g:terminal_ansi_colors = [
"   \'#282828', '#CC241D', '#98971A', '#D79921',
"   \'#458588', '#B16286', '#689D6A', '#D65D0E',
"   \'#fb4934', '#b8bb26', '#fabd2f', '#83a598',
"   \'#d3869b', '#8ec07c', '#fe8019', '#FBF1C7' ]

" highlight Terminal guibg='#282828'
" highlight Terminal guifg='#ebdbb2'

 " let g:terminal_ansi_colors = [
 "    \ '#4e4e4e', '#d68787', '#5f865f', '#d8af5f',
 "    \ '#85add4', '#d7afaf', '#87afaf', '#d0d0d0',
 "    \ '#626262', '#d75f87', '#87af87', '#ffd787',
 "    \ '#add4fb', '#ffafaf', '#87d7d7', '#e4e4e4']
 
" ##############################################################################################
"  Lightline settings 
" ##############################################################################################
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

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

let g:lightline#bufferline#enable_devicons = 1
