scriptencoding utf-8

" General
set autoread              " reload changes from disk
set autowriteall          " Writes on make/shell commands
set hidden                " Allow buffer switching without saving
set iskeyword+=$,@,-      " Add extra characters that are valid parts of variables
set lazyredraw            " Wait until actions are done to re-render text
set linespace=0           " No extra spaces between rows
set matchtime=1           " Time to show the match for
set nowrap                " Do not wrap long lines
set number                " Show line numbers
set report=0              " Always report changed lines
set scrolloff=5           " Minumum lines to keep above and below cursor
set showmatch             " Show matching brackets/parentthesis
set splitright            " Vertical splits to the right
set termguicolors         " Enable true colors in terminal
set updatetime=100        " Update swap file and CursorHold delay
set timeoutlen=700        " Timeout for keybindings
set ttimeoutlen=0         " Timeout for completing commands
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-,g- "

set ignorecase            " Case insensitive search
set smartcase             " ... but case sensitive when uc present

" Mouse
set mouse=a               " Mouse enabled in all modes
set mousehide             " Hide the mouse cursor while typing

" Completion
set pumheight=20          " Avoid the pop up menu occupying the whole screen
set completeopt=noinsert,menuone,noselect
set shortmess+=c

" Indentation
set expandtab             " Tabs are spaces, not tabs
set shiftwidth=2          " Use indents of 2 spaces
set softtabstop=2         " Let backspace delete indent
set tabstop=2             " An indentation every four columns

set undofile              " Persistent undo
set undolevels=1000       " Maximum number of changes that can be undone
set undoreload=10000      " Maximum number lines to save for undo on a buffer reload

" Command mode
set noshowmode              " Hide current mode in command-line (shown by lightline)
set wildmode=list:longest   " Use emacs-style tab completion in command mode

set fillchars=vert:│,stl:\ ,stlnc:\ 

" Encoding & file formats
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fileformats=unix,dos,mac
set termencoding=utf-8
set viewoptions=cursor,folds,slash,unix

" Backups
set directory=/tmp//,.
set backupdir=/tmp//,.

" Folds
set foldenable
set foldmarker={,}
set foldlevel=0
set foldmethod=marker
set foldlevelstart=99

" netrw
let g:netrw_altfile = 1   " <Ctrl-^> should go to the last file, not to netrw.

" Mimic behavior from D, C
nnoremap Y y$

vnoremap < <gv
vnoremap > >gv

augroup config#basic
  autocmd!
  " Reload file on focus
  autocmd FocusGained * :checktime
  " Don't format when adding lines with o/O
  autocmd BufNewFile,BufEnter * set formatoptions-=o
augroup END

