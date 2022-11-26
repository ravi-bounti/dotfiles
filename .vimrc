set number
syntax on
autocmd Filetype gitcommit setlocal textwidth=72
syntax enable
filetype plugin indent on
set mouse=a
map <ScrollWheelDown> j
map <ScrollWheelUp> k

" call plug#begin()
"Plug 'ghifarit53/tokyonight-vim'
"call plug#end()

" set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
"colorscheme tokyonight

set showcmd
set cursorline
filetype indent on
set showmatch

