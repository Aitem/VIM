set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'majutsushi/tagbar'
Plugin 'lukaszkorecki/CoffeeTags'
Plugin 'Valloric/MatchTagAlways'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'git@github.com:scrooloose/nerdtree.git'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin on
filetype plugin indent on


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
" Search
set incsearch
set hlsearch
" Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set wildmenu
set wcm=<Tab>


map <F2> <Esc>:Tlist<CR><C-W>h<C-W>s:VTreeExplore<CR>:set nonu<CR><C-W>l
nmap <F2> :TagbarToggle<CR> 

let Tlist_Use_Right_Window   = 1
set runtimepath^=~/.vim/bundle/ctrlp.vim
call pathogen#infect()
syntax enable
filetype plugin indent on


set omnifunc=csscomplete#CompleteCSS
set omnifunc=syntaxcomplete#Complete

let g:neocomplcache_enable_at_startup = 1
let g:CoffeeAutoTagFile="~/.tags"

autocmd BufNewFile	*.spec	call SKEL_spec()

" Paste
inoremap <silent> <C-u> <ESC>u:set paste<CR>.:set nopaste<CR>gi

au BufNewFile,BufRead *.info set filetype=info
au BufNewFile,BufRead *.module set filetype=php
au BufNewFile,BufRead *.log set filetype=httplog
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.install set filetype=php
au BufNewFile,BufRead *.slim set filetype=slim

let mapleader = ","
nnoremap <leader>m zfat

" Abbr
abb ndoe node

" HOT Keys
map <S-tab> :tabprevious<cr>
nmap <S-tab> :tabprevious<cr>
map <tab> :tabnext<cr>
nmap <tab> :tabnext<cr>
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>


setlocal complete=.,w,b,u,t,i,k


autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Auto start neerd tree
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()
autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd BufNewFile,BufRead *.slim set cursorcolumn

" Colors
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

command E Ex
map \e :%Eval<cr>
