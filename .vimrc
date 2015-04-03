set nocompatible

set runtimepath+=$XDG_DATA_HOME/vim/vundle
call vundle#begin('$XDG_DATA_HOME/vim')

Plugin 'gmarik/vundle'

Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

Plugin 'baskerville/vim-sxhkdrc'
Plugin 'fatih/vim-go'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/nginx.vim'

call vundle#end()

" enable filetype detection
filetype plugin indent on

" miscellaneous
set backspace=indent,eol,start      " enable backspace for everything
set colorcolumn=+1                  " draw a subtle line at text width
set cursorline                      " highlight the full line of the cursor
set encoding=utf-8                  " use utf-8 in buffers, registers, etc
set fillchars+=vert:\               " show space instead of pipe on split
set formatoptions-=t                " disable auto-wrap text using textwidth
set laststatus=2                    " always show the status line
set lazyredraw                      " don't update screen when executing macros
set linespace=0                     " make font look a bit better
set list lcs=tab:——,nbsp:·,trail:·  " show whitespace
set modelines=0                     " disable line checking on set commands
set number                          " show absolute line number on current line
set scrolloff=3                     " minimum lines at top/bottom when scrolling
set noshowmode                      " disable mode message since already in status
set noswapfile                      " disable swap files
set spelllang=en_us                 " spell check with american english
set textwidth=79                    " column used for drawing cursorcolumn
set title                           " use filename in window title
set ttimeoutlen=50                  " fix escape key lag
set t_vb=                           " stop the flashing (needs visualbell)
set wildignore+=*/tmp/*             " exclude from autocomplete
set wildmenu                        " enhanced cmd line completion
set viminfo=                        " disable the viminfo file
set visualbell                      " stop the beep

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
syntax enable
set background=light
let base16colorspace=256
colorscheme base16-solarized
highlight! default link Todo Comment
if &background == 'dark'
  highlight SpecialKey ctermfg=18
else
  highlight SpecialKey ctermfg=21
endif

" plugins
let g:airline_theme = 'base16'
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

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_user_command = 'ack -f %s'

let g:go_fmt_command = 'goimports'

" hotkeys
let mapleader = ','

cmap w!! w !sudo tee > /dev/null %

nnoremap j gj
nnoremap k gk

vnoremap > >gv
vnoremap < <gv

nnoremap H ^
nnoremap L $

nnoremap Y y$

nnoremap <leader><space> :nohlsearch<cr>

nnoremap <leader>a :Ack
nnoremap <leader>A :AckFromSearch<cr>

" filetype settings
augroup go
  autocmd!
  autocmd FileType go setlocal ts=2 sw=2 sts=2 noexpandtab
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <Leader>s <Plug>(go-implements)
  autocmd FileType go nmap <Leader>e <Plug>(go-rename)
  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>b <Plug>(go-build)
  autocmd FileType go nmap <leader>t <Plug>(go-test)
  autocmd FileType go nmap <leader>c <Plug>(go-coverage)
  autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
  autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)
  autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
  autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
  autocmd FileType go nmap <Leader>gb <Plug>(go-doc-browser)
augroup end

augroup markdown
  autocmd!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd FileType markdown setlocal ts=4 sw=4 sts=4 formatoptions+=t
augroup end

augroup nginx
  autocmd!
  autocmd BufRead,BufNewFile /etc/nginx/* if &ft == '' | setfiletype nginx | endif
augroup end
