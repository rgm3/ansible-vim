" rgm's vimrc
"

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'tomasr/molokai'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'pearofducks/ansible-vim'
call plug#end()

silent! colorscheme molokai

" Highlight ansible task names, dim or bright
let g:ansible_name_highlight = 'd'

" Let ack.vim use ag if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set ts=2
set sw=2
set expandtab
