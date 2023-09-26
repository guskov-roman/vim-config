" if exists('$TMUX')
"     " tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
"     let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
"     let &t_SR .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
"     let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
"     autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
" else
"     let &t_SI .= "\<Esc>[6 q"
"     let &t_SR .= "\<Esc>[4 q"
"     let &t_EI .= "\<Esc>[2 q"
"     autocmd VimLeave * silent !echo -ne "\033[0 q"
" endi
"
let &t_SI .= "\<Esc>[6 q"
let &t_SR .= "\<Esc>[4 q"
let &t_EI .= "\<Esc>[2 q"
autocmd VimLeave * silent !echo -ne "\033[0 q"
 

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
"nmap <leader>b :BuffergatorToggle<CR>

"Clipboard settings. Ctrl-X and Ctrl-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

"Ctrl-C and CTRL-Insert are Copy
vnoremap <C-C> 	    "+y
vnoremap <C-Insert> "+y

"Ctrl-V and SHIFT-Insert are Paste
map <C-V>       "+gP
map <S-Insert>  "+gP
cmap <C-V>      <C-R>+
cmap <S-Insert> <C-R>+

vmap <Tab> >gv
vmap <S-Tab> <gv

noremap r <C-R>

nnoremap <Leader>ag :Ag<Space>
"Ctrl + s for save on command and insert mode (must add in .bashrc: stty -ixon)
map <C-s> :write<CR>
imap <C-s> <esc>:write<cr>

map <C-f> :Files<CR>
imap <C-f> <esc>:Files<cr>

" Split window key mapping
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>

"Turn highlighting off till next search
map <silent> <leader>/ :nohlsearch<cr>

nmap <C-E> :NERDTreeToggle<CR>
"nmap <C-0> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
