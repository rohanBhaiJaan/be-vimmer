if exists("g:be_vimmer")
    finish
endif

if !exists("g:be_vimmer_disable_backspace")
    let g:be_vimmer_disable_backspace = 0
endif

let g:be_vimmer = 1

inoremap <Plug>BEVIMMER_BS  <BS>
inoremap <Plug>BEVIMMER_DEL <DEL>
inoremap <Plug>BEVIMMER_C_H <C-h>
inoremap <Plug>BEVIMMER_C_W <C-w>

function! Move(cmd)
    if v:count > 0
        return a:cmd
    else
        return ""
    endif
endfunction

function! Disable()
    if v:count > 0
        return ''
    endif
    return ''
endfunction

function! EnableBackspace() abort
    inoremap <BS>  <Plug>BEVIMMER_BS
    inoremap <Del> <Plug>BEVIMMER_DEL
    inoremap <C-w> <Plug>BEVIMMER_C_W
    inoremap <C-h> <Plug>BEVIMMER_C_H
endfunction

function! DisableBackspace() abort
    inoremap <BS>  <Nop>
    inoremap <Del> <Nop>
    inoremap <C-w> <Nop>
    inoremap <C-h> <Nop>
endfunction

function! s:ToggleBackspace() abort
    if g:be_vimmer_disable_backspace == 1
        let g:be_vimmer_disable_backspace = 0
        call EnableBackspace()
    else
        let g:be_vimmer_disable_backspace = 1
        call DisableBackspace()
    endif
endfunction

if g:be_vimmer_disable_backspace == 1
    call DisableBackspace()
endif

nnoremap <expr> <silent> j Move('j')
nnoremap <expr> <silent> k Move('k')
nnoremap <expr> <silent> l Disable()
nnoremap <expr> <silent> h Disable()

command! ToggleBeVimmerBackspace call <SID>ToggleBackspace()
