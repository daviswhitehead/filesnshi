" Davis Whitehead's .vimrc

set nocompatible              " be iMproved, required
filetype off                  " required
set backspace=indent,eol,start

" defalut settings
set number
syntax on

set number
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set clipboard=unnamed
let mapleader = "="

" for my sshrc
:imap <special> jk <Esc>

" colors
set background=dark
colorscheme Zenburn
" colorscheme solarized

" python settings
au BufNewFile,BufRead *.py
    \ set textwidth=79 |
    \ set fileformat=unix |
    \ syntax on |
    \ set background=dark |
    \ set number |
    \ set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅ |
    \ set encoding=utf-8 |
    \ set noexpandtab |
    \ set copyindent |
    \ set preserveindent |
    \ set tabstop=4 |
    \ set softtabstop=0 |
    \ set shiftwidth=4 |
    \ set autoindent |
    \ :call tagbar#autoopen() |
    \ let g:pymode = 1 |
    \ let g:pymode_folding = 1 |
    \ let g:pymode_motion = 1 |
    \ let g:pymode_run_bind = '<leader>r' |
"    \ NERDTree |
"    \ set expandtab |

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

" other mappings
nnoremap qa :qall!<CR>
nnoremap qq :q!<CR>
nnoremap wqa :wqa<CR>
nnoremap <space> za
nnoremap <C-o> o<Esc>k

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
"let g:pep8_ignore='E116,W191'
let g:pymode_lint_ignore='E124,E116,W191,E501,E128'
" virtual environments
Plugin 'jmcantrell/vim-virtualenv'
" ctags code indexer
Plugin 'ctags.vim'
" class/module browser
Plugin 'majutsushi/tagbar'
let g:tagbar_autofocus = 0
nmap <F4> :TagbarToggle<CR>
" git
Plugin 'tpope/vim-fugitive'
" code folding
Plugin 'tmhedberg/SimpylFold'
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
let g:SimplyFold_docstring_preview=0
"zR open all, zM close all, zj for next fold, zk for previous
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
set laststatus=2
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
" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

