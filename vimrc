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
Bundle "wincent/Command-T"
Bundle "cucumber.zip"
Bundle "endwise.vim"
Bundle "fugitive.vim"
Bundle "tpope/vim-haml"
Bundle "othree/html5.vim"
Bundle "The-NERD-tree"
Bundle "tpope/vim-rails"
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

set nowrap            " no wrapping

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
set statusline+=%c,
set statusline+=%l/%L
set statusline+=\ %P

"remove GUI toolbar
set guioptions-=T

syntax on

let NERDTreeMinimalUI=1

" GUI settings
if has("gui_running")
  colorscheme railscasts
  set linespace=4
  set lines=40 columns=120
  set guifont=Terminus\ 11

  if has("gui_mac") || has("gui_macvim")
    set guifont=Terminus:h14
    set noantialias
  endif
endif

"keyboard
let mapleader = ","

nnoremap <leader>b :BufExplorer<cr>
nnoremap <leader>t :CommandT<cr>
silent! nmap <silent> <leader>p :NERDTreeToggle<cr>

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

