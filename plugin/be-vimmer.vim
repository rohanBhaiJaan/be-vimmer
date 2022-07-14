if exists("g:be_vimmer")
    finish
endif

let g:be_vimmer = 1

if !exists("g:be_vimmer_disable_backspace")
    let g:be_vimmer_disable_backspace = 0
endif

if !exists("g:be_vimmer_enable")
    let g:be_vimmer_enable = 0
endif

inoremap <Plug>BEVIMMER_BS  <BS>
inoremap <Plug>BEVIMMER_DEL <DEL>
inoremap <Plug>BEVIMMER_C_H <C-h>
inoremap <Plug>BEVIMMER_C_W <C-w>

if g:be_vimmer_disable_backspace == 1
    call be_vimmer#DisableBackspace()
endif

nnoremap <expr> <silent> j be_vimmer#Move('j')
nnoremap <expr> <silent> k be_vimmer#Move('k')
nnoremap <expr> <silent> l be_vimmer#Disable('l')
nnoremap <expr> <silent> h be_vimmer#Disable('h')

command! ToggleBeVimmerBackspace call be_vimmer#ToggleBackspace()
command! ToggleBeVimmer call be_vimmer#ToggleBeVimmer()
