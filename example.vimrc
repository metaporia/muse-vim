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

