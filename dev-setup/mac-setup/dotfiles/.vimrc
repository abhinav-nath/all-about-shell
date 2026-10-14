scriptencoding utf-8
set encoding=utf-8

" file location: ~/.vimrc

set nocompatible              " be iMproved, required
" filetype off                  " required

" mouse navigation
set mouse=a

set title
" highlighting
" set relativenumber
set number
set ruler
syntax on
set background=dark
set cursorline
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
:highlight search guifg=yellow guibg=darkred

" tabbing
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set expandtab
set smarttab
set smartindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set bs=2

set undofile
set undodir=/tmp

set nobackup
" https://en.parceljs.org/hmr.html#safe-write
set backupcopy=yes

set wildmode=list:longest,full
set wildmenu

" folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" All of your Plugins must be added before the following line
filetype plugin indent on    " required

let g:solarized_termcolors=256

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
