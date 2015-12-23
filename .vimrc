set nocompatible
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
Plugin 'Shougo/neocomplete.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'pearofducks/ansible-vim'
Plugin 'kshenoy/vim-signature'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'powerman/vim-plugin-ruscmd'
Plugin 'niquola/vim-pg'
Plugin 'vim-scripts/git-log'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/csv.vim'

call vundle#end()            " required
filetype plugin on
filetype plugin indent on


set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']


let g:startify_session_dir = '~/.vim/session'
let g:startify_list_order = ['files', 'sessions']
let g:startify_custom_header =  map(split(system('fortune | cowsay -f apt'), '\n'), '"   ". v:val') + ['']

let g:ctrlp_working_path_mode = 'ra'


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
map <leader>n :!node %<cr>
map <leader>s :source %<cr>
map <leader>t :!mocha --compilers mocha --compilers coffee:coffee-script/register %<cr>






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
set t_Co=256
let g:solarized_termcolors=256
colorscheme railscasts 
"colorscheme seti 

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

"============== NEOCOMPLETE
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3


" Figutive
nnoremap <F3> :Gstatus<CR>
nnoremap <F4> :Gdiff<CR>
nnoremap <F5> :Gblame<CR>

set laststatus=2

let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='lucius'
let g:airline_detect_whitespace=0
let g:gitgutter_override_sign_column_highlight = 0

highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow


set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 14

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_ctrlp = 0
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction


call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
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
