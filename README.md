# BE-VIMMER V 1.3.0

## Abort
this plugin is created to void the unwanted usage of j,k motions for vertical navigation
and to use more useful motions like: w, b, f, W, B, F for horizontal navigation

## Tested On
VIM v0.8.2
NVIM v0.7.2

## Propose 
use this plugin for practice propose only
not made to use in workflow
if you're comfortable with it then use it

# INSTALLATION
## for vim-plug
```vim
Plug 'rohanBhaiJaan/be-vimmer'
```
                                      [or] 
## for vim
```bash
git clone https://github.com/rohanBhaiJaan/be-vimmer ~/.vim/pack/plugins/start/be-vimmer
vim +"helptags ~/.vim/pack/plugins/start/be-vimmer/doc/"
```

## use
```vim
help be_vimmer
```
for Details

## Features
user can toggle insert mode deletion operations
user can use j,k motions but with numbers not like hardmode
user get notification, if not inserting anything and being in insert mode more then 4000 sec
user can change notification interval

### Example
if you want to move 1/10 line up use 1k/10k

r 1/10 line down use 1j/10j
