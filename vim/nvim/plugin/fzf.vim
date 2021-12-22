autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
command! -nargs=0 GFilesOrFiles :execute system('git rev-parse --is-inside-work-tree') =~ 'true' ? 'GFiles' : 'Files $HOME'
nnoremap <silent><c-t> :GFilesOrFiles<cr>
nnoremap <silent><c-b> :Buffers<cr>
nnoremap <silent><c-r> :History:<cr>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

let g:fzf_preview_window = []
let g:fzf_layout = { 'down': '~25%' }
let g:fzf_action = {
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit'
            \ }

" Hide statusline
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Movement within 'ins-completion-menu'
imap <expr><C-j> pumvisible() ? "\<Down>" : "\<C-j>"
imap <expr><C-k> pumvisible() ? "\<Up>" : "\<C-k>"
imap <expr><C-n> pumvisible() ? "\<Down>" : "\<C-n>"
imap <expr><C-p> pumvisible() ? "\<Up>" : "\<C-p>"
