" =======================================
"              mofei's vimrc
" =======================================

" ============== settings ===============
" general
set mouse=a
set undofile
set history=1000
set undodir=~/.vim/undodir
set virtualedit=onemore
set confirm
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

nnoremap <Leader>n :set nu!<CR>
nnoremap <Leader>h :set hlsearch!<CR>

nnoremap <Leader>d "_dd
nnoremap <Leader>y "+yy
nnoremap <Leader>p o<esc>"+p
nnoremap <Leader>v "+p

" visual mode
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

vnoremap <Leader>c "+y

" i suck at spelling
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

let g:limelight_conceal_ctermfg = 'green'
let g:pencil#wrapModeDefault = 'soft'

nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <Leader>g :Goyo<CR>
nnoremap <Leader>l :Limelight!!<CR>
nnoremap <Leader>w :TogglePencil<CR>:set nobreakindent<CR>

" ================= nyx =================

" dark:   #232530
" light:  #f9cec3
" red:    #d4516f
" blue:   #1d8991
" orange: #f09383
" green:  #27d796
" purple: #b877db
" grey:   #6c6f93

let g:colors_name = "nyx"
set termguicolors " install vim using brew if disabled!!
set background=dark

highlight Normal guifg=#f9cec3 guibg=#232530
highlight Visual guifg=#232530 guibg=#1d8991
highlight StatusLine guifg=#1d8991 guibg=#232530
highlight LineNr guifg=#6c6f93
highlight SpecialKey guifg=#6c6f93
highlight EndOfBuffer guifg=#6c6f93
highlight Search guifg=#232530 guibg=#27d796
highlight MatchParen guifg=#232530 guibg=#f09383
highlight IncSearch guifg=#27d796
highlight MoreMsg guifg=#27d796
highlight Error guifg=#232530 guibg=#d4516f
highlight ErrorMsg guifg=#d4516f guibg=#232530
highlight WarningMsg guifg=#27d796
highlight WildMenu guifg=#232530 guibg=#d4516f
highlight Question guifg=#27d796
highlight SpellBad guifg=#232530 guibg=#d4516f
highlight SpellCap guifg=#232530 guibg=#b877db
highlight SpellLocal guifg=#232530 guibg=#b877db
highlight SpellRare guifg=#232530 guibg=#b877db

highlight Comment guifg=#6c6f93
highlight Constant guifg=#b877db
highlight NonText guifg=#d4516f
highlight Special guifg=#1d8991
highlight Identifier guifg=#1d8991
highlight Statement guifg=#d4516f
highlight Function guifg=#f09383
highlight Type guifg=#1d8991
highlight Keyword guifg=#d4516f
highlight Boolean guifg=#f09383
highlight Character guifg=#f09383
highlight String guifg=#b877db
highlight Float guifg=#f09383
highlight Number guifg=#f09383
highlight Conditional guifg=#1d8991
highlight Operator guifg=#d4516f
highlight Define guifg=#b877db
highlight Delimiter guifg=#d4516f
highlight PreProc guifg=#1d8991
highlight Title guifg=#f9cec3

highlight cssTagName guifg=#1d8991
highlight cssProp guifg=#d4516f

highlight shFunctionone guifg=#d4516f
