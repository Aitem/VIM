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


map <silent><F3> :NEXTCOLOR<cr>
map <silent><F4> :PREVCOLOR<cr> 


set cursorcolumn " highlight the current column
set cursorline

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
map <F8> :emenu Encoding.<TAB>


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


