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
Plug 'francoiscabrol/ranger.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'dyng/ctrlsf.vim'

" -- Git ------------------
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/vim-diff-enhanced'

" -- colors ----------------
Plug 'joshdick/onedark.vim'

" -- language -------------
" for js
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'posva/vim-vue'

" for ts
Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'
Plug 'ianks/vim-tsx'

" for linter
" Plug 'w0rp/ale'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" history
Plug 'mbbill/undotree'

" PlantUml
Plug 'aklt/plantuml-syntax'
Plug 'w0rp/ale'

Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" ctags
Plug 'szw/vim-tags'

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
let g:vim_tags_auto_generate = 1

" tsuquyomi
" let g:tsuquyomi_javascript_support = 1

" linter
let g:ale_set_highlights = 0
let b:ale_linters = {'ruby': ['rubocop'], 'nerdtree': ''}
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
""""""""""""""""""""""""""""""""
" Key mapping
""""""""""""""""""""""""""""""""

inoremap <S-Tab> <Esc>
vmap <S-Tab> <Esc>
map <C-n> :NERDTreeToggle<CR>
map <Space>p :Files<CR>
map <Space>b :Buffers<CR>
map <Space>a :Ag<CR>
map <Space>t :TagbarToggle<CR>
map <Space>l :bn<CR>
map <Space>h :bp<CR>
map <C-Esc> :bd<CR>
nnoremap <silent><C-i> :call fzf#vim#tags(expand('<cword>'))<CR>
nnoremap <silent><C-g> :call fzf#vim#ag(expand('<cword>'))<CR>
nnoremap x "_x
nnoremap X "_X
nnoremap D "_D
nnoremap <C-h> :UndotreeToggle<CR>
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
