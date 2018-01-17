" make vim more useful
set nocompatible
filetype off

" vundle!

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'dracula/vim'
Plugin 'junegunn/goyo.vim'
Plugin 'chrisbra/unicode.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mhinz/vim-signify'
Plugin 'moll/vim-node'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

call vundle#end()

filetype plugin indent on

" Syntax highlighting
set t_Co=256
syntax on
color dracula

" Local dirs
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" Set some shit
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

" Config -------------------

" FastEscape
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" General
augroup general_config
    autocmd!

    " speed up viewport scroll
    nnoremap <C-e> 3<C-e>
    nnoremap <C-y> 3<C-y>

    " Fast split resizing (+,-)
    if bufwinnr(1)
        map + <C-W>+
        map - <C-W>-
    endif

    " Better split switching
    " Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-H> <C-W>h
    map <C-L> <C-W>l

    " Sudo write (,W)
    noremap <leader>W :w !sudo tee %<CR>

    " Get output of shell cmds
    command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

    " Remap :W to :w
    command! W write

    " Hard things
    iabbrev >> →
    iabbrev << ←
    iabbrev ^^ ↑
    iabbrev VV ↓
    iabbrev aa λ

    " Clear last search (,qs)
    map <silent> <leader>qs <Esc>:noh<CR>

    " Yank from cursor to EOL
    nnoremap Y y$

    " Search and replace word under cursor (,*)
    nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
    vnoremap <leader>* "hy:%s/\V<C-r>h//<left>

    " Toggle folds (<Space>)
    nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>

    " toggle NERDtree
    map <leader>t :NERDTreeToggle<CR>

    " make the opening of the `.vimrc` file easier.
    nmap <leader>v :vsp $MYVIMRC<CR>

    " init prettier
    autocmd FileType javascript set formatpg=prettier\ --stdin
    autocmd BufWritePre *.js :normal gggqG

augroup END

" Filetypes-----------------------------

" C
augroup filetype_c
    autocmd!

    autocmd BufRead,BufNewFile *.[ch] let fname = expand('<afile>:p:h') . '/types.vim'
    autocmd BufRead,BufNewFile *.[ch] if filereadable(fname)
    autocmd BufRead,BufNewFile *.[ch]   exe 'so ' . fname
    autocmd BufRead,BufNewFile *.[ch] endif
augroup END

" JS
augroup filetype_javascript
    autocmd!

    let g:javascript_conceal = 1
augroup END

" JSON
augroup filetype_json
    autocmd!

    au BufRead,BufNewFile *.json set ft=json syntax=javascript
augroup END

" Markdown
augroup filetype_markdown
    autocmd!

    let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']
augroup END

" ZSH
augroup filetype_zsh
    autocmd!

    au BufRead,BufNewFile .zsh_rc,.functions,.commonrc set ft=zsh
augroup END

" Plugin Config--------------------------------------

" airlime.vim
augroup airline_config
    autocmd!

    let g:airline_powerline_fonts = 1
    let g:airline_enable_syntastic = 1
    let g:airline#extensions#tabline#buffer_nr_format = '%s '
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamecollapse = 0
    let g:airline#extensions#tabline#fnamemod = ':t'
augroup END

" syntastic.vim
augroup syntastic_config
    autocmd!

    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '⚠'
    let g:syntastic_ruby_checkers = ['mri', 'rubocop']
augroup END

" load local settings
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

