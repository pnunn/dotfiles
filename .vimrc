set nocompatible
syntax on
syntax enable
set tabstop=2   
set shiftwidth=2
set autoindent
set copyindent
set shiftround
set cursorline
set showmatch
set smarttab
set expandtab
set title
set nobackup
set pastetoggle=<F2>
set number
set relativenumber
set laststatus=2
set showcmd
set wildmenu
set mouse=a
set background=dark

" set termguicolors
"set guicolors

nmap <silent> ,/ :nohlsearch<CR>

"cmap w!! w !sudo tee % >/dev/null
cnoremap w!! execute 'silent! w !sudo tee % >/dev/null' <bar> edit!
vmap Q gq
nmap Q gg=G
nnoremap j gj
nnoremap k gk
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::cg<Left><Left><Left><Left>


"====[ Set up smarter search behaviour ]=======================

set incsearch       "Lookahead as search pattern is specified
set ignorecase      "Ignore case in all searches...
set smartcase       "...unless uppercase letters used

set hlsearch        "Highlight all matches
highlight clear Search

"=====[ Highlight matches when jumping to next ]=============

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>
highlight WhiteOnRed ctermbg=red ctermfg=white

function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  let ring = matchadd('WhiteOnRed', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-system-copy'
Plugin 'kien/rainbow_parentheses.vim' " color-match ()[]{}<> and friends
Plugin 'tpope/vim-commentary.git' " simple comment/uncomment plugin
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'jacoborus/tender'
Plugin 'itchyny/lightline.vim'
Plugin 'sjl/badwolf'
Plugin 'ciaranm/inkpot'
"Plugin 'valloric/youcompleteme'
Plugin 'ervandew/supertab'
Plugin 'mxw/vim-jsx'
Plugin 'whatyouhide/vim-gotham'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim'} 

" Plugin 'nilium/triplejelly'

if &term =~ '256color'
  set t_ut=
endif


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:netrw_liststyle=3

" enable tender lightline theme
let g:tender_lightline = 1
" " set lighline theme (inside lightline config)
let g:lightline = { 'colorscheme': 'tender' }
let g:badwolf = 1
let g:inkpot = 1

"colorscheme tender
"colorscheme badwolf
"colorscheme inkpot
"colorscheme gotham256
"colorscheme bdconry
colorscheme cobalt

set clipboard=unnamed
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

set undodir=~/.vim/undodir
set undofile " Maintain undo history between sessions

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

