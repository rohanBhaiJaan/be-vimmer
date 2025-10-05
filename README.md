# BE-VIMMER V 1.3.0

## Abort
this plugin is created to void the unwanted usage of j,k motions for vertical navigation
and to use more useful motions like: w, b, f, W, B, F for horizontal navigation

## Tested On
VIM v0.9.1
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
1. user can use j,k motions but with numbers 
   * user can can't use h,j,k,l, keys after repeating 2 time(default)
   * reusable after pressing different keys

1. user can disable backspace/delete key in insert mode
1. user get notification if he doesn't type anything in insert mode for 4s(default)

### Example
if you want to move 1/10 line up use 1/10k

same thing for 1/10 line down use 1/10j
