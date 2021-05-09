" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
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
" set visualbell
set belloff=all 

" https://vi.stackexchange.com/a/2163
set backspace=indent,eol,start

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
"  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set ttymouse=xterm2
set mouse=a

" -- tab size + tab to space expand
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
filetype on
filetype plugin indent on    " enable loading indent file for filetype

" -- cursorline highlight
hi CursorLine   cterm=none ctermbg=darkyellow
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * set cursorline
    au WinLeave * set nocursorline
augroup END

" -- color scheme
colorscheme koehler
"darkblue, delek, desert, koehler
"au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"

" -- 80 chars
"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

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
set hlsearch                " Highlight searches by default.
nnoremap <space> :nohlsearch<cr> " Hide search matches
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" -- switching between errors
map - :cprev<CR>
map + :cnext<CR>

" -- man pages
runtime! ftplugin/man.vim
"runtime! ftplugin/make.vim

" -- file extensions
au BufNewFile,BufRead *.gp set filetype=gnuplot

" -- Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

