if exists("g:be_vimmer")
    finish
endif

let g:be_vimmer = 1

if !exists("g:be_vimmer_insert_mode_deletion")
    let g:be_vimmer_insert_mode_deletion = 1
endif

if !exists("g:be_vimmer_enable")
    let g:be_vimmer_enable = 0
endif

if !exists("g:be_vimmer_wait_time")
    call be_vimmer#UpdateWaitTime(&updatetime)
    let g:be_vimmer_wait_time = &updatetime
else
    if g:be_vimmer_wait_time != &updatetime && g:be_vimmer_enable == 0
        call be_vimmer#ErrorMsg("First ON be-vimmer.vim")
    else
        call be_vimmer#UpdateWaitTime(g:be_vimmer_wait_time)
    endif
endif

inoremap <Plug>BEVIMMER_BS  <BS>
inoremap <Plug>BEVIMMER_DEL <DEL>
inoremap <Plug>BEVIMMER_C_H <C-h>
inoremap <Plug>BEVIMMER_C_W <C-w>

if g:be_vimmer_insert_mode_deletion == 0 && g:be_vimmer_enable == 1
    call be_vimmer#DisableInsertModeDeletion()
endif

nnoremap <expr> <silent> j be_vimmer#Move('j')
nnoremap <expr> <silent> k be_vimmer#Move('k')
nnoremap <expr> <silent> l be_vimmer#Disable('l')
nnoremap <expr> <silent> h be_vimmer#Disable('h')

command! -nargs=0 ToggleBeVimmerInsertModeDeletion call be_vimmer#ToggleInsertModeDeletion()
command! -nargs=0 ToggleBeVimmer call be_vimmer#ToggleBeVimmer()
command! -nargs=1 BeVimmerUpdateWaitTime call be_vimmer#UpdateWaitTime(<args>)

augroup BE_VIMMER
    autocmd!
    autocmd CursorHoldI *.* call be_vimmer#notify("leave insert mode")
    if has('nvim')
      autocmd CursorMovedI *.* call be_vimmer#removeNotify()
      autocmd InsertLeave *.* call be_vimmer#removeNotify()
    endif
augroup END
