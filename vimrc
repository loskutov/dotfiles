set nocompatible

"set t_Co=256                                               " 256 color mode
colorscheme zenburn
set background=dark
syntax on

set cursorline
set colorcolumn=100
set relativenumber
set number
set scrolloff=1

set autoindent
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

"set pastetoggle=<F2>
set clipboard=unnamedplus                                  " X clipboard as default one
set history=1000

set splitright
set splitbelow

let g:latex_to_unicode_auto=1
set formatoptions+=j                                       " suck it bitch

let g:C_CplusCompiler='clang++'
let g:C_UseTool_doxygen='yes'

autocmd BufNewFile,BufReadPost *.md set filetype=markdown  " associate *.md with markdown
autocmd BufNewFile,BufReadPost *.asm set filetype=nasm     " I usually use NASM syntax, so I’d like nvim to highlight it properly

set list listchars=tab:▸\ ,trail:·,eol:↵
let g:airline_powerline_fonts = 1
set laststatus=2
set wildmenu
set hlsearch
nnoremap <silent> <ESC> :noh<RETURN>
"noremap <BS> :bprev<CR>
"noremap <C-l> :bnext<CR>
