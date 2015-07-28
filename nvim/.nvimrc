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

Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'luochen1990/rainbow'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'wlangstroth/vim-racket'
Plug 'vim-latex-live-preview'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
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
let base16colorspace=256
colorscheme base16-default

" Enable the rainbow
let g:rainbow_active = 1

" Latex live preview
let g:livepreview_previewer = 'zathura'

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

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h>
		\ deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS>
		\ deoplete#mappings#smart_close_popup()."\<C-h>"
