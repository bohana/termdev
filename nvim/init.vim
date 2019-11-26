syntax on
set bg=dark

set number
set nowrap

" # as leader
let mapleader = "#"

" dealing with tabs and indentation
filetype indent plugin on
set tabstop=4
set softtabstop=4
set expandtab
set autoindent

" move cwd to last opened file
set autochdir

" Python host progs - disable py2; use py3 from path
let g:python_host_prog=""
let g:python3_host_prog="python"

let python_highlight_all=1

" avoid vim ESC key delays
" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0

" UI improvements
set wildmenu
set showmatch
set noerrorbells

set showcmd

" dealing with syntax
syntax enable

" searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nnoremap <leader><space> :nohlsearch<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>q :q<CR>

" window navigation
nnoremap <leader>1 <C-w>w

" Tab navigation
nnoremap <leader>tt :tabnext<CR>

" Tidy up white spaces
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

nnoremap <leader>s :call <SID>StripTrailingWhitespaces()<CR>

" plugins

call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'

Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'

Plug 'sbdchd/neoformat'

Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

call plug#end()

"
" Plugin configuration
"

" Unified color scheme (default: dark)
colo seoul256

" neoformat (requires yapf)
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

let g:neoformat_enabled_python = ['yapf']


augroup fmt
        autocmd!
        autocmd BufWritePre *.py undojoin | Neoformat
augroup END


" auto completion too slow for large modules
let g:jedi#popup_on_dot = 0

" pymode in python3
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 100
let g:pymode_indent = 1
