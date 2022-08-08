" mofei's vimrc

" =============
"   settings
" =============
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set confirm
set expandtab
set fillchars+=vert:\ 
set history=1000
set hlsearch
set incsearch
set laststatus=2
set linebreak
set list
set listchars=tab:»\ ,trail:•
set mouse=a
set noruler
set noshowmode
set notermguicolors
set shiftround
set shiftwidth=4
set showbreak=↪
set smartcase
set smarttab
set softtabstop=4
set spellcapcheck=
set tabstop=4
set ttimeout
set ttimeoutlen=50
set undodir=~/.vim/undodir
set undofile
set virtualedit=onemore
set wildmenu
set wrap

let g:is_posix = 1

" =============
"     maps
" =============
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

" =============
"  appearance
" =============
colorscheme ditto

" =============
"  status bar
" =============
let w:focus = 1

function! FileModified()
    if w:focus == 1
        if &modified == 1
            highlight StatusFile ctermfg=0 ctermbg=1 cterm=bold
        else
            highlight StatusFile ctermfg=0 ctermbg=6 cterm=bold
        endif
    else
        highlight StatusFile ctermfg=0 ctermbg=8 cterm=bold
    endif

    return expand('%:t')
endfunction

function! LinesMode()
    if w:focus == 1
        if mode() == 'n'
            highlight StatusLines ctermfg=0 ctermbg=8 cterm=bold
        elseif mode() == 'i'
            highlight StatusLines ctermfg=0 ctermbg=7 cterm=bold
        elseif mode() =~ '\v(v|V)' || mode() == "\<C-V>"
            highlight StatusLines ctermfg=0 ctermbg=2 cterm=bold
            return line('v') . "-" . line('.')
        endif
    else
        return ""
    endif

    return line('.') . ":" . col('.')
endfunction

function! Time()
    if w:focus == 1
        return strftime('%r')
    else
        return ""
    endif
endfunction

function! StatusLine()
    set statusline=

    set statusline+=%#StatusFile#\ %{FileModified()}\ 
    set statusline+=%#StatusLines#\ %{LinesMode()}\ 

    set statusline+=%#StatusBackground#
    set statusline+=%=

    set statusline+=%#StatusTime#\ %{Time()}\ 
endfunction

highlight StatusFile       ctermfg=0    ctermbg=6    cterm=bold
highlight StatusLines      ctermfg=0    ctermbg=6    cterm=bold
highlight StatusBackground ctermfg=none ctermbg=none
highlight StatusTime       ctermfg=0    ctermbg=3    cterm=bold

autocmd FocusGained * hi StatusTime ctermfg=0 ctermbg=3    cterm=bold | hi StatusLines ctermfg=0 ctermbg=8    cterm=bold | let w:focus = 1
autocmd FocusLost   * hi StatusTime ctermfg=0 ctermbg=none cterm=bold | hi StatusLines ctermfg=0 ctermbg=none cterm=bold | let w:focus = 0

call StatusLine()

" =============
" autocommands
" =============
autocmd BufReadPre,FileReadPre * source $MYVIMRC
autocmd User GoyoLeave nested source $MYVIMRC

" =============
"   functions
" =============
function! SyntaxGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

nnoremap <Leader>s :call SyntaxGroup()<CR>

" =============
"    plugins
" =============
call plug#begin('~/.vim/plugged')
Plug 'mofeimw/cirque.vim'
Plug 'mofeimw/peek.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'preservim/vim-pencil'
call plug#end()

let g:limelight_conceal_guifg = '8'
let g:peekaboo_compact = 1
let g:peekaboo_ins_prefix = "<C-p>"
let g:pencil#wrapModeDefault = "soft"

nnoremap <silent> <Leader>g :PencilToggle<CR><Bar>:Goyo<CR>
nnoremap <silent> <Leader>l :Limelight!!<CR>
