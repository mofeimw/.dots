" ==============================
" ............ nyx .............
" ==============================

highlight clear
set background=dark

set t_Co=256
let &t_ut=''
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "nyx"

let t0 = "#232530" " black
let t1 = "#D65C78" " red
let t2 = "#70B574" " green
let t3 = "#C7BD81" " yellow
let t4 = "#15A6B1" " blue
let t5 = "#B08CCC" " purple
let t6 = "#bfc4f2" " cyan
let t7 = "#F9CEC3" " white
let t8 = "#63798F" " grey

" ....................................

exe "hi Boolean             guifg=" t3
exe "hi Comment             guifg=" t8
exe "hi Conditional         guifg=" t4
exe "hi Constant            guifg=" t6
exe "hi CursorLine          guifg=" t0 "guibg=" t6 "cterm=NONE"
exe "hi Debug               guifg=" t2
exe "hi Define              guifg=" t5
exe "hi Delimiter           guifg=" t4
exe "hi Directory           guifg=" t3
exe "hi EndOfBuffer         guifg=" t0
exe "hi ErrorMsg            guifg=" t1 "guibg=NONE"
exe "hi Exception           guifg=" t8
exe "hi Function            guifg=" t5 "cterm=bold"
exe "hi Identifier          guifg=" t4 "cterm=NONE"
exe "hi LineNr              guifg=" t8
exe "hi Macro               guifg=" t2
exe "hi MatchParen          guifg=" t6 "guibg=NONE cterm=bold"
exe "hi MoreMsg             guifg=" t2
exe "hi Noise               guifg=" t8
exe "hi NonText             guifg=" t8
exe "hi Number              guifg=" t3
exe "hi Operator            guifg=" t2
exe "hi Pmenu               guifg=" t0 "guibg=" t8
exe "hi PmenuSel            guifg=" t0 "guibg=" t6
exe "hi PmenuSBar           guifg=" t0 "guibg=" t0
exe "hi PmenuThumb          guifg=" t0 "guibg=" t0
exe "hi PreCondit           guifg=" t2
exe "hi PreProc             guifg=" t1
exe "hi Search              guifg=" t0 "guibg=" t6
exe "hi SignColumn          guifg=" t8 "guibg=" t0
exe "hi Special             guifg=" t5
exe "hi SpecialKey          guifg=" t8
exe "hi SpellBad            guifg=" t0 "guibg=" t1
exe "hi SpellCap            guifg=" t3 "guibg=" t1
exe "hi Statement           guifg=" t5
exe "hi StatusLine          guifg=" t8 "guibg=" t0 "cterm=NONE"
exe "hi StatusLineNC        guifg=" t0
exe "hi String              guifg=" t6
exe "hi Title               guifg=" t2
exe "hi Todo                guifg=" t0 "guibg=" t6
exe "hi Type                guifg=" t2
exe "hi VertSplit           guifg=" t0 "guibg=NONE cterm=NONE"
exe "hi Visual              guifg=" t0 "guibg=" t6
exe "hi WarningMsg          guifg=" t1
exe "hi WildMenu            guifg=" t0 "guibg=" t6 "cterm=bold"

exe "hi shConditional       guifg=" t1
exe "hi shDerefSimple       guifg=" t1
exe "hi shDerefVar          guifg=" t1
exe "hi shDerefVarArray     guifg=" t1
exe "hi shDerefWordError    guifg=" t3
exe "hi shFunctionone       guifg=" t6
exe "hi shLoop              guifg=" t2
exe "hi shQuote             guifg=" t6
exe "hi shRange             guifg=" t2
exe "hi shTestOpr           guifg=" t6

exe "hi htmlEndTag          guifg=" t4
exe "hi htmlSpecialTagName  guifg=" t1
exe "hi htmlTag             guifg=" t4
exe "hi htmlTagName         guifg=" t1
exe "hi htmlTitle           guifg=" t7
exe "hi htmlItalic          guifg=" t6
exe "hi htmlH1              guifg=" t1
exe "hi htmlH2              guifg=" t2
exe "hi htmlH3              guifg=" t3

exe "hi cssBraces           guifg=" t8
exe "hi cssClassName        guifg=" t4 "cterm=NONE"
exe "hi cssIdentifier       guifg=" t1 "cterm=NONE"
exe "hi cssProp             guifg=" t7
exe "hi cssTagName          guifg=" t5
exe "hi cssUnitDecorators   guifg=" t6
exe "hi cssValueLength      guifg=" t6
exe "hi cssValueNumber      guifg=" t3

exe "hi jsonBraces          guifg=" t8
exe "hi jsonKeyword         guifg=" t6
exe "hi jsonkeywordMatch    guifg=" t8
exe "hi jsonQuote           guifg=" t8
exe "hi jsonString          guifg=" t7

exe "hi markdownH1          guifg=" t4
exe "hi markdownH2          guifg=" t3
exe "hi markdownH3          guifg=" t6
exe "hi markdownHeadingRule guifg=" t8
exe "hi mkdLineBreak        guifg=" t0

exe "hi CSVDelimiter        guifg=" t8

" ....................................

exe "hi StatusFile       guifg=" t0    "guibg=" t2    "cterm=bold"
exe "hi StatusLines      guifg=" t0    "guibg=" t7    "cterm=bold"
exe "hi StatusBackground guifg=NONE     guibg=NONE     cterm=bold"
exe "hi StatusTime       guifg=" t0    "guibg=" t6    "cterm=bold"

exe "hi BufTabLineCurrent guifg=" t0 "guibg=" t6 "cterm=bold"
exe "hi BufTabLineActive  guifg=" t0 "guibg=" t8 "cterm=bold"
exe "hi BufTabLineHidden  guifg=" t0 "guibg=" t8 "cterm=bold"
exe "hi BufTabLineFill    guibg=" t0

exe "hi CocMenuSel              guifg=" t0 "guibg=" t6
exe "hi CocNotificationProgress guifg=" t0
exe "hi CocSearch               guifg=" t6

exe "hi FloatermBorder guifg=" t6
