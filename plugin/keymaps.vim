inoremap <Plug>BEVIMMER_BS  <BS>
inoremap <Plug>BEVIMMER_DEL <DEL>
inoremap <Plug>BEVIMMER_C_H <C-h>
inoremap <Plug>BEVIMMER_C_W <C-w>

nnoremap <expr> <silent> j be_vimmer#Move('j')
nnoremap <expr> <silent> k be_vimmer#Move('k')
nnoremap <expr> <silent> l be_vimmer#Disable('l')
nnoremap <expr> <silent> h be_vimmer#Disable('h')

if g:be_vimmer_insert_mode_deletion == 1 && g:be_vimmer_enable == 1
  call be_vimmer#DisableInsertModeDeletion()
endif
