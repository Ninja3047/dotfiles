set nocompatible               " Be iMproved

" Remap for Colemak
noremap j k
noremap k j

noremap K J
noremap J K

noremap gj gk
noremap gk gj

" Enable plugins

call plug#begin('~/.nvim/plugged')

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
" Plug 'Shougo/neocomplcache.vim'
 Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/vimshell.vim'
" Plug 'scrooloose/syntastic'
Plug 'Lokaltog/vim-easymotion'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'wlangstroth/vim-racket'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'benekastah/neomake'
Plug 'critiqjo/lldb.nvim'

call plug#end()

if has('autocmd')
	filetype plugin indent on    " required
endif
if has('syntax') && !exists('g:syntax_on')
	syntax enable
endif

" Basic settings
set number
set shiftwidth=4
set tabstop=4

set background=dark
set laststatus=2
set backspace=2

" Colorscheme
colorscheme Tomorrow-Night-Bright

" Enable the rainbow
let g:rainbow_active = 1

" Airline
if $TERM != 'linux'
	let g:airline_powerline_fonts = 1
endif
let g:airline_detect_crypt = 0
let g:airline_theme='tomorrow'

" Neomake on write
autocmd! BufWritePost * Neomake

" Deoplete
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources = {}
let g:deoplete#sources_ = ['buffer']
let g:deoplete#sources.cpp = ['buffer', 'tag']

inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h>
		\ deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS>
		\ deoplete#mappings#smart_close_popup()."\<C-h>"
