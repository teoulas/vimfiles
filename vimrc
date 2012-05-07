set nocompatible

" Required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Required by vundle
Bundle 'gmarik/vundle'

" Custom bundle list
Bundle "ack.vim"
Bundle "bufexplorer.zip"
Bundle "Command-T"
Bundle "cucumber.zip"
Bundle "endwise.vim"
Bundle "fugitive.vim"
Bundle "tpope/vim-haml"
Bundle "othree/html5.vim"
Bundle "The-NERD-tree"
Bundle "rails.vim"
Bundle "surround.vim"
Bundle "scrooloose/syntastic"
Bundle "tpope/vim-bundler"
Bundle "vim-coffee-script"
Bundle "itspriddle/vim-jquery"
Bundle "hallison/vim-ruby-sinatra"
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-rvm"
Bundle "railscasts"
" End of bundle list

filetype plugin indent on

" Custom config
set history=1000      " longer history
set showcmd           " show incomplete cmds down the bottom
set showmode          " show current mode down the bottom

set incsearch         " find the next match as we type the search
set hlsearch          " highlight searches

set relativenumber    " add relative line numbers
set ruler             " show row/col at the bottom right

"indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

syntax on

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

