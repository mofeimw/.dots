" ==============================
" ........... ditto ............
" ==============================

set notermguicolors
highlight clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "ditto"

" ..............................

hi Boolean             ctermfg=3
hi Comment             ctermfg=8
hi Conditional         ctermfg=4
hi Constant            ctermfg=6
hi CursorLine          ctermfg=0 ctermbg=6 cterm=none
hi Debug               ctermfg=2
hi Define              ctermfg=5
hi Delimiter           ctermfg=4
hi Directory           ctermfg=3
hi EndOfBuffer         ctermfg=0
hi ErrorMsg            ctermfg=1 ctermbg=none
hi Exception           ctermfg=8
hi Function            ctermfg=5 cterm=bold
hi Identifier          ctermfg=4 cterm=none
hi LineNr              ctermfg=8
hi Macro               ctermfg=2
hi MatchParen          ctermfg=6 ctermbg=none cterm=bold
hi MoreMsg             ctermfg=2
hi Noise               ctermfg=8
hi NonText             ctermfg=8
hi Number              ctermfg=3
hi Operator            ctermfg=2
hi Pmenu               ctermfg=0 ctermbg=8
hi PmenuSel            ctermfg=0 ctermbg=6
hi PmenuSBar           ctermfg=0 ctermbg=0
hi PmenuThumb          ctermfg=0 ctermbg=0
hi PreCondit           ctermfg=2
hi PreProc             ctermfg=1
hi Search              ctermfg=0 ctermbg=6
hi SignColumn          ctermfg=8 ctermbg=0
hi Special             ctermfg=5
hi SpecialKey          ctermfg=8
hi SpellBad            ctermfg=0 ctermbg=1
hi SpellCap            ctermfg=3 ctermbg=1
hi Statement           ctermfg=5
hi StatusLine          ctermfg=8 ctermbg=0 cterm=none
hi StatusLineNC        ctermfg=0
hi String              ctermfg=6
hi Todo                ctermfg=0 ctermbg=6
hi Type                ctermfg=2
hi VertSplit           ctermfg=0 ctermbg=none cterm=none
hi Visual              ctermfg=0 ctermbg=6
hi WarningMsg          ctermfg=1
hi WildMenu            ctermfg=0 ctermbg=6 cterm=bold

hi shConditional       ctermfg=1
hi shDerefSimple       ctermfg=1
hi shDerefVar          ctermfg=1
hi shDerefVarArray     ctermfg=1
hi shDerefWordError    ctermfg=3
hi shFunctionone       ctermfg=6
hi shLoop              ctermfg=2
hi shQuote             ctermfg=6
hi shRange             ctermfg=2
hi shTestOpr           ctermfg=6

hi htmlEndTag          ctermfg=4
hi htmlSpecialTagName  ctermfg=1
hi htmlTag             ctermfg=4
hi htmlTagName         ctermfg=1
hi htmlTitle           ctermfg=7

hi cssBraces           ctermfg=8
hi cssClassName        ctermfg=4 cterm=none
hi cssIdentifier       ctermfg=1 cterm=none
hi cssProp             ctermfg=7
hi cssTagName          ctermfg=5
hi cssUnitDecorators   ctermfg=6
hi cssValueLength      ctermfg=6
hi cssValueNumber      ctermfg=3

hi jsonBraces          ctermfg=8
hi jsonKeyword         ctermfg=6
hi jsonkeywordMatch    ctermfg=8
hi jsonQuote           ctermfg=8
hi jsonString          ctermfg=7

hi markdownH1          ctermfg=4
hi markdownH2          ctermfg=3
hi markdownH3          ctermfg=6
hi markdownHeadingRule ctermfg=8

" ..............................

hi StatusFile       ctermfg=0    ctermbg=2    cterm=bold
hi StatusLines      ctermfg=0    ctermbg=7    cterm=bold
hi StatusBackground ctermfg=none ctermbg=none cterm=bold
hi StatusTime       ctermfg=0    ctermbg=6    cterm=bold

hi BufTabLineCurrent ctermfg=0 ctermbg=6 cterm=bold
hi BufTabLineActive  ctermfg=0 ctermbg=8 cterm=bold
hi BufTabLineHidden  ctermfg=0 ctermbg=8 cterm=bold
hi BufTabLineFill    ctermbg=0

hi CocMenuSel              ctermfg=0 ctermbg=6
hi CocNotificationProgress ctermfg=0
hi CocSearch               ctermfg=6

hi FloatermBorder ctermfg=6

" ..............................

if &background == "light"
    hi Normal ctermfg=0
endif
