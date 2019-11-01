syntax on
set bg=dark

set number
set nowrap

" Pathogen
execute pathogen#infect()

" FZF
" If installed using git
"set rtp+=~/.fzf

" # as leader
let mapleader = "#"

" dealing with tabs and indentation
filetype indent plugin on
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set shiftwidth=4

let python_highlight_all=1

" UI improvements
set wildmenu
set showmatch
set noerrorbells

set cursorline          " highlight current line
set showcmd

" dealing with syntax
syntax enable

" searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>f :FZF

" saving
nnoremap <leader>w :w<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>q :q<CR>

" tab completion
let g:pydiction_location = '/home/sent/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 3

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

