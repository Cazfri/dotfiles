" Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jiangmiao/auto-pairs'

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

" Syntax on
syntax on
" Auto reload files
set autoread
" Line numbers
set number
" current position
set ruler
" Mouse mode on
set mouse=a
" Autoindent and smartindent
set ai
set si
" Use English
let $LANG='en'
set langmenu=en
" Use the wildmenu
set wildmenu
" Ignore compiled files]
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
" Highlight when searching, and scroll through searches
set hlsearch
set incsearch
" Pls no awful error notifications
set noerrorbells
set novisualbell
" Keep some space between the bottom of screen and the cursor
set scrolloff=3
" Always see the status bar
set laststatus=2
" Automatically reload ':so $MYVIMRC' if there are changes to $MYVIMRC
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
" Use spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
