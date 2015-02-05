set nocompatible

set t_Co=256
colorscheme zenburn
set background=dark
syntax on

set cursorline
set relativenumber

set autoindent
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

set pastetoggle=<F2>

set splitright
set splitbelow

set clipboard=unnamedplus
let g:latex_to_unicode_auto = 1

let g:C_CplusCompiler = 'clang++'
let g:C_UseTool_doxygen = 'yes' 

set list listchars=trail:·,eol:↵