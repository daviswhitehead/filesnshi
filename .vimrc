" Davis Whitehead's .vimrc

set nocompatible              " be iMproved, required
filetype off                  " required
set backspace=indent,eol,start

" defalut settings
set number
syntax on
set background=dark
set number
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set clipboard=unnamed

" for my sshrc
:imap <special> jk <Esc>

" colors
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme Zenburn
endif

" python settings
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ syntax on
    \ set background=dark
    \ set number
    \ set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
    \ set encoding=utf-8

let python_highlight_all=1

" webdev settings
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" ============================================================================
" active plugins

" python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Plugin 'klen/python-mode'
" virtual environments
Plugin 'jmcantrell/vim-virtualenv'
" ctags code indexer
Plugin 'ctags.vim'
" class/module browser
Plugin 'majutsushi/tagbar'
nmap <F4> :TagbarToggle<CR>
" git
Plugin 'tpope/vim-fugitive'
" code folding
Plugin 'tmhedberg/SimpylFold'
let g:SimplyFold_docstring_preview=1
" auto complete
Plugin 'Valloric/YouCompleteMe'
" colors
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" code and files fuzzy finder
Plugin 'kien/ctrlp.vim'
" automatically sort python imports
Plugin 'fisadev/vim-isort'
" misc vim scripts
Plugin 'L9'
" editor config
Plugin 'editorconfig/editorconfig-vim'
" airline
Plugin 'bling/vim-airline'
" comments
Plugin 'scrooloose/nerdcommenter'
" syntax checker
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
map <F2> :SyntasticCheck<CR>
" file browser
Plugin 'scrooloose/nerdtree'
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

