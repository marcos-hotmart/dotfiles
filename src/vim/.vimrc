set nocompatible
syntax on
colorscheme onedark

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undordir=~/.vim/undo

set autoindent
set backspace=indent
set backspace+=eol
set backspace+=start

set clipboard=unnamed
if has("unnamedplus)
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

" vundle!
" https://github.com/VundleVim/Vundle.vim

filetype off

set runtimepath+=~/.vim/plugins/Vundle.vim

call vundle#begin("~/.vim/plugins")
    Plugin 'VundleVim/Vundle.vim'

    Plugin 'ap/vim-css-color'
    Plugin 'chrisbra/unicode.vim'
    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'isRuslan/vim-es6'
    Plugin 'jelera/vim-javascript/syntax'
    Plugin 'moll/vim-node'
    Plugin 'mtscout6/syntastic-local-eslint.vim'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/syntastic'

call vundle#end()

filetype on

" plugins: syntastic

let g:syntastic_javascript_checkers = [ 'eslint' ]

let g:syntastic_mode_map = {
    \ "active_filetypes": [],
    \ "mode": "passive",
    \ "passive_filetypes": []
\}

" toggle NERDtree
map <leader>t :NERDTreeToggle<CR>

" toggle syntastic
nmap <leader>ts :SyntasticToggleMode \| w<CR>


" make the opening of the `.vimrc` file easier.
nmap <leader>v :vsp $MYVIMRC<CR>

" sudo write
map <leader>W :w !sudo tee %<CR>

" load local settings
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif
