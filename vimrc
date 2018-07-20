""""""
" Andrew Tamura's prefered vimrc
" http://andrewtamura.com
"
""""""
set autoread                                     " reload on external file changes
set backspace=indent,eol,start                   " backspace behaviour
set clipboard=unnamed,unnamedplus                " enable clipboard
set encoding=utf8                                " enable utf8 support
set hidden                                       " hide buffers, don't close
set mouse=a                                      " enable mouse support
set nowrap                                       " disable wrapping
set number                                       " show line numbers
set term=xterm-256color                          " terminal type
set wildmenu wildmode=longest:full,full          " wildmode settings
set background=dark
set autoindent expandtab                         " autoindentation & tabbing
set lazyredraw                                   " enable lazyredraw
set nocursorline                                 " disable cursorline
set ttyfast                                      " enable fast terminal connection
colorscheme solarized
let g:solarized_termcolors=256
set syntax=enable " enable syntax processing
scriptencoding utf-8
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set nocp                    " 'compatible' is not set
filetype plugin on          " plugins are enabled
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab indentkeys-=<:>
autocmd BufNewFile,BufRead *.jinja2,*.j2,*.jinja set ft=jinja
set directory^=$HOME/.vim/tmp// " put all swap files into a global directory
set textwidth=80 " Wrap files at 80 chars
set laststatus=2
set smartindent
set hlsearch
if !has('gui_running')
    set t_Co=256
endif
set colorcolumn=+1        " highlight column after 'textwidth'
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
let g:lightline = {
\   'colorscheme': 'solarized',
\   'active': {
\       'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'modified' ] ]
\   },
\   'component_function': {
\       'fugitive': 'LightlineFugitive',
\       'modified': 'LightlineModified'
\   },
\ }

let g:lightline.component_expand = {
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \ }

let g:lightline.active = { 'right': [[ 'linter_errors', 'linter_warnings', 'linter_ok' ]] }
function! LightlineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! LightlineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

let g:javascript_plugin_jsdoc = 1

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 0
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
" Syntax
Plug 'airblade/vim-gitgutter'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'shime/vim-livedown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'w0rp/ale'
Plug 'nvie/vim-flake8'
Plug 'maximbaz/lightline-ale'
Plug 'mxw/vim-jsx'
Plug 'lepture/vim-jinja'
" Initialize plugin system
call plug#end()

" Use Silver Searcher if it is installed
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Run Flake8 automatically
let g:flake8_cmd="/Users/andrew/Library/Python/2.7/bin/flake8"
autocmd BufWritePost *.py call Flake8()

" ALE Setting
"
let g:ale_linters = {
\   'javascript': ['standard'],
\   'go': ['gofmt'],
\   'scala': ['scalafmt'],
\   'yaml': ['yamllint']
\}
let g:ale_fixers = {
\   'javascript': ['standard'],
\   'go': ['gofmt'],
\   'yaml': ['yamllint']
\}
let g:ale_yaml_yamllint_options = '-c ~/.yamllint_config.yaml'
let g:ale_go_gofmt_use_global = 1
let g:ale_python_flake8_use_global = 1
let g:ale_sign_column_always = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'normal'

" LiveDown
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 1
" should the browser window pop-up upon previewing
let g:livedown_open = 1
" the port on which Livedown server will run
let g:livedown_port = 1337

let g:indent_guides_enable_on_vim_startup = 1

" https://github.com/mxw/vim-jsx
let g:jsx_ext_required = 0
