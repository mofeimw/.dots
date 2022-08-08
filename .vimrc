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
set statusline=%!StatusLine()
set tabstop=4
set timeoutlen=230
set ttimeout
set ttimeoutlen=60
set undodir=~/.vim/undodir
set undofile
set virtualedit=onemore
set wildmenu
set wrap

" =============
"  appearance
" =============
colorscheme ditto

" status line colors
highlight StatusFile       ctermfg=0    ctermbg=2    cterm=bold
highlight StatusLines      ctermfg=0    ctermbg=7    cterm=bold
highlight StatusBackground ctermfg=none ctermbg=none cterm=bold
highlight StatusTime       ctermfg=0    ctermbg=6    cterm=bold

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
nnoremap <silent> <Leader>t :set spell!<CR>

nnoremap <silent> <Leader>g :PencilToggle<CR>:Goyo<CR>
nnoremap <silent> <Leader>l :Limelight!!<CR>

nnoremap <Leader>s :call SyntaxGroup()<CR>

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
" autocommands
" =============
" status line
autocmd FocusGained,WinEnter * highlight StatusTime ctermfg=0 ctermbg=6    cterm=bold | highlight StatusLines ctermfg=0 ctermbg=7    cterm=bold | let w:focus = 1
autocmd FocusLost,WinLeave   * highlight StatusTime ctermfg=0 ctermbg=none cterm=bold | highlight StatusLines ctermfg=0 ctermbg=none cterm=bold | let w:focus = 0

" =============
"   functions
" =============
" status line
function! StatusLine()
    let l:statusline = ""

    let l:statusline .= "%#StatusFile#%{FileModified()}"
    let l:statusline .= "%#StatusMode#%{LinesMode()}"

    let l:statusline .= "%#StatusBackground#"
    let l:statusline .= "%="

    let l:statusline .= "%#StatusTime#%{Time()}"

    return l:statusline
endfunction

function! FileModified()
    if w:focus == 1
        if &modified == 1
            highlight StatusFile ctermfg=0 ctermbg=1 cterm=bold
        else
            highlight StatusFile ctermfg=0 ctermbg=2 cterm=bold
        endif

        return "  " . expand('%:t') . " "
    else
        highlight StatusFile ctermfg=0 ctermbg=8 cterm=bold
        return WindowCenter(expand('%:p'))
    endif
endfunction

function! LinesMode()
    if w:focus == 1
        if mode() == 'n'
            highlight StatusMode ctermfg=0 ctermbg=7 cterm=bold
        elseif mode() == 'i'
            highlight StatusMode ctermfg=0 ctermbg=4 cterm=bold
        elseif mode() =~ '\v(v|V)' || mode() == "\<C-V>"
            highlight StatusMode ctermfg=0 ctermbg=5 cterm=bold
            return "  " . line('v') . "-" . line('.') . " "
        endif
    else
        return ""
    endif

    return "  " . line('.') . ":" . col('.') . " "
endfunction

function! Time()
    if w:focus == 1
        highlight StatusTime ctermfg=0 ctermbg=6 cterm=bold
        return "  " . strftime('%r') . " "
    else
        return ""
    endif
endfunction

" center string in window width
function! WindowCenter(line)
    let l:centered = repeat(" ", (winwidth(0) / 2) - (strlen(a:line) / 2)) . a:line . repeat(" ", (winwidth(0) / 2) - (strlen(a:line) / 2))
    if ((winwidth(0) - strlen(a:line)) % 2) == 0
        let l:centered .= " "
    endif
    return l:centered
endfunction

" syntax/highlight group
function! SyntaxGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" =============
"   variables
" =============
let g:is_posix = 1
let w:focus = 1

let g:limelight_conceal_ctermfg = '8'
let g:peekaboo_compact = 1
let g:peekaboo_ins_prefix = "<C-p>"
let g:pencil#wrapModeDefault = "soft"

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
