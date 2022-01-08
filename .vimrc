set encoding=utf-8
syntax on
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set nu " line numbers
set belloff=all " disable audible bell (annoying while scrolling)
set clipboard=unnamed " system clipboard
:set incsearch " incremental search
:set hlsearch " search highlighting

filetype indent on

" if exists('+colorcolumn')
"   set colorcolumn=80
" else
"  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
" endif


" base Vundle install
" see https://realpython.com/vim-and-python-a-match-made-in-heaven/
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'w0rp/ale'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'junegunn/goyo.vim'
Plugin 'vivien/vim-linux-coding-style'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'yuezk/vim-js'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'sillybun/vim-repl'
Plugin 'hashivim/vim-terraform'
Plugin 'lervag/vimtex'


" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" PEP8
" au BufNewFile,BufRead *.py, *.pyx
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" flag whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Airline
let g:airline#extensions#tabline#enabled = 1

" syntax highlighting
let python_highlight_all=1

" Ale
let b:ale_linters = ['flake8', 'pylint']
let b:ale_warn_about_trailing_whitespace = 1

" split remaps
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" autosave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>

" Live LaTeX preview
let g:livepreview_previewer = 'open -a Preview'

" fzf
set rtp+=/usr/local/opt/fzf

"LinuxCodingStyle config
"let g:linuxsty_patterns = [ "/Users/pjrule/COMP15" ]

" Goyo auto-resize
" https://github.com/junegunn/goyo.vim/issues/159#issuecomment-342417487
autocmd VimResized * if exists('#goyo') | exe "normal \<c-w>=" | endif

let g:reply_repls = {
\   'scheme': ['/Users/pjrule/Google Drive/Tufts/COMP105/build-prove-compare/bin/uscheme']
\ }

" COMP105 µSmalltalk
au BufRead,BufNewFile *.smt set filetype=lisp
