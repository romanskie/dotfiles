let s:is_nvim = has('nvim')
let $vim_path = $HOME.(s:is_nvim ? '/.config/nvim' : '/.vim')
let s:vim_plugged_path = $vim_path.'/plugged'

call plug#begin(s:vim_plugged_path)

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'jistr/vim-nerdtree-tabs'
Plug 'Townk/vim-autoclose'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'slashmili/alchemist.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-rooter'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'w0rp/ale'
Plug 'lifepillar/vim-solarized8'
Plug 'tpope/vim-fugitive'

call plug#end()

syntax on
set termguicolors
set background=light
colorscheme solarized8
let g:airline_solarized_bg='light'

"disable recording
map q <Nop>

autocmd BufWritePre * :%s/\s\+$//e "/dealing with whitespaces

" ====> mappings
set clipboard+=unnamedplus "clipboard

" Visual linewise up and down by default (and use gj gk to go quicker)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k

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

" ===> Terminal navigations
tnoremap <Esc> <C-\><C-n> "To map <Esc> to exit terminal-mode:
au TerminalOpen * if &buftype == 'terminal' | setlocal bufhidden=hide | endif "terminal mode mappings

if has('nvim')
    tnoremap <C-w>t :terminal<CR>
    nnoremap <C-w>t :terminal<CR>
    inoremap <C-w>t :terminal<CR>
    command! -nargs=* T split | terminal <args>
    command! -nargs=* VT vsplit | terminal <args>
    "To use `ALT+{h,j,k,l}` to navigate windows from any mode:
    tnoremap <A-h> <C-\><C-N><C-w>h
    tnoremap <A-j> <C-\><C-N><C-w>j
    tnoremap <A-k> <C-\><C-N><C-w>k
    tnoremap <A-l> <C-\><C-N><C-w>l
    inoremap <A-h> <C-\><C-N><C-w>h
    inoremap <A-j> <C-\><C-N><C-w>j
    inoremap <A-k> <C-\><C-N><C-w>k
    inoremap <A-l> <C-\><C-N><C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
else
    command! -nargs=* T :terminal <args>
    command! -nargs=* VT :vertical terminal <args>

    tnoremap <C-w>t :terminal ++curwin<CR>
    nnoremap <C-w>t :terminal ++curwin<CR>
    inoremap <C-w>t :terminal ++curwin<CR>
endif

" ===> Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ===> More natural split opening
set splitbelow
set splitright

augroup windows_and_buffers
    au!
    " Autosave current buffer when going to normal mode or switching to another
    " buffer.
    autocmd InsertLeave * silent! write
    autocmd BufLeave * silent! write
augroup END

" ====> Using Buffers like Tabs
set hidden
nnoremap <c-j> :bprevious<CR>
nnoremap <c-k>   :bnext<CR>
"nnoremap <c-x> :bp <BAR> bd #<CR>
nnoremap <c-c> :bp <BAR> bd #<CR>

map <Esc><Esc> :w<CR>

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
autocmd InsertEnter * :set relativenumber!
autocmd InsertLeave * :set relativenumber!

" cancle search with esc
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

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

"always current dir
autocmd BufEnter * silent! lcd %:p:h

" ====> Files, backups and undo
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" ===> Text, tab and indent related
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

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
            \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" ===> Turn persistent undo on
" means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry

" =====> Nerdtree
let NERDTreeShowHidden=1 "Display hidden files:
let g:NERDTreeWinSize=40
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "left"

nnoremap <silent> <F1> ::NERDTreeTabsToggle<CR>

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" ===> fzf
nnoremap <c-t> :Files<cr>
nnoremap <silent><c-b> :Buffers<cr>

let g:fzf_layout = { 'down': '~30%' }
let g:fzf_action = {
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit'
            \ }

"hide statusline
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" ===> airline
set laststatus=2
set noshowmode               " We show the mode witthih airline or lightline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'


" ===> DEOPLETE
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#enable_smart_case = 1
let g:deoplete#sources = {}

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<Down>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<Up>" : "\<C-k>"
imap <expr><C-n>   pumvisible() ? "\<Down>" : "\<C-n>"
imap <expr><C-p>   pumvisible() ? "\<Up>" : "\<C-p>"

" Undo completion
noremap <expr><C-h> deoplete#undo_completion()

" Redraw candidates
inoremap <expr><C-l> deoplete#refresh()

