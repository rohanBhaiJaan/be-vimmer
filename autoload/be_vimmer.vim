function! be_vimmer#ErrorMsg(str) abort
    echohl ErrorMsg
    echomsg a:str
    echohl Normal
endfunction

function! be_vimmer#Move(cmd) abort
    if g:be_vimmer_enable == 1
        if v:count > 0
            return a:cmd
        endif
        return ""
    else
        return a:cmd
    endif
endfunction

function! be_vimmer#Disable(cmd) abort
    if g:be_vimmer_enable == 1
        if v:count > 0
            return ''
        endif
        return ''
    else
        return a:cmd
    endif
endfunction

function! be_vimmer#EnableInsertModeDeletion() abort
    inoremap <BS>  <Plug>BEVIMMER_BS
    inoremap <Del> <Plug>BEVIMMER_DEL
    inoremap <C-w> <Plug>BEVIMMER_C_W
    inoremap <C-h> <Plug>BEVIMMER_C_H
endfunction

function! be_vimmer#DisableInsertModeDeletion() abort
    inoremap <BS>  <Nop>
    inoremap <Del> <Nop>
    inoremap <C-w> <Nop>
    inoremap <C-h> <Nop>
endfunction

function! be_vimmer#ToggleInsertModeDeletion() abort
    if g:be_vimmer_insert_mode_deletion == 1
        let g:be_vimmer_insert_mode_deletion = 0
        call be_vimmer#EnableInsertModeDeletion()
    else
        let g:be_vimmer_insert_mode_deletion = 1
        call be_vimmer#DisableInsertModeDeletion()
    endif
endfunction

function! be_vimmer#ToggleBeVimmer() abort
    if g:be_vimmer_enable == 1
        let g:be_vimmer_enable = 0
    else
        let g:be_vimmer_enable = 1
    endif
endfunction

function! be_vimmer#notify(str) abort
  if g:be_vimmer_enable == 1
    if has('nvim')
      let cmd = printf('lua require("be_vimmer_popup").create("%s")', a:str)
      exec cmd
    else
      call popup_atcursor(a:str, #{moved: "any"})
    endif
  endif
endfunction

function! be_vimmer#removeNotify() abort
  if has('nvim') && g:be_vimmer_enable == 1
    lua require("be_vimmer_popup").remove()
  endif
endfunction

function! be_vimmer#UpdateWaitTime(time) abort
    let time = str2nr(a:time)
    let &updatetime = time
endfunction
