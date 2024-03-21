" Set cursor line style

let &t_SI .= "\<Esc>[6 q"
let &t_SR .= "\<Esc>[4 q"
let &t_EI .= "\<Esc>[2 q"
autocmd VimLeave * silent !echo -ne "\033[0 q"
 
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

let g:lt_quickfix_list_toggle_map = '<leader>h'

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
"
nnoremap gm m
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

" nnoremap <Leader>ag :Ag<Space>
"Ctrl + s for save on command and insert mode (must add in .bashrc: stty -ixon)
map <C-s> :write<CR>
imap <C-s> <esc>:write<cr>

" Split window key mapping
nmap <silent> <A-Right> :call WinMove('l')<CR>
nmap <silent> <A-Up> :call WinMove('k')<CR>
nmap <silent> <A-Down> :call WinMove('j')<CR>
nmap <silent> <A-Left> :call WinMove('h')<CR>

map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove (key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key, '[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

"Turn highlighting off till next search
map <silent> <leader>/ :nohlsearch<cr>
" map <leader>f :Files<CR>
" imap <leader>f <esc>:Files<cr>
map <C-f> :Files<CR>
imap <C-f> <esc>:Files<cr>

map <leader>f :Grep<Space>
imap <leader>f <esc>:Grep<Space>
map <F3> :cn<CR>
map <F4> :cp<CR>

nmap <F12> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

nnoremap <space> za
nnoremap <DEL> "_x
vnoremap <DEL> "_x
