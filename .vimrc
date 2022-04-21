" =======================================
"              mofei's vimrc
" =======================================

" ============== settings ===============
colorscheme nyx

set confirm
set undofile
set history=1000
set undodir=~/.vim/undodir
set virtualedit=onemore
set wrap
set linebreak
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set shiftround
set ignorecase
set smartcase
set hlsearch
set backspace=indent,eol,start
set list
set listchars=tab:▶\ ,trail:•
set showbreak=↪
set mouse=a
set wildmenu
set incsearch

" status line
set laststatus=2
set statusline=
set statusline+=%f
set statusline+=%m\ 
set statusline+=<%l/%L,%c>\ 
set statusline+=%=
set statusline+=[%{strftime('%r')}]

" ================ maps ================
let mapleader = "\<Space>"

" normal mode
nnoremap $ $l
nnoremap V V$
nnoremap x "_x
nnoremap _d "_dd

nnoremap <Leader>n :set nu!<CR>
nnoremap <Leader>h :set hlsearch!<CR>

nnoremap <Leader>y "+yy
nnoremap <Leader>p o<esc>"+p
nnoremap <Leader>c "+y
nnoremap <Leader>v "+p

" visual mode
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

vnoremap <Leader>c "+y

" i suck at spelling lol
iabbrev adn and
iabbrev teh the
iabbrev waht what

" ============== functions ==============
" show color group
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
nnoremap <Leader>s :call SynGroup()<CR>

" =============== plugins ===============
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-wordy'
Plug 'mbbill/undotree'
Plug 'reedes/vim-pencil'
Plug 'panozzaj/vim-autocorrect'
call plug#end()

let g:limelight_conceal_guifg = '#63798F'
let g:pencil#wrapModeDefault = 'soft'

nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <Leader>g :Goyo<CR>
nnoremap <Leader>l :Limelight!!<CR>
nnoremap <Leader>w :TogglePencil<CR>:set nobreakindent<CR>
