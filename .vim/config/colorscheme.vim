" If you have vim >=8.0
if (has("termguicolors"))
     set termguicolors
endif

set colorcolumn=100
highlight ColorColumn ctermbg=Black ctermfg=DarkRed

colorscheme onehalfdark
set cursorline

"set background=dark
"let g:enable_italic_font = 1
"let g:hybrid_transparent_background = 1
"colorscheme hybrid_material

"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_italic = 1
"colorscheme gruvbox
"set background=dark

"colorscheme gruvbox
"let g:gruvbox_contrast_light = 'soft'
"let g:gruvbox_italic = 1

"colorscheme tender

"colorscheme onehalflight
"set cursorline
"let g:lightline.colorscheme 	 = 'onehalflight'
"
"colorscheme one
"set background=dark " for the dark version
"set background=light " for the light version
"let g:one_allow_italics = 1 " I love italic for comments

"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu
"
" set background=light
" colorscheme PaperColor

"colorscheme jellybeans
"let g:jellybeans_use_lowcolor_black = 1
"let g:jellybeans_use_term_italics = 1
"let g:jellybeans_use_gui_italics = 1

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

let g:terminal_ansi_colors = [
	\ '#2d3037', '#ab485f', '#45ac90', '#ab863b',
	\ '#407baf', '#756187', '#42939f', '#ccdddd',
	\ '#2d3037', '#ff597a', '#55ffcc', '#ffc03e', 
	\ '#4daeff', '#a683bc', '#51d6e5', '#ffffff']
