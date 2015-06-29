" 07/20/2015 Maxim V Bokov
" Add pathogen package manager
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

" Normally, sensible.vim loads after your vimrc
" To overide that script we do next action
runtime! plugin/sensible.vim 

" Used plugins below
" tpope/vim-pathogen
" tpope/vim-sensible
" tpope/vim-repeat
" tpope/vim-surround
" tpope/vim-unimpaired
" tpope/vim-fugitive
" majutsushi/tagbar

" Disable arrow keys for navigation
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Remap <leader>
let mapleader=","

" Read configuration from files
set modeline
set modelines=5

" Show line numbers
set number
"set relativenumber

" Set color scheme 
colorscheme desert

" Set mapping with leader key 
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

" To avoid the problems with undo CTRL-U and CTRL-W
inoremap <silent> <C-W> <C-\><C-O>db
inoremap <silent> <C-U> <C-\><C-O>d0
inoremap <silent> <C-Y> <C-R>"
" Another way of remaping CTRL-U and CTRL-W in insert mode
"inoremap <C-U> <C-G>u<C-U>
"inoremap <C-W> <C-G>u<C-W>
