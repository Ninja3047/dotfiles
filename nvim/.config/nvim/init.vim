set nocompatible               " Be iMproved

" Remap for Colemak
noremap j k
noremap k j

noremap K J
noremap J K

noremap gj gk
noremap gk gj

" Enable plugins

call plug#begin('~/.config/nvim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'wlangstroth/vim-racket'
Plug 'vim-latex-live-preview'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kassio/neoterm'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'lukerandall/haskellmode-vim'
Plug 'eagletmt/neco-ghc'
Plug 'Twinside/vim-haskellConceal'
Plug 'benekastah/neomake'
Plug 'critiqjo/lldb.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'majutsushi/tagbar'

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
set expandtab
set smarttab
set smartindent
set conceallevel=2 concealcursor=i

set background=dark
set laststatus=2
set backspace=2

set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Colorscheme
let base16colorspace=256
colorscheme base16-default

" Enable the rainbow
let g:rainbow_active = 1

" Latex live preview
let g:livepreview_previewer = 'zathura'

" Markdown folding
let g:markdown_folding = 1

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

" Neosnippets + vim-snippets
let g:neosnippet#enable_snipmate_compatibility = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" Haskell things
let g:haddock_browser="/usr/bin/chromium"
let g:haddock_docdir="/usr/share/doc/ghc/html/"

" Makes terminal horizontal
let g:neoterm_position='vertical'


" Enable heavy omni completion
if !exists('g:deoplete#sources#omni#input_patterns')
    let g:deoplete#sources#omni#input_patterns = {}
endif
if !exists('g:deoplete#omni_patterns')
    let g:deoplete#omni_patterns = {}
endif

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h>
    \ deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS>
    \ deoplete#mappings#smart_close_popup()."\<C-h>"
