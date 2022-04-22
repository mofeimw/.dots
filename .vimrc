" =====================================================================================
"                                   mofei's vimrc
" =====================================================================================

" ==================================== settings =======================================

colorscheme nyx

set confirm
set mouse=a
set wildmenu
set wrap
set linebreak
set autoindent
set shiftround
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set ignorecase
set smartcase
set incsearch
set hlsearch
set list
set listchars=tab:▶\ ,trail:•
set showbreak=↪
set backspace=indent,eol,start
set ttimeout
set ttimeoutlen=50
set undofile
set history=1000
set undodir=~/.vim/undodir
set virtualedit=onemore

" ====================================== maps =========================================

let mapleader = "\<Space>"

" normal mode
nnoremap <Backspace> xh
nnoremap $ $l
nnoremap V V$
nnoremap x "_x
nnoremap _d "_dd

nnoremap <Leader>y "+yy
nnoremap <Leader>p o<esc>"+p
nnoremap <Leader>c "+y
nnoremap <Leader>v "+p

nnoremap <Leader>n :set number!<CR>
nnoremap <Leader>h :set hlsearch!<CR>

" visual mode
vnoremap < <gv$
vnoremap > >gv$
vnoremap = =gv$

vnoremap <Leader>c "+y
vnoremap <Leader>y "+y

" i suck at spelling lol
iabbrev adn and
iabbrev teh the
iabbrev waht what

" =================================== status bar ======================================

hi Lines guibg=#63798F guifg=#232530 cterm=bold
hi Background guibg=#232530 guifg=#232530
hi Time guibg=#15A6B1 guifg=#232530 cterm=bold

function! CheckMod(mod)
    if a:mod == 1
        hi Mod guibg=#D65C78 guifg=#232530 cterm=bold
        return expand('%:t')
    else
        hi Mod guibg=#50C08E guifg=#232530 cterm=bold
        return expand('%:t')
    endif
endfunction

au InsertEnter * hi Lines guibg=#F9CEC3 guifg=#232530 cterm=bold
au InsertLeave * hi Lines guibg=#63798F guifg=#232530 cterm=bold

set laststatus=2
set statusline=

set statusline+=%#Mod#\ %{CheckMod(&modified)}\ 
set statusline+=%#Lines#\ %l:%c\ 

set statusline+=%#Background#
set statusline+=%=

set statusline+=%#Time#\ %{strftime('%r')}\ 

" =================================== functions =======================================

" show color group
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
nnoremap <Leader>s :call SynGroup()<CR>

" ==================================== plugins ========================================

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'mhinz/vim-startify'
call plug#end()

autocmd! User GoyoLeave nested source $MYVIMRC

let g:limelight_conceal_guifg = '#63798F'

nnoremap <Leader>g :Goyo<CR>
nnoremap <Leader>l :Limelight!!<CR>
