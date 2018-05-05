# fzf_outline.vim

This is a vim/neovim plugin that add new command `Outline`.

## Requirements

- [fzf.vim](https://github.com/gmarik/vundle)
- ctags binary

## Install

You can install this plugin with your package manager. 

To install with [vim-plug](https://github.com/junegunn/vim-plug), add the following lines to your `.vimrc` and do `:PlugInstall`.

```
Plug 'theoldmoon0602/fzf_outline.vim'
```

## Configuration

The variable `g:fzf_outline_kinds` is list of shown kinds.
```
let g:fzf_outline_kinds=["c","s","f","g"]  "default value
```

## Usage
`:Outline` command shows outline if tags file exists.

## LICENSE
MIT
