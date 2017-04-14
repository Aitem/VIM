filetype off

set rtp+=~/.vim/bundle/vim-vundle/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'digitaltoad/vim-jade'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'pearofducks/ansible-vim'
Plugin 'kshenoy/vim-signature'
Plugin 'airblade/vim-gitgutter'
Plugin 'powerman/vim-plugin-ruscmd'
Plugin 'niquola/vim-pg'
Plugin 'vim-scripts/git-log'
Plugin 'liunx/Vimarok'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/csv.vim'
Plugin 'rking/ag.vim'
Plugin 'mbbill/undotree'
Plugin 'hashivim/vim-terraform.git'
Plugin 'fatih/vim-go'
Plugin 'gcmt/taboo.vim'
Plugin 'dhruvasagar/vim-table-mode'

Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


call vundle#end()            " required
filetype plugin on
filetype plugin indent on

set shell=/bin/bash
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#enable_at_startup = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']


let g:startify_session_dir = '~/.vim/session'
let g:startify_list_order = ['files', 'sessions']
let g:startify_custom_header =  map(split(system('fortune | cowsay -f apt'), '\n'), '"   ". v:val') + ['']

let g:ctrlp_working_path_mode = 'ra'


" Base config
set guioptions-=e
set autoindent
set background=dark
set lbr
set showcmd
set backspace=indent,eol,start
set wrap
set nobackup
set linebreak
set ruler
set smartindent
set cursorline
set foldmethod=manual
set foldlevel=20
set noswapfile
set nobackup
set expandtab
set softtabstop=2
set tabstop=2
set ts=2
set shiftwidth=2
" set nu!
set autochdir
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

nnoremap <silent> <F11> :YRShow<CR>
nnoremap <F6> :set invpaste paste?<CR>
set pastetoggle=<F6>
set showmode

nmap <F2> :TagbarToggle<CR>

let Tlist_Use_Right_Window   = 1
call pathogen#infect()
syntax enable
filetype plugin indent on

autocmd BufNewFile	*.spec	call SKEL_spec()

" Paste
inoremap <silent> <C-u> <ESC>u:set paste<CR>.:set nopaste<CR>gi

au BufNewFile,BufRead *.info set filetype=info
au BufNewFile,BufRead *.module set filetype=php
au BufNewFile,BufRead *.log set filetype=httplog
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.install set filetype=php
au BufNewFile,BufRead *.slim set filetype=slim

" Leader
let mapleader = ","
map <leader>m :SignatureListMarks<cr>
map <leader>n :NERDTreeToggle<cr>
map <leader>s :source %<cr>
map <leader>l :%s/\s\+$//<cr>
map <leader> :%s/\s\+$//<cr>
map <leader>t :RunTests<cr>
" Golang
let g:go_term_mode = "split"
au FileType go nmap <leader>r <Plug>(go-run-tab)
au FileType go nmap <leader>s <Plug>(go-run-split)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t :!go test -v<CR>
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType clj nmap <leader>t :RunTests<cr>

nmap <silent> <leader>sv :so $MYVIMRC<CR>

" map <leader>t :!mocha --compilers mocha --compilers coffee:coffee-script/register %<cr>
map tt :RunTests<cr>
map tr :TabooRename

" Tabs switch
map <S-tab> :tabprevious<cr>
nmap <S-tab> :tabprevious<cr>
map <tab> :tabnext<cr>
nmap <tab> :tabnext<cr>
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>

"autocmd VimEnter * call StartUp()
autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd BufNewFile,BufRead *.slim set cursorcolumn

" Colors
if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
endif
let g:solarized_termcolors=256
colorscheme railscasts
"colorscheme seti

hi TabLineFill term=bold cterm=bold ctermbg=0

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
cnoreabbrev W w
cnoreabbrev Qa qa
cnoreabbrev Qa! qa!
cnoreabbrev Q q


:vmap R :!psql -e<enter>

map <F9> :!psql -d nsi > mmedorgtype.json -e<enter>

" Figutive
nnoremap <F3> :Gstatus<CR>
nnoremap <F4> :Gdiff<CR>
nnoremap <F5> :Gblame<CR>

set laststatus=2

highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow


set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 14

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction


call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('go', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('clj', 'blue', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

let NERDTreeIgnore = ['\.retry$']

"" Auto start neerd tree
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * if !argc() | NERDTree | endif

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif


vnoremap // y/<C-R>"<CR>
