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
set timeoutlen=400
set ttimeout
set ttimeoutlen=60
set undodir=~/.vim/undodir
set undofile
set virtualedit=onemore
set wildmenu
set wrap

" =============
"    plugins
" =============
call plug#begin('~/.vim/plugged')
Plug 'mofeimw/cirque.vim'
Plug 'mofeimw/peek.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'preservim/vim-pencil'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" =============
"   variables
" =============
let g:is_posix = 1
let w:focus = 1

let g:limelight_conceal_ctermfg = '8'
let g:peekaboo_compact = 1
let g:peekaboo_ins_prefix = "<C-p>"
let g:pencil#wrapModeDefault = "soft"
let g:floaterm_title = ""

" =============
"  appearance
" =============
colorscheme ditto

" status line colors
highlight StatusFile       ctermfg=0    ctermbg=2    cterm=bold
highlight StatusLines      ctermfg=0    ctermbg=7    cterm=bold
highlight StatusBackground ctermfg=none ctermbg=none cterm=bold
highlight StatusTime       ctermfg=0    ctermbg=6    cterm=bold

" coc
highlight CocMenuSel ctermfg=0 ctermbg=6
highlight CocNotificationProgress ctermfg=0
highlight CocSearch ctermfg=6

" =============
"     maps
" =============
let mapleader = "\<Space>"

" === normal mode ===
" buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <C-q> :bdelete<CR>

" window prefix key
nnoremap <C-x> <C-w>

" editing
nnoremap <Backspace> hx
nnoremap $ $l
nnoremap V V$
nnoremap x "_x
nnoremap _d "_d

" clipboard (macOS)
nnoremap <Leader>c 0"+yg_
nnoremap <Leader>v o<esc>"+p
nnoremap <C-c> "+y
nnoremap <C-v> "+P

" ui
nnoremap <silent> <Leader>n :set number!<CR>
nnoremap <silent> <Leader>h :set hlsearch!<CR>
nnoremap <silent> <Leader>p :set spell!<CR>

" show highlight/syntax groups
nnoremap <Leader>? :call SyntaxGroup()<CR>

" --- plugins ---
" fzf
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>s :GFiles<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <Leader>g :PencilToggle<CR>:Goyo<CR>
nnoremap <silent> <Leader>l :Limelight!!<CR>

nnoremap <silent> <Leader>t :FloatermNew<CR>

" === visual mode ===
" indention
vnoremap < <gv$
vnoremap > >gv$
vnoremap = =gv$

" clipboard
vnoremap <C-c> "+y

" delete
vnoremap _d "_d

" === insert mode ===
" coc
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" common typos
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
        return "  " . strftime('%I:%M %p') . " "
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

" coc
function! CheckBackspace()
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
