" =====================================
" ............... ditto ...............
" =====================================

set notermguicolors
highlight clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "ditto"

" .....................................

highlight Boolean             ctermfg=3
highlight Comment             ctermfg=8
highlight Conditional         ctermfg=4
highlight Constant            ctermfg=2
highlight Debug               ctermfg=2
highlight Define              ctermfg=5
highlight Delimiter           ctermfg=4
highlight Directory           ctermfg=3
highlight ErrorMsg            ctermfg=1
highlight Exception           ctermfg=8
highlight Function            ctermfg=5 cterm=bold
highlight Identifier          ctermfg=4 cterm=none
highlight LineNr              ctermfg=8
highlight Macro               ctermfg=2
highlight MatchParen          ctermbg=4
highlight MoreMsg             ctermfg=2
highlight Noise               ctermfg=8
highlight NonText             ctermfg=8
highlight Number              ctermfg=3
highlight Operator            ctermfg=2
highlight PreCondit           ctermfg=2
highlight ProProc             ctermfg=1
highlight Search              ctermfg=0 ctermbg=6
highlight Special             ctermfg=3
highlight SpecialKey          ctermfg=8
highlight SpellBad            ctermfg=0 ctermbg=1
highlight SpellCap            ctermfg=3 ctermbg=1
highlight Statement           ctermfg=6
highlight String              ctermfg=4
highlight Type                ctermfg=2
highlight Visual              ctermfg=0 ctermbg=6
highlight WarningMsg          ctermfg=1

highlight shConditional       ctermfg=3
highlight shDerefSimple       ctermfg=5
highlight shDerefVar          ctermfg=7
highlight shDerefVarArray     ctermfg=7
highlight shDerefWordError    ctermfg=3
highlight shFunctionone       ctermfg=7
highlight shLoop              ctermfg=1
highlight shQuote             ctermfg=6
highlight shRange             ctermfg=2
highlight shTestOpr           ctermfg=2

highlight htmlEndTag          ctermfg=4
highlight htmlSpecialTagName  ctermfg=1
highlight htmlTag             ctermfg=4
highlight htmlTagName         ctermfg=1
highlight htmlTitle           ctermfg=7

highlight cssBraces           ctermfg=8
highlight cssClassName        ctermfg=4 cterm=none
highlight cssIdentifier       ctermfg=1 cterm=none
highlight cssProp             ctermfg=7
highlight cssTagName          ctermfg=3

highlight jsonBraces          ctermfg=8
highlight jsonKeyword         ctermfg=6
highlight jsonkeywordMatch    ctermfg=8
highlight jsonQuote           ctermfg=8
highlight jsonString          ctermfg=7

highlight markdownH1          ctermfg=4
highlight markdownH2          ctermfg=3
highlight markdownH3          ctermfg=6
highlight markdownHeadingRule ctermfg=8

" .....................................

if &background == "light"
    highlight Normal ctermfg=0
endif
