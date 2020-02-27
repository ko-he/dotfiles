if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  let g:rc_dir    = expand("~/.config/nvim")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

""""""""""""""""""""""""""""""""
" Base Config
""""""""""""""""""""""""""""""""

set clipboard+=unnamed
set hlsearch
set noswapfile

""""""""""""""""""""""""""""""""
" Themes
""""""""""""""""""""""""""""""""
syntax on
set number
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

colorscheme onedark

""""""""""""""""""""""""""""""""
" Key mapping
""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

vmap <S-Tab> <Esc>
map <Leader>p :Files<CR>
map <Leader>b :Buffers<CR>
map <Leader>a :Ag<CR>
map <Leader>t :TagbarToggle<CR>
map <Leader>l :bn<CR>
map <Leader>h :bp<CR>
nmap <Leader>e :CocCommand explorer<CR>
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

nmap <Leader>s <Plug>(easymotion-s2)
