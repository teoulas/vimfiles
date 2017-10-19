" Required by vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Required by vundle
Bundle 'gmarik/vundle'

" Custom bundle list
Bundle "mileszs/ack.vim"
Bundle "jlanzarotta/bufexplorer"
Bundle "ctrlpvim/ctrlp.vim"
" Bundle "cucumber.zip"
Bundle "endwise.vim"
Bundle "fugitive.vim"
Bundle "tpope/vim-haml"
Bundle "othree/html5.vim"
Bundle "The-NERD-tree"
Bundle "tpope/vim-rails"
Bundle "surround.vim"
Bundle "scrooloose/syntastic"
" Bundle "tpope/vim-bundler"
Bundle "vim-coffee-script"
Bundle "itspriddle/vim-jquery"
" Bundle "hallison/vim-ruby-sinatra"
Bundle "vim-ruby/vim-ruby"
" Bundle "tpope/vim-rvm"
Bundle "jpo/vim-railscasts-theme"
Bundle "ap/vim-css-color"
" End of bundle list

filetype plugin indent on

" Custom config
set history=1000      " longer history
set showcmd           " show incomplete cmds down the bottom
set showmode          " show current mode down the bottom

set incsearch         " find the next match as we type the search
set hlsearch          " highlight searches

set relativenumber    " add relative line numbers - SLOW
set cursorline        " underline current (cursor) line - SLOW
set ruler             " show row/col at the bottom right

set nowrap            " no wrapping
set colorcolumn=80    " but show a line at 80 chars

" optimization settings to alleviate sluginess
set re=1              " older regex engine is faster for Ruby regexes
set lazyredraw

"indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"status line
set statusline=%f
set statusline+=%{fugitive#statusline()}
set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}
set statusline+=%=        "left/right separator
set statusline+=%c,
set statusline+=%l/%L
set statusline+=\ %P

"remove GUI toolbar
set guioptions-=T

syntax on

let NERDTreeMinimalUI=1

colorscheme railscasts
set mouse=a

"keyboard
let mapleader = ","

nnoremap <leader>b :BufExplorer<cr>
nnoremap <leader>p :CtrlPMixed<cr>
silent! nmap <silent> <leader>t :NERDTreeToggle<cr>

"command aliases for when I keep shift down a bit too long after the colon
command W w
command Q q

"replace ack with ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"greek keymap, CTRL+6 to switch
set keymap=greek_utf-8
set iminsert=0
set imsearch=-1

" Current filename in title
set title

" ctrlP plugin config
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

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

