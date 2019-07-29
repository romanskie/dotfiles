let s:is_nvim = has('nvim')
let $vim_path = $HOME.(s:is_nvim ? '/.config/nvim' : '/.vim')
let s:vim_plugged_path = $vim_path.'/plugged'

call plug#begin(s:vim_plugged_path)

Plug 'sheerun/vim-polyglot'
Plug 'Townk/vim-autoclose'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-grepper'

Plug 'lifepillar/vim-solarized8'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'luochen1990/rainbow'

Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'

if s:is_nvim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

call plug#end()

" ===> Settings
syntax on
set termguicolors
set background=light
colorscheme solarized8
let g:rainbow_active = 1

set clipboard+=unnamedplus

" More natural split opening
set splitbelow
set splitright

" Using Buffers like Tabs
set hidden

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

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Turn persistent undo on
" means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry

" ===> Mappings/Bindings
let mapleader = " "

" Disable recording
map q <Nop>

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

nnoremap <C-W><<> <C-W><r>
nnoremap <C-W><>> <C-W><R>

" Using Buffers like Tabs
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <c-c> :bp <BAR> bd #<CR>
nnoremap <c-q> :bp <BAR> bd #<CR>

" Save with double esc
map <Esc><Esc> :w<CR>

" cancle search with esc
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" ===> Grepper Settings
let g:grepper               = {}
let g:grepper.tools         = ['git', 'grep']
let g:grepper.jump          = 1
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 0

nnoremap <silent><c-f> :Grepper<cr>
nnoremap <silent><leader>f :Grepper<cr>

" =====> Nerdtree
let NERDTreeShowHidden=1 "Display hidden files:
let g:NERDTreeWinSize=40
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "left"

nnoremap <silent><F1> :NERDTreeTabsToggle<CR>

function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" ===> FZF
nnoremap <silent><c-t> :Files<cr>
nnoremap <silent><leader>t :Files<cr>

nnoremap <silent><c-b> :Buffers<cr>
nnoremap <silent><leader>b :Buffers<cr>

let g:fzf_layout = { 'down': '~30%' }
let g:fzf_action = {
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit'
            \ }

"hide statusline
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" ===> Airline
let g:airline_solarized_bg='light'
set laststatus=2
set noshowmode               " We show the mode witthih airline or lightline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" ===> coc nvim
if s:is_nvim

    let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
    let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
    let g:LanguageClient_settingsPath=".lsp/settings.json"
    let g:coc_enable_locationlist = 0

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    autocmd User CocLocationsChange CocList --normal location

    autocmd BufReadCmd,FileReadCmd,SourceCmd jar:file://* call s:LoadClojureContent(expand("<amatch>"))

    command! -nargs=0 Format :call CocAction('format')

    function! s:show_documentation()
        if &filetype == 'vim'
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    function! Expand(exp) abort
        let l:result = expand(a:exp)
        return l:result ==# '' ? '' : "file://" . l:result
    endfunction

    function! s:LoadClojureContent(uri)
        setfiletype clojure
        let content = CocRequest('clojure-lsp', 'clojure/dependencyContents', {'uri': a:uri})
        call setline(1, split(content, "\n"))
        setl nomodified
        setl readonly
    endfunction

    " Movement within 'ins-completion-menu'
    imap <expr><C-j>   pumvisible() ? "\<Down>" : "\<C-j>"
    imap <expr><C-k>   pumvisible() ? "\<Up>" : "\<C-k>"
    imap <expr><C-n>   pumvisible() ? "\<Down>" : "\<C-n>"
    imap <expr><C-p>   pumvisible() ? "\<Up>" : "\<C-p>"

    " Remap keys for gotos
    nmap <silent><leader>gd <Plug>(coc-definition)
    nmap <silent><leader>gy <Plug>(coc-type-definition)
    nmap <silent><leader>gi <Plug>(coc-implementation)
    nmap <silent><leader>gr <Plug>(coc-references)

    nmap <silent><leader>rn <Plug>(coc-rename)
    nmap <silent><leader>re <Plug>(coc-rename)


    "inoremap <silent><expr> <c-space> coc#refresh()
    nmap <leader>e <Plug>(coc-diagnostic-next)
    nmap <leader>E <Plug>(coc-diagnostic-prev)
    nnoremap <leader>doc :call <SID>show_documentation()<CR>

    "nmap <leader>F <Plug>(coc-format)
    "vmap <leader>f <Plug>(coc-format-selected)
    "nmap <leader>f <Plug>(coc-format-selected)

    "clojure

    nnoremap <silent> crcc :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-coll', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
    nnoremap <silent> crth :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
    nnoremap <silent> crtt :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
    nnoremap <silent> crtf :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
    nnoremap <silent> crtl :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
    nnoremap <silent> cruw :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-thread', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
    nnoremap <silent> crua :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
    nnoremap <silent> crml :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-to-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
    nnoremap <silent> cril :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'introduce-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
    nnoremap <silent> crel :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'expand-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
    nnoremap <silent> cram :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'add-missing-libspec', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
    nnoremap <silent> crcn :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'clean-ns', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
    nnoremap <silent> cref :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'extract-function', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Function name: ')]})<CR>

endif


" ===> Commands
autocmd BufWritePre * :%s/\s\+$//e "/dealing with whitespaces

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


