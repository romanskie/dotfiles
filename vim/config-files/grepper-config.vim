" ===> Grepper Settings
let g:grepper               = {}
let g:grepper.tools         = ['git', 'grep']
let g:grepper.jump          = 0
let g:grepper.switch        = 1
let g:grepper.simple_prompt = 1
let g:grepper.open          = 1
let g:grepper.highlight     = 1
nnoremap <silent><c-f> :Grepper<cr>
