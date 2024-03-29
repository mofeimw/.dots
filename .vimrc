" ---------------
"  _ _  _  |` _ ·
" | | |(_)~|~(/_|
" _______________

colorscheme ditto

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set confirm
set expandtab
set exrc
set fillchars+=vert:\ 
set hidden
set history=666
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
set shortmess-=S
set showbreak=↪
set smartcase
set smarttab
set softtabstop=4
set spellcapcheck=
set statusline=%!StatusLine()
set tabstop=4
set timeoutlen=500
set ttimeout
set ttimeoutlen=60
set undodir=~/.vim/undo
set undofile
set wildmenu
set wrap

" ===============
"    variables
" ===============
let g:is_posix = 1
let w:focus = 1

" blinking bar in insert mode
let &t_SI = "\e[6 q"
" block cursor everywhere else
let &t_EI = "\e[2 q"

let g:limelight_conceal_ctermfg = '8'
let g:pencil#wrapModeDefault = "soft"
let g:floaterm_title = ""
let g:buftabline_show = 1

" =============
"    plugins
" =============
" install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'mofeimw/cirque.vim'
Plug 'mofeimw/peek.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'preservim/vim-pencil'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-buftabline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'sheerun/vim-polyglot'
call plug#end()

" =============
"    keymaps
" =============
" prefix keys
let mapleader = "\<space>"
nnoremap <c-x> <c-w>

" === normal mode ===
" editing
nnoremap <backspace> x
nnoremap _d "_d
nnoremap x "_x
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" clipboard
nnoremap <c-c> "+y
nnoremap <c-y> "+y
nnoremap <c-p> "+p

" interface
nnoremap <silent> <leader>k :set number!<cr>
nnoremap <silent> <leader>h :set hlsearch!<cr>

" writing
nnoremap <silent> <leader>s :set spell!<cr>
nnoremap <silent> <leader>g :Goyo<cr>
nnoremap <silent> <leader>l :Limelight!!<cr>

" buffers
" toggle last two buffers
nnoremap <leader>. <c-^>
nnoremap <leader>n :bnext<cr>
nnoremap <leader>p :bprevious<cr>
nnoremap <silent> <leader>w :bdelete<cr>
nmap <leader>1 <plug>BufTabLine.Go(1)
nmap <leader>2 <plug>BufTabLine.Go(2)
nmap <leader>3 <plug>BufTabLine.Go(3)
nmap <leader>4 <plug>BufTabLine.Go(4)
nmap <leader>5 <plug>BufTabLine.Go(5)
nmap <leader>6 <plug>BufTabLine.Go(6)
nmap <leader>7 <plug>BufTabLine.Go(7)
nmap <leader>8 <plug>BufTabLine.Go(8)
nmap <leader>9 <plug>BufTabLine.Go(9)

" fzf
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>d :GFiles<cr>
nnoremap <silent> <leader>b :Buffers<cr>

" CoC
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)

" floaterm
nnoremap <silent> <leader>x :FloatermToggle<cr>

" highlight/syntax group
nnoremap <leader>? :call SyntaxGroup()<cr>

" === insert mode ===
inoremap qq <esc>
inoremap jk <esc>

" === visual mode ===
" indention
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" clipboard
vnoremap <c-c> "+y
vnoremap <c-y> "+y

" deletion
vnoremap _d "_d

" ==================
"    autocommands
" ==================
" status line
autocmd FocusGained,WinEnter * call FocusGained()
autocmd FocusLost,WinLeave   * call FocusLost()

" goyo
autocmd User GoyoEnter call GoyoEnter()
autocmd User GoyoLeave call GoyoLeave()

" :help
autocmd FileType help wincmd L

" markdown -> PDF
autocmd BufwritePost *.md silent !file="%:p" && pandoc "$file"
    \ -f "commonmark"
    \ --pdf-engine="xelatex"
    \ -V "geometry:margin=1in"
    \ -o $(basename "$file" .md).pdf &

" LaTeX -> PDF
autocmd BufwritePost *.tex silent !file="%:p" && pdflatex -interaction=nonstopmode -halt-on-error "$file" > /dev/null 2>&1

" disable autocomplete
"!!!!!!!!!!autocmd BufReadPre *.txt,*.md,*.tex let b:coc_suggest_disable = 1

" ===============
"    functions
" ===============
" focus
function! FocusGained()
    if &laststatus != 2
        set laststatus=2
    endif

    if !exists('#goyo')
        let w:focus = 1
        let g:buftabline_show = 1
        call buftabline#update(0)
    endif

    hi StatusTime  ctermfg=0 ctermbg=6 guifg=#232530 guibg=#bfc4f2 cterm=bold
    hi StatusLines ctermfg=0 ctermbg=7 guifg=#232530 guibg=#F9CEC3 cterm=bold
endfunction

function! FocusLost()
    if winwidth(0) > 88
        set laststatus=0
    endif

    if !exists('#goyo')
        let w:focus = 0
        let g:buftabline_show = 0
        call buftabline#update(0)
    endif

    hi StatusTime  ctermfg=0 ctermbg=NONE guifg=#232530 guibg=NONE cterm=bold
    hi StatusLines ctermfg=0 ctermbg=NONE guifg=#232530 guibg=NONE cterm=bold
endfunction

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
            hi StatusFile ctermfg=0 ctermbg=1 guifg=#232530 guibg=#D65C78 cterm=bold
        else
            hi StatusFile ctermfg=0 ctermbg=2 guifg=#232530 guibg=#70B574 cterm=bold
        endif

        return "  " . expand('%:t') . " "
    else
        hi StatusFile ctermfg=0 ctermbg=8 guifg=#232530 guibg=#63798F cterm=bold
        return WindowCenter(expand('%:p'))
    endif
endfunction

function! LinesMode()
    if w:focus == 1
        if mode() == 'n'
            hi StatusMode ctermfg=0 ctermbg=7 guifg=#232530 guibg=#F9CEC3 cterm=bold
        elseif mode() == 'i'
            hi StatusMode ctermfg=0 ctermbg=4 guifg=#232530 guibg=#15A6B1 cterm=bold
        elseif mode() =~ '\v(v|V)' || mode() == "\<c-v>"
            hi StatusMode ctermfg=0 ctermbg=5 guifg=#232530 guibg=#B08CCC cterm=bold
            return "  " . line('v') . "-" . line('.') . " "
        endif
    else
        return ""
    endif

    return "  " . line('.') . ":" . col('.') . " "
endfunction

function! Time()
    if w:focus == 1
        hi StatusTime ctermfg=0 ctermbg=6 guifg=#232530 guibg=#bfc4f2 cterm=bold
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

" highlight/syntax group
function! SyntaxGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction

" goyo
function! GoyoEnter()
    set showtabline=0
    silent Pencil
    silent CocDisable
    set list

    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! GoyoLeave()
    set showtabline=1
    call buftabline#update(0)
    silent PencilOff
    silent CocEnable

    if b:quitting " && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
            qa!
        else
            qa
        endif
    endif
endfunction

" CoC check for backspace
function! CheckBackspace()
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
