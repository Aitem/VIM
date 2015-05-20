set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"
Bundle 'slim-template/vim-slim.git'
Bundle 'jlanzarotta/bufexplorer'
" Plugin 'https://github.com/tpope/vim-rails'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'kchmck/vim-coffee-script'
Plugin 'git@github.com:scrooloose/nerdtree.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




" Base config
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
set softtabstop=2
set tabstop=2
set ts=2
set shiftwidth=2
set nu!
set autochdir
set t_Co=256
set smarttab

set runtimepath^=~/.vim/bundle/ctrlp.vim

"map <F2> <Esc>:Tlist<CR><C-W>h<C-W>s:VTreeExplore<CR>:set nonu<CR><C-W>l
nmap <F2> :TagbarToggle<CR> 
let Tlist_Use_Right_Window   = 1

execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

map <silent><F3> :NEXTCOLOR<cr>
map <silent><F4> :PREVCOLOR<cr> 


set cursorline

set omnifunc=csscomplete#CompleteCSS
filetype plugin on
filetype plugin indent on
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
au BufNewFile,BufRead *.log set filetype=httplog
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.install set filetype=php
au BufNewFile,BufRead *.slim set filetype=slim


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

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()
autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd BufNewFile,BufRead *.slim set cursorcolumn
set nocursorcolumn

 if $COLORTERM == 'gnome-terminal' 
    set term=gnome-256color 
endif 

set t_Co=256
let g:solarized_termcolors=256
colorscheme railscasts 

fu! SeeTab()
  if !exists("g:SeeTabEnabled")
    let g:SeeTabEnabled = 0
  end
  if g:SeeTabEnabled==0
    syn match leadspace /^\s\+/ contains=syntab
    exe "syn match syntab /\\s\\{" . &sw . "}/hs=s,he=s+1 contained"
    hi syntab guibg=Grey
    let g:SeeTabEnabled=1
  else
    syn clear leadspace
    syn clear syntab
    let g:SeeTabEnabled=0
  end
endfunc
com! -nargs=0 SeeTab :call SeeTab()

set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

command E Ex
