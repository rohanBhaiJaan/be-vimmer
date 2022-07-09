if exists("g:be_vimmer")
    finish
endif

if !exists("g:be_vimmer_disable_backspace")
    let g:be_vimmer_disable_backspace = 0
endif

let g:be_vimmer = 1

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

if g:be_vimmer_disable_backspace == 1
    inoremap <BS> <Nop>
    inoremap <Del> <Nop>
    inoremap <C-w> <Nop>
    inoremap <C-h> <Nop>
endif

nnoremap <expr> <silent> j Move('j')
nnoremap <expr> <silent> k Move('k')
nnoremap <expr> <silent> l Disable()
nnoremap <expr> <silent> h Disable()
