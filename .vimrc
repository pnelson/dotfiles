set nocompatible

set runtimepath+=$GOROOT/misc/vim
set runtimepath+=$HOME/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'w0ng/vim-hybrid'

" enable filetype detection
filetype plugin indent on

" miscellaneous
set backspace=indent,eol,start      " enable backspace for everything
set colorcolumn=+0                  " draw a subtle line at text width
set cursorline                      " highlight the full line of the cursor
set encoding=utf-8                  " use utf-8 in buffers, registers, etc
set laststatus=2                    " always show the status line
set lazyredraw                      " don't update screen when executing macros
set linespace=0                     " make font look a bit better
set list lcs=tab:——,nbsp:·,trail:·  " show whitespace
set modelines=0                     " disable line checking on set commands
set number                          " show absolute line number on current line
set scrolloff=3                     " minimum lines at top/bottom when scrolling
set noshowmode                      " disable mode message since already in status
set spelllang=en_us                 " spell check with american english
set textwidth=80                    " column used for drawing cursorcolumn
set title                           " use filename in window title
set ttimeoutlen=50                  " fix escape key lag
set t_vb=                           " stop the flashing (needs visualbell)
set wildmenu                        " enhanced cmd line completion
set visualbell                      " stop the beep

" backup swap files
set backup
set backupdir=$HOME/.vim/tmp
set backupskip=/tmp/*
set directory=$HOME/.vim/tmp
set writebackup

" tabs
set autoindent                  " copy indent from previous line
set expandtab                   " replace tabs with spaces
set shiftwidth=2                " spaces for autoindenting
set smarttab                    " <BS> removes shiftwidth worth of spaces
set softtabstop=2               " spaces for editing, e.g. <Tab> or <BS>
set tabstop=2                   " spaces for <Tab>

" searching
set hlsearch                    " highlight search results
set ignorecase                  " case insensitive searching
set incsearch                   " search whilst typing
set smartcase                   " override ignorecase if upper case typed

" folding
set foldignore=                 " don't ignore anything when folding
set foldlevelstart=99           " no folds closed on open
set foldmethod=marker           " collapse code using markers

" colors
set t_Co=256
let g:hybrid_use_Xresources = 1
colorscheme hybrid
syntax on

" airline
let g:airline_theme = 'wombat'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_y = '%{printf("%s%s",&fenc,&ff!="unix"?":".&ff:"")}'
let g:airline_section_z = '%l:%c'
let g:airline_mode_map = {
\   '__' : '-',
\   'n'  : 'N',
\   'i'  : 'I',
\   'R'  : 'R',
\   'c'  : 'C',
\   'v'  : 'V',
\   'V'  : 'V',
\   '' : 'V',
\   's'  : 'S',
\   'S'  : 'S',
\   '' : 'S',
\ }

" hotkeys
let mapleader = ','

nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk

" filetype aliases
autocmd BufRead,BufNewFile *.md set filetype=markdown

" filetype settings
autocmd FileType go setlocal ts=2 sw=2 sts=2 noexpandtab
autocmd FileType markdown setlocal ts=4 sw=4 sts=4 formatoptions-=t
