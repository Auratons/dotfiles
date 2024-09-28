" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Stop stuping windows beeping
set belloff=all 

" Use system clipboard for yanking
set clipboard^=unnamed

" https://vi.stackexchange.com/a/2163
set backspace=indent,eol,start

set showcmd	     " Show (partial) command in status line.
set showmatch    " Show matching brackets.
set showmode     " Show the mode you are on the last line.
set ignorecase   " Do case insensitive matching
set smartcase    " Do smart case matching
set incsearch    " Incremental search
set autowrite    " Automatically save before commands like :next and :make
set hidden       " Hide buffers when they are abandoned
set mouse=a      " Enable mouse usage (all modes)
set hlsearch     " Highlight searches by default.
set history=1000 " Set history, default number is 20.
set tabstop=4
set shiftwidth=4
set expandtab
inoremap <S-Tab> <Esc>:set noexpandtab<CR>i<right>	<Esc>:set expandtab<CR>i<right>
"inoremap <CR> <Esc>:set noexpandtab<CR>i<right><CR>x<Esc>:set expandtab<CR>Di<right>

" -- indentization
set cindent
set smartindent
set autoindent
set fo+=cro          " continue comments on new line (in various insertions)
set nu               " line numbering
set modeline

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" -- color scheme
" https://github.com/kaicataldo/material.vim
colorscheme material

" -- show + remove whitespace
nmap <c-l> :set list! list?<cr> " show whitespace
autocmd FileType c,cc,h,hpp,cpp,php,tex,gp,plt autocmd BufWritePre <buffer> :%s/\([^ \t\r\n]\+\)\s\+$/\1/e

" -- folding
"set foldmethod=syntax
"nnoremap <F9> za
"nnoremap <F10> zi

" -- per project settings
set exrc
set secure

" -- searching + replacing
nnoremap <space> :nohlsearch<cr> " Hide search matches
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" -- switching between errors
map - :cprev<CR>
map + :cnext<CR>

" -- file extensions
au BufNewFile,BufRead *.gp set filetype=gnuplot

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

