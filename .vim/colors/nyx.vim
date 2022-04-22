let g:colors_name = "nyx"

let s:bg     = "#232530"
let s:fg     = "#F9CEC3"

let s:black  = "#0F161A"
let s:white  = "#F9CEC3"
let s:blue   = "#15A6B1"
let s:red    = "#D65C78"
let s:orange = "#D78374"
let s:green  = "#50C08E"
let s:purple = "#B08CCC"
let s:grey   = "#63798F"

hi clear
syntax reset
set background=dark
hi Normal guifg=#f9cec3 guibg=#232530 gui=NONE ctermbg=NONE

set t_Co=256
let &t_ut=''
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

exe "hi ColorColumn guibg=" s:grey
exe "hi Comment guifg=" s:grey
exe "hi Conditional guifg=" s:blue
exe "hi Constant guifg=" s:purple
exe "hi Debug guifg=" s:green
exe "hi Define guifg=" s:purple
exe "hi Delimiter guifg=" s:blue
exe "hi Directory guifg=" s:orange
exe "hi EndOfBuffer guifg=" s:grey
exe "hi Error guifg=" s:bg " guibg=" s:red
exe "hi ErrorMsg guifg=" s:bg " guibg=" s:red
exe "hi Exception guifg=" s:grey
exe "hi Function guifg=" s:purple
exe "hi Identifier guifg=" s:red
exe "hi Include guifg=" s:purple
exe "hi IncSearch guibg=" s:bg " guifg=" s:green
exe "hi Keyword guifg=" s:red
exe "hi Label guifg=" s:red
exe "hi LineNr guifg=" s:purple
exe "hi Macro guifg=" s:green
exe "hi MatchParen guifg=" s:green " guibg=NONE"
exe "hi MoreMsg guifg=" s:fg
exe "hi Noise guifg=" s:grey
exe "hi NonText guifg=" s:grey " guibg=NONE"
exe "hi Number guifg=" s:purple
exe "hi Operator guifg=" s:green
exe "hi PMenu guifg=" s:bg " guibg=" s:blue
exe "hi PMenuSel guifg=" s:bg " guibg=" s:red
exe "hi PreCondit guifg=" s:green
exe "hi PreProc guifg=" s:blue
exe "hi Question guifg=" s:purple
exe "hi Quote guifg=" s:purple
exe "hi Repeat guifg=" s:green
exe "hi Search guibg=" s:purple " guifg=" s:bg
exe "hi SignColumn guibg=" s:grey
exe "hi Special guifg=" s:orange
exe "hi SpecialComment guifg=" s:grey " guibg=NONE"
exe "hi SpecialChar guifg=" s:orange
exe "hi SpecialKey guifg=" s:grey
exe "hi SpellBad guifg=" s:bg " guibg=" s:red
exe "hi SpellCap guifg=" s:bg " guibg=" s:orange
exe "hi SpellLocal guifg=" s:orange
exe "hi SpellRare guifg=" s:purple
exe "hi StatusLine guibg=" s:bg " guifg=" s:blue
exe "hi StatusLineNC guibg=" s:bg " guifg=" s:fg
exe "hi Statement guifg=" s:red
exe "hi Storage guifg=" s:white
exe "hi String guifg=" s:blue
exe "hi TabLine guifg=" s:blue " guibg=" s:bg
exe "hi TabLineFill guibg=" s:bg
exe "hi Tag guifg=" s:grey
exe "hi Title guifg=" s:purple
exe "hi Todo guifg=" s:bg " guibg=" s:purple
exe "hi Type guifg=" s:orange
exe "hi Underlined guifg=" s:red
exe "hi VertSplit guifg=" s:bg " guibg=" s:red
exe "hi Visual guifg=" s:bg " guibg=" s:purple
exe "hi WarningMsg guifg=" s:red
exe "hi WildMenu guifg=" s:bg " guibg=" s:red

" shell
exe "hi shQuote guifg=" s:purple
exe "hi shFunctionone guifg=" s:green
exe "hi shLoop guifg=" s:orange
exe "hi shConditional guifg=" s:red
exe "hi shRange guifg=" s:green
exe "hi shTestOpr guifg=" s:green
exe "hi shDerefVarArray guifg=" s:purple
exe "hi shDerefSimple guifg=" s:purple
exe "hi shDerefVar guifg=" s:white
exe "hi shDerefWordError guifg=" s:orange

" html
exe "hi htmlTitle guifg=" s:white
exe "hi htmlTag guifg=" s:blue
exe "hi htmlEndTag guifg=" s:blue
exe "hi htmlSpecialTagName guifg=" s:red

" css
exe "hi cssProp guifg=" s:red
exe "hi cssTagName guifg=" s:blue
exe "hi cssBraces guifg=" s:grey
exe "hi cssPseudoClass guifg=" s:green
exe "hi cssPseudoClassfn guifg=" s:green
exe "hi csSAtKeyword guifg=" s:green

hi link cssAttrComma Noise

" json
exe "hi jsonBraces guifg=" s:grey
exe "hi jsonkeywordMatch guifg=" s:grey
