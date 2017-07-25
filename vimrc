" rgm's vimrc

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'pearofducks/ansible-vim'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'sjl/gundo.vim'
Plug 'plasticboy/vim-markdown'
call plug#end()

silent! colorscheme molokai
let g:airline_powerline_fonts = 1  " https://github.com/powerline/fonts
let g:airline_theme='badwolf'

let g:ansible_name_highlight = 'd' " Highlight ansible task names, dim or bright
if executable('ag')                " Let ack.vim use ag if available
  let g:ackprg = 'ag --vimgrep'
endif

set tabstop=2      " number of visual spaces per TAB
set shiftwidth=2   " number of spaces for each step of (auto)indent
set softtabstop=2  " number of spaces in tab when editing
set expandtab      " tabs are spaces
set lazyredraw     " redraw less, improves speed

" haya14busa/incsearch.vim config
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1 " :h g:incsearch#auto_nohlsearch
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" let mapleader=","   " leader is comma instead of backspace
" nnoremap <leader>u :GundoToggle<CR> " toggle gundo

let g:vim_markdown_folding_disabled = 1 " Disable vim-markdown specific folding
