# muse-vim

What is it? A plugin providing a few simple bindings for use with
[muse](https://gitlab.com/metaporia/muse). For more information on why anybody
would use muse, see its repository.

## Installation

### [vim-plug](https://github.com/junegunn/vim-plug)

Add the following to your config:

```vim
Plug 'https://gitlab.com/metaporia/muse-vim'
```

### Other plugin managers

I have not tested muse-vim with pathogen, or vim's new built-in package
management system&mdash;however, the plugin's structure conforms to pathogen's
specification, and *should* work with vanilla vim.

## Usage

1. Install [muse](https://gitlab.com/metaporia/muse).
2. Set muse log directory: e.g., `let g:muse_vim_log_dir =
   <path/to/your/log/dir>`. 
   
   (See section "Parse" in muse README on setting log directory.)


By default `<prefix> = <leader>` in the following keybindings (set only for
buffers in `g:muse_vim_log_dir`, which defaults to ~/.muse/entries):

* `<prefix>t` - `LogEntry`: add new timestamp at bottom of file with correct
  indentation
* `<prefix>cr` - `LastRead`: add read entry with author/title attribution of
  the most recent (previous) read entry
* `<prefix>v` - meant to proceed a `dvs`, definition comparison entry; adds
  divider: 

```
18:52:15 λ. dvs word1 : ...
                --- vs ---
                word2 : ...
```

### Note on workflow

A normal log session, for me that is, proceeds as follows:

1. call `log` in bash (see muse for script);
2. invoke `LastRead` to use current attribution;
3. insert timestamp with `LogEntry` and while in insert mode set indentation
   with `<c-t>`; and
4. log definitions, quotes, phrases, commentary, &c with vim and
   vigor.


### Example [neo]vim config 

```
call plug#begin('~/.local/share/nvim/plugged')
Plug "https://gitlab.com/metaporia/muse-vim"
call plug#end()

let g:muse_vim_log_dir = ~/sputum/muse

set tabstop = 4
set shiftwidth = 4
set expandtab

inoremap jk <Esc>
let mapleader =','
nnoremap <leader>w :w<CR>

set number
set relativenumber
```
