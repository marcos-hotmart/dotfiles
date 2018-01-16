set nocompatible
filetype off

" vundle!
" https://github.com/VundleVim/Vundle.vim

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'dracula/vim'

call vundle#end()

filetype plugin indent on

syntax on
color dracula

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

set autoindent
set backspace=indent
set backspace+=eol
set backspace+=start

set clipboard=unnamed
if has("unnamedplus")
    set clipboard+=unnamedplus
end

set cursorline
set encoding=utf-8 nobomb
set history=5000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set listchars=tab:▸\
set listchars+=trail:·
set listchars+=eol:↴
set listchars+=nbsp:_
set magic
set mousehide
set noerrorbells
set nojoinspaces
set nostartofline
set number
set numberwidth=5
set report=0
set ruler
set scrolloff=5
set shortmess=aAItW
set showcmd
set showmode
set spelllang=en_us
set smartcase
set synmaxcol=2500
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set ttyfast
set undofile
set virtualedit=all
set visualbell
set t_vb=
set wildmenu
set winminheight=0

" toggle NERDtree
map <leader>t :NERDTreeToggle<CR>

" make the opening of the `.vimrc` file easier.
nmap <leader>v :vsp $MYVIMRC<CR>

" sudo write
map <leader>W :w !sudo tee %<CR>

" load local settings
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif
