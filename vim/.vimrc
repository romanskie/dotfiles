" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===> Plugins
call plug#begin(data_dir . '/plugged')

Plug 'Olical/conjure'
Plug 'Townk/vim-autoclose'

Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'

Plug 'bling/vim-airline'
Plug 'clojure-vim/vim-jack-in'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'kovisoft/paredit'

Plug 'luochen1990/rainbow'

Plug 'mhinz/vim-grepper'

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'romainl/flattened'

Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-vinegar'

Plug 'vim-airline/vim-airline-themes'

call plug#end()

"for plugin_config in split(glob('$HOME/.config/nvim/plugin_configs/*.vim'), '\n')
"    exe 'source' plugin_config
"endfor

" ===> Settings

colorscheme flattened_light
filetype plugin indent on

set ai
set clipboard=unnamedplus
set cmdheight=2
set diffopt+=iwhite
set encoding=utf-8
set expandtab
set foldcolumn=1
set hidden
set hlsearch
set ignorecase
set laststatus=2
set lbr
set nobackup
set noerrorbells
set nolazyredraw
set noshowmode
set noswapfile
set novisualbell
set nowb
set nowritebackup
set number
set relativenumber
set ruler
set shiftwidth=4
set shortmess+=c
set showmatch
set si
set smartcase
set smarttab
set so=7
set splitbelow
set splitright
set t_vb=
set tabstop=4
set termguicolors
set tm=500
set ttimeout
set ttimeoutlen=0
set tw=500
set undofile
set updatetime=100
set wildmenu
set wrap
syntax enable

if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" ===> Mappings/Bindings
let mapleader = "\<space>"
let maplocalleader = "\<space>"

nnoremap ; :

" Apply macros with q
nnoremap Q @q
vnoremap Q :norm @q<cr>
map <C-W><C-Q> <Nop>

" Visual linewise up and down by default (and use gj gk to go quicker)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" When jump to next match also center screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" Disable arrow keys in normal mode
map <Left> <NOP>
map <Down> <NOP>
map <Up> <NOP>
map <Right> <NOP>

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Using Buffers like Tabs
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
nnoremap <silent> <C-N> :bnext<CR>
nnoremap <silent> <C-P> :bprevious<CR>
nnoremap <silent> <C-C> :bp <BAR> bd #<CR>
nnoremap <silent> <C-Q> :bp <BAR> bd #<CR>

" Save with double esc
map <silent><Esc><Esc> :w<CR>

" Cancle search with esc
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" ===> Commands
" Dealing with whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Treat multiple filetypes as yaml
au! BufNewFile,BufReadPost *.{yaml,yml,jinja} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

augroup windows_and_buffers
    au!
    " Autosave current buffer when going to normal mode or switching to another
    " buffer.
    autocmd InsertLeave * silent! write
    autocmd BufLeave * silent! write
augroup END

autocmd InsertEnter * :set relativenumber!
autocmd InsertLeave * :set relativenumber!

autocmd BufEnter * silent! lcd %:p:h "always current dir

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
            \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif
