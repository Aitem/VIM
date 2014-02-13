" Base config
set ts=4
set autoindent
set background=dark
set lbr
set showcmd
set nocompatible     
set backspace=indent,eol,start
set wrap
set nobackup
set linebreak
set ruler
set smartindent
set cursorline
set foldmethod=manual
set noswapfile
set nobackup
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set nu!
let g:Powerline_symbols = 'fancy'

map <silent><F3> :NEXTCOLOR<cr>
map <silent><F4> :PREVCOLOR<cr> 


set cursorcolumn " highlight the current column
set cursorline

set omnifunc=csscomplete#CompleteCSS
filetype plugin on
set omnifunc=syntaxcomplete#Complete
let g:neocomplcache_enable_at_startup = 1

syntax on
filetype on
filetype plugin on
autocmd BufNewFile	*.spec	call SKEL_spec()
filetype indent on

" Стрелочки =)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" set uato search
:set incsearch
:set hlsearch


" Paste
inoremap <silent> <C-u> <ESC>u:set paste<CR>.:set nopaste<CR>gi

" Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set wildmenu
set wcm=<Tab>
menu Encoding.CP1251   :e ++enc=cp1251<CR>
menu Encoding.CP866    :e ++enc=cp866<CR>
menu Encoding.KOI8-U   :e ++enc=koi8-u<CR>
menu Encoding.UTF-8    :e ++enc=utf-8<CR>
map <F9> :emenu Encoding.<TAB>


au BufNewFile,BufRead *.info set filetype=info
au BufNewFile,BufRead *.module set filetype=php
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.install set filetype=php


" Abbr
abb ndoe node

" HOT Keys
imap <F11> <Esc>:set<Space>nu!<CR>a
nmap <F11> :set<Space>nu!<CR>
map <S-tab> :tabprevious<cr>
nmap <S-tab> :tabprevious<cr>
imap <S-tab> <ESC>:tabprevious<cr>i
map <tab> :tabnext<cr>
nmap <tab> :tabnext<cr>
imap <tab> <ESC>:tabnext<cr>i
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>


inoremap <h1> <h1><esc>maa</h1><esc>`aa
inoremap <h2> <h2><esc>maa</h2><esc>`aa
inoremap <h3> <h3><esc>maa</h3><esc>`aa
inoremap <ul> <ul><cr><tab><li><esc>maa</li><cr><backspace></ul><esc>`aa
inoremap <ol> <ol><cr><tab><li><esc>maa</li><cr><backspace></ol><esc>`aa
inoremap <li> <li><esc>maa</li><esc>`aa
inoremap <p> <p><esc>maa</p><esc>`aa
inoremap <div<space> <div<esc>maa></div><esc>`aa
abb <a <a<space>href="<esc>maa"></a><esc>`aa


" run file with PHP CLI (CTRL-M)
:autocmd FileType php noremap <F5> :w!<CR>:!/usr/bin/php %<CR>
" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-F5> :!/usr/bin/php -l %<CR>


nmap <F7> <Esc>:BufExplorer<cr>
vmap <F7> <esc>:BufExplorer<cr>
imap <F7> <esc>:BufExplorer<cr>

" F6 - предыдущий буфер
nmap <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i
"
" " F7 - следующий буфер
nmap <F8> :bn<cr>
vmap <F8> <esc>:bn<cr>i
imap <F8> <esc>:bn<cr>i

nmap <c-o> :NERDTree<cr>
vmap <c-N> <esc>:NERDTree<cr>i
imap <c-N> <esc>:NERDTree<cr>i

nmap <C-N>x :NERDTreeClose<cr>
vmap <C-N>x <esc>:NERDTreeClose<cr>i
imap <C-N>x <esc>:NERDTreeClose<cr>i



setlocal dictionary+=~/.vim/dictionaries/phpfunclist.dict
setlocal dictionary+=~/.vim/dictionaries/phpproto.dict
setlocal complete=.,w,b,u,t,i,k


let php_sql_query=1
let php_htmlInStrings=1

