function! be_vimmer#Move(cmd)
    if g:be_vimmer_enable == 1
        if v:count > 0
            return a:cmd
        endif
        return ""
    else
        return a:cmd
    endif
endfunction

function! be_vimmer#Disable(cmd)
    if g:be_vimmer_enable == 1
        if v:count > 0
            return ''
        endif
        return ''
    else
        return a:cmd
    endif
endfunction

function! be_vimmer#EnableBackspace() abort
    inoremap <BS>  <Plug>BEVIMMER_BS
    inoremap <Del> <Plug>BEVIMMER_DEL
    inoremap <C-w> <Plug>BEVIMMER_C_W
    inoremap <C-h> <Plug>BEVIMMER_C_H
endfunction

function! be_vimmer#DisableBackspace() abort
    inoremap <BS>  <Nop>
    inoremap <Del> <Nop>
    inoremap <C-w> <Nop>
    inoremap <C-h> <Nop>
endfunction

function! be_vimmer#ToggleBackspace() abort
    if g:be_vimmer_disable_backspace == 1
        let g:be_vimmer_disable_backspace = 0
        call be_vimmer#EnableBackspace()
    else
        let g:be_vimmer_disable_backspace = 1
        call be_vimmer#DisableBackspace()
    endif
endfunction

function! be_vimmer#ToggleBeVimmer() abort
    if g:be_vimmer_enable == 1
        let g:be_vimmer_enable = 0
    else
        let g:be_vimmer_enable = 1
    endif
endfunction
