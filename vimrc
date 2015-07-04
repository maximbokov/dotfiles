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
" kien/ctrlp.vim
" nanotech/jellybeans.vim
" altercation/vim-colors-solarized
" scrooloose/nerdcommenter
" scrooloose/nerdtree
" edkolev/tmuxline.vim
" bling/vim-airline
" bling/vim-bufferline
" Valloric/YouCompleteMe
" sukima/xmledit
" sjl/gundo.vim

" Set background and font in gvim or vim
if has("gui_running")
	set background=light
	set guifont=Inconsolata\ for\ Powerline:h14
else
	set background=dark
	" Set 256 colors for terminal (for solarized)
	let g:solarized_termcolors=256
endif

" Set color scheme
syntax enable
colorscheme desert

" Disable arrow keys for navigation
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Disable autocomments on a new line for all types of files
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remap <leader>
let mapleader=","

" Read configuration from files
set modeline
set modelines=5

" Show line numbers
set number
"set relativenumber

" Set mapping with leader key
nnoremap <silent> <leader>t :TagbarToggle<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>u :GundoToggle<CR>

" Tagbar settings
let g:tagbar_sort = 0 " Sort members of a type in order they were declared
let g:tagbar_zoomwidth = 0 " Set width of tagbar to the longest currently visible tag while zoomed

" To avoid the problems with undo CTRL-U and CTRL-W
inoremap <silent> <C-W> <C-\><C-O>db
inoremap <silent> <C-U> <C-\><C-O>d0
inoremap <silent> <C-Y> <C-R>"
" Another way of remaping CTRL-U and CTRL-W in insert mode
"inoremap <C-U> <C-G>u<C-U>
"inoremap <C-W> <C-G>u<C-W>

" Open commonly edited files
nmap <leader>ev :edit $MYVIMRC<CR>
nmap <leader>et :edit $HOME/.tmux.conf<CR>
nmap <leader>eb :edit $HOME/.bash_aliases<CR>
nmap <leader>eg :edit $HOME/.gitaliases<CR>

" Reload vimrc file
nmap <leader>rv :source $MYVIMRC<CR>

" Set ctrl settings
let g:ctrlp_map = '<leader>p'

" Make j and k move up and down better for wrapped lines
noremap k gk
noremap j gj
noremap gk k
noremap gj j

" Ctrl-<hjkl> to move windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Show relative line numbers with <leader>l
nmap <leader>l :setlocal relativenumber!<CR>:setlocal number!<CR>

" Hide mode so it shows on the status bar only
set noshowmode

" Highlight current line
set cursorline

" Consistent backspace on all system
set backspace=2

" Clear trailing whitespace
nnoremap <leader>W :%s/\s\+$//<CR><C-o>

if &encoding == "utf-8"
	exe "set listchars=eol:\u00ac,nbsp:\u2423,conceal:\u22ef,tab:\u25b8\u2000,precedes:\u2026,extends:\u2026"
else
	if &listchars ==# 'eol:$'
		set listchars=tab:>  ,trail:-,extends:>,precedes:<,nbsp:+
	endif
endif

" Enable indent folding, but have it disabled by default
:set foldmethod=indent
:set foldlevel=99

" Space to toggle folds
nnoremap <Space> za
vnoremap <Space> za

" Select whole buffer
nnoremap vaa ggvGg_

" Use braces to determine when to auto indent
:set smartindent

" Make Y act like D and C
nnoremap Y y$

" Unmap ex mode
nnoremap Q <nop>

" vim-airline settings
let g:airline#extensions#tabline#enable = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1

" Tmuxline (Configures Tmux's statusbar to match Vim's)
let g:tmuxline_preset = 'full'

" Setup vim-flavored-markdown
augroup markdown
	au!
	au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
