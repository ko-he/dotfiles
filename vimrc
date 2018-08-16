""""""""""""""""""""""""""""""""
" Init
""""""""""""""""""""""""""""""""

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

scriptencoding utf-8
set et ts=2 sw=0
set encoding=utf-8


""""""""""""""""""""""""""""""""
" Plugin
""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" -- status bar ---------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" -- files ----------------
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'dyng/ctrlsf.vim'

" -- Git ------------------
Plug 'tpope/vim-fugitive'

" -- Ctags -----------------
Plug 'soramugi/auto-ctags.vim'
Plug 'majutsushi/tagbar'

" -- colors ----------------
Plug 'joshdick/onedark.vim'

" -- language -------------
" for js
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }

" for ts
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'ianks/vim-tsx'

" for linter
" Plug 'w0rp/ale'

call plug#end()

""""""""""""""""""""""""""""""""
" Themes
""""""""""""""""""""""""""""""""


syntax on
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

colorscheme onedark

let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""

set helplang=ja,en
set hlsearch
set noswapfile
set number

" mosue 有効化
set mouse=a
set ttymouse=xterm2

" クリップボード
set clipboard+=unnamed
let g:fzf_buffers_jump = 1

" fzf
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" ctags
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
let g:auto_ctags_filetype_mode = 1
set tags+=.git/tags;$HONE


""""""""""""""""""""""""""""""""
" Key mapping
""""""""""""""""""""""""""""""""

inoremap <S-Tab> <Esc>
vmap <S-Tab> <Esc>
map <C-n> :NERDTreeToggle<CR>
map <Space>p :Files<CR>
map <Space>a :Ag<CR>
map <Space>t :TagbarToggle<CR>
map <Space>l :bn<CR>
map <Space>h :bp<CR>
nnoremap <silent><C-i> :call fzf#vim#tags(expand('<cword>'))<CR>
nnoremap <silent><C-g> :call fzf#vim#ag(expand('<cword>'))<CR>
nnoremap x "_x
nnoremap X "_X
nnoremap D "_D
