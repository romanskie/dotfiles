let $vim_path = $HOME.'/.vim'
let s:vim_plugged_path = $vim_path.'/plugged'

call plug#begin(s:vim_plugged_path)

Plug 'Townk/vim-autoclose'
Plug 'luochen1990/rainbow'

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'

Plug 'tpope/vim-fireplace'
Plug 'kovisoft/paredit'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-grepper'
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'romainl/flattened'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" ===> Settings
syntax enable
filetype plugin indent on
set termguicolors
colorscheme flattened_light
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:rainbow_active = 1

" default updatetime 4000ms is not good for async update
set updatetime=100

set clipboard=unnamedplus

" More natural split opening
set splitbelow
set splitright

" Using Buffers like Tabs
set hidden
set autoread

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Show line numbers
set number
set relativenumber

" show matching paranthesis
set showmatch
set nolazyredraw
set ttimeout
set ttimeoutlen=0

" visual autocomplete for command menu "
set wildmenu

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Files, backups and undo
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile

" Text, tab and indent related
" Use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines"

" search
set hlsearch
set ignorecase
set smartcase

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Turn persistent undo on
" means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry

set laststatus=2
set noshowmode

" ===> Mappings/Bindings
let mapleader = " "

"apply macros with q
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

" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap ; :

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

" cancle search with esc
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Git settingss
" Avoid whitespace comparison
set diffopt+=iwhite

" ===> Grepper Settings
let g:grepper               = {}
let g:grepper.tools         = ['git', 'grep']
let g:grepper.jump          = 0
let g:grepper.switch        = 1
let g:grepper.simple_prompt = 1
let g:grepper.open          = 1
let g:grepper.highlight     = 1
nnoremap <silent><c-f> :Grepper<cr>

" ===> FZF
command! -nargs=0 GFilesOrFiles :execute system('git rev-parse --is-inside-work-tree') =~ 'true' ? 'GFiles' : 'Files $HOME'
nnoremap <silent><c-t> :GFilesOrFiles<cr>
nnoremap <silent><c-b> :Buffers<cr>
nnoremap <silent><c-r> :History:<cr>

let g:fzf_preview_window = ''
let g:fzf_layout = { 'down': '~25%' }
let g:fzf_action = {
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit'
            \ }

"hide statusline
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" ===> signify Configuration:
nnoremap <leader>sd :SignifyDiff<cr>
nnoremap <leader>hd :SignifyHunkDiff<cr>
nnoremap <leader>hu :SignifyHunkUndo<cr>

" hunk jumping
nmap <leader>hn <plug>(signify-next-hunk)
nmap <leader>hp <plug>(signify-prev-hunk)

" hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

" ===> fireplace
nmap <leader>ev <Plug>FireplaceCountPrint
nnoremap <silent><leader>rq :Require<cr>

" Movement within 'ins-completion-menu'
imap <expr><C-j> pumvisible() ? "\<Down>" : "\<C-j>"
imap <expr><C-k> pumvisible() ? "\<Up>" : "\<C-k>"
imap <expr><C-n> pumvisible() ? "\<Down>" : "\<C-n>"
imap <expr><C-p> pumvisible() ? "\<Up>" : "\<C-p>"

" ===> Commands
" dealing with whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" add yaml stuffs
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
