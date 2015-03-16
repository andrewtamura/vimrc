""""""
" Andrew Tamura's prefered vimrc
" http://andrewtamura.com
"
""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
Plugin 'mustache/vim-mustache-handlebars'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" " :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
"
set number
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set hlsearch 
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=81
set list
set listchars=tab:▸\ ,eol:¬
set background=dark
set splitbelow
set splitright
set noswapfile

map <C-n> :NERDTreeToggle<CR>
filetype plugin indent on
syntax on

let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:vim_markdown_folding_disabled=1
let g:syntastic_javascript_checkets = ['jshint']
let g:syntastic_filetype_map = { "html.mustache": "handlebars" }
let g:syntastic_mode_map = { "mode": "active",                                                                                                                                                
                            \ "active_filetypes": ["python", "javascript"],                                                                                                                             
                            \ "passive_filetypes": ["html"] }
let g:mustache_abbreviations = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

