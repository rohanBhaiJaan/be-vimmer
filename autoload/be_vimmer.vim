let s:keys = { 'k': 0, 'j': 0 , 'h': 0, 'l': 0 }

function be_vimmer#Setup(insert_mode_deletion, wait_time)
  let g:be_vimmer_enable = 1
  let g:be_vimmer_insert_mode_deletion = a:insert_mode_deletion
  let g:be_vimmer_wait_time = a:wait_time 
endfunction

function! be_vimmer#ErrorMsg(str) abort
    echohl ErrorMsg
    echomsg a:str
    echohl Normal
endfunction

function be_vimmer#ToggleAvailabeKey(cmd) abort
  let s:keys[a:cmd] = (s:keys[a:cmd] + 1) % 2
endfunction

function! be_vimmer#Move(cmd) abort
    if g:be_vimmer_enable != 1 || v:count > 0
      return a:cmd
    endif
    if ! s:keys[a:cmd]
      call be_vimmer#ToggleAvailabeKey(a:cmd)
      call timer_start(5000, {tid -> be_vimmer#ToggleAvailabeKey(a:cmd)})
      return a:cmd
    endif
    return ""
endfunction

function! be_vimmer#Disable(cmd) abort
    if g:be_vimmer_enable != 1
        return a:cmd
    endif
    return ''
endfunction

function! be_vimmer#EnableInsertModeDeletion() abort
    let g:be_vimmer_insert_mode_deletion = 0
    inoremap <BS>  <Plug>BEVIMMER_BS
    inoremap <Del> <Plug>BEVIMMER_DEL
    inoremap <C-w> <Plug>BEVIMMER_C_W
    inoremap <C-h> <Plug>BEVIMMER_C_H
endfunction

function! be_vimmer#DisableInsertModeDeletion() abort
    let g:be_vimmer_insert_mode_deletion = 1
    inoremap <BS>  <Nop>
    inoremap <Del> <Nop>
    inoremap <C-w> <Nop>
    inoremap <C-h> <Nop>
endfunction

function! be_vimmer#ToggleInsertModeDeletion() abort
    if g:be_vimmer_insert_mode_deletion == 1
        call be_vimmer#EnableInsertModeDeletion()
    else
        call be_vimmer#DisableInsertModeDeletion()
    endif
endfunction

function! be_vimmer#ToggleBeVimmer() abort
    let g:be_vimmer_enable = (g:be_vimmer_enable + 1)%2
endfunction

function! be_vimmer#notify(str) abort
  if g:be_vimmer_enable != 1
      return
  endif
  if has('nvim')
      let cmd = printf('lua require("be_vimmer_popup").create("%s")', a:str)
      exec cmd
      return
  endif
  call popup_atcursor(a:str, #{moved: "any"})
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
