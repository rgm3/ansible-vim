" rgm's vimrc

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'pearofducks/ansible-vim'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'sjl/gundo.vim' " TODO: explore
Plug 'plasticboy/vim-markdown'
" Colors
Plug 'tomasr/molokai'
Plug 'fatih/vim-go'
Plug 'twerth/ir_black'
Plug 'nanotech/jellybeans.vim'
Plug 'romainl/Apprentice'
Plug 'gosukiwi/vim-atom-dark'
Plug 'trusktr/seti.vim'
Plug 'kudabux/vim-srcery-drk'
call plug#end()

silent! colorscheme molokai
let g:airline_powerline_fonts = 0  " https://github.com/powerline/fonts
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

let mapleader=","   " leader is comma instead of backspace
set autowrite
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
" nnoremap <leader>u :GundoToggle<CR> " toggle gundo
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
let g:go_auto_sameids = 1


let g:vim_markdown_folding_disabled = 1 " Disable vim-markdown specific folding

let g:fugitive_gitlab_domains = ['https://gitlab.dev.lan']
