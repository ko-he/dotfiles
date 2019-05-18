set number
""""""""""""""""""""""""""""""""
" Init
""""""""""""""""""""""""""""""""

unlet! skip_defaults_vim

scriptencoding utf-8
set et ts=2 sw=0
set encoding=utf-8


""""""""""""""""""""""""""""""""
" Plugin
""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" -- colors ----------------
Plug 'joshdick/onedark.vim'

call plug#end()

colorscheme onedark
