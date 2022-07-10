# BE-VIMMER

## Description
this plugin is created to void the unwanted usage of j,k motions
and to void the h,l motions and use more FT/ft motions

## Propose 
use this plugin for practice propose
not made to use in workflow
if you're comfortable with it then use it in workflow

## Usage
you can use j,k motions only with numbers
you can't use h,l motions

### use
```vim
let g:be_vimmer_disable_backspace = 1
```
To disable deletion operations in insert mode

```vim
ToggleBeVimmerBackspace
```
To toggle the insert mode deletion operations on and off

```vim
ToggleBeVimmer
```
To toggle hjkl motions

### Example
if you want to move 1/10 line up use 1k/10k
or 1/10 line down use 1j/10j
