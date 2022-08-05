" =====================================================================================
"                                   mofei's vimrc
" =====================================================================================

" ==================================== settings =======================================

set confirm
set noshowmode
set noruler
set mouse=a
set wildmenu
set wrap
set spellcapcheck=
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
set listchars=tab:»\ ,trail:•
set showbreak=↪
set backspace=indent,eol,start
set ttimeout
set ttimeoutlen=50
set undofile
set history=1000
set undodir=~/.vim/undodir
set virtualedit=onemore

let g:is_posix = 1

" ====================================== maps =========================================

let mapleader = "\<Space>"

" normal mode
nnoremap <Backspace> hx
nnoremap $ $l
nnoremap V V$
nnoremap x "_x
nnoremap _d "_dd

nnoremap <Leader>u <C-R>
nnoremap <Leader>y 0"+yg_
nnoremap <Leader>p o<esc>"+p
nnoremap <Leader>c "+y
nnoremap <Leader>v "+p

nnoremap <silent> <Leader>n :set number!<CR>
nnoremap <silent> <Leader>h :set hlsearch!<CR>
nnoremap <silent> <Leader>sp :set spell!<CR>

" visual mode
vnoremap < <gv$
vnoremap > >gv$
vnoremap = =gv$

vnoremap <Leader>c "+y
vnoremap <Leader>y "+y

vnoremap _d "_d

" insert mode
inoremap <C-r> <C-O>g^
inoremap <C-e> <C-O>g$<C-O>a 

inoremap <C-b> <C-O>b
inoremap <C-f> <C-O>w

inoremap <C-j> <C-O>j
inoremap <C-k> <C-O>k

iabbrev adn and
iabbrev teh the
iabbrev waht what

" plugins
nnoremap <silent> <Leader>g :PencilToggle<CR><Bar>:Goyo<CR>
nnoremap <silent> <Leader>l :Limelight!!<CR>

" ==================================== appearance =====================================

colorscheme ditto

set fillchars+=vert:\ 

hi EndOfBuffer guifg=bg

hi VertSplit guibg=bg
hi StatusLineNC guifg=bg

hi CirqueHeader guifg=#D65C78 cterm=bold
hi CirqueBracket guifg=#B08CCC
hi CirqueNumber guifg=#B08CCC
hi CirqueSection guifg=#D65C78 cterm=bold
hi CirqueSpecial guifg=#50C08E
hi CirquePath guifg=#63798F
hi CirqueSlash guifg=#63798F
hi CirqueFile guifg=#15A6B1

" =================================== status bar ======================================

let focus = 1

function! FileModified(modified, focus)
    if a:focus == 1
        if a:modified == 1
            hi Mod guibg=#D65C78 guifg=#232530 cterm=bold
        else
            hi Mod guibg=#50C08E guifg=#232530 cterm=bold
        endif
    else
        hi Mod guibg=#63798F guifg=#232530 cterm=bold
    endif

    return expand('%:t')
endfunction

function! LinesMode(focus)
    if a:focus == 1
        if mode() == 'n'
            hi Lines guibg=#63798F guifg=#232530 cterm=bold
        elseif mode() == 'i'
            hi Lines guibg=#F9CEC3 guifg=#232530 cterm=bold
        elseif mode() =~ '\v(v|V)' || mode() == "\<C-V>"
            return line('v') . "-" . line('.')
        endif
    endif

    return line('.') . ":" . col('.')
endfunction

set laststatus=2
set statusline=

set statusline+=%#Mod#\ %{FileModified(&modified,\ focus)}\ 
set statusline+=%#Lines#\ %{LinesMode(focus)}\ 

set statusline+=%#Background#
set statusline+=%=

set statusline+=%#Time#\ %{strftime('%r')}\ 

hi Lines guibg=#63798F guifg=#232530 cterm=bold
hi Background guibg=#232530 guifg=#232530
hi Time guibg=#15A6B1 guifg=#232530 cterm=bold

au FocusGained * hi Time guibg=#15A6B1 guifg=#232530 cterm=bold | hi Lines guibg=#63798F guifg=#232530 cterm=bold | let focus = 1
au FocusLost * hi Time guibg=#63798F guifg=#232530 cterm=bold | hi Lines guibg=#232530 guifg=#232530 cterm=bold | let focus = 0

" ================================== autocommands =====================================

autocmd! BufReadPre,FileReadPre * source $MYVIMRC
autocmd! User GoyoLeave nested source $MYVIMRC

" =================================== functions =======================================

" show color group
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
nnoremap <Leader>s :call SynGroup()<CR>

" ==================================== plugins ========================================

call plug#begin('~/.vim/plugged')
Plug 'mofeimw/cirque.vim'
Plug 'mofeimw/peek.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'preservim/vim-pencil'
Plug 'dylanaraps/wal.vim'
call plug#end()

let g:limelight_conceal_guifg = '#63798F'
let g:peekaboo_compact = 1
let g:peekaboo_ins_prefix = "<C-z>"
let g:pencil#wrapModeDefault = 'soft'

if !empty(glob("~/.cache/wal/colors"))
    colorscheme wal
    set notermguicolors
    set laststatus=0
endif
