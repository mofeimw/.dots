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
highlight Constant            ctermfg=6
highlight Debug               ctermfg=2
highlight Define              ctermfg=5
highlight Delimiter           ctermfg=4
highlight Directory           ctermfg=3
highlight ErrorMsg            ctermfg=1 ctermbg=none
highlight Exception           ctermfg=8
highlight Function            ctermfg=5 cterm=bold
highlight Identifier          ctermfg=4 cterm=none
highlight LineNr              ctermfg=8
highlight Macro               ctermfg=2
highlight MatchParen          ctermfg=0 ctermbg=6
highlight MoreMsg             ctermfg=2
highlight Noise               ctermfg=8
highlight NonText             ctermfg=8
highlight Number              ctermfg=3
highlight Operator            ctermfg=2
highlight Pmenu               ctermfg=0 ctermbg=6
highlight PreCondit           ctermfg=2
highlight PreProc             ctermfg=1
highlight Search              ctermfg=0 ctermbg=6
highlight SignColumn          ctermfg=8 ctermbg=0
highlight Special             ctermfg=5
highlight SpecialKey          ctermfg=8
highlight SpellBad            ctermfg=0 ctermbg=1
highlight SpellCap            ctermfg=3 ctermbg=1
highlight Statement           ctermfg=6
highlight StatusLine          ctermfg=0 ctermbg=8
highlight StatusLineNC        ctermfg=0
highlight String              ctermfg=4
highlight Type                ctermfg=2
highlight VertSplit           ctermfg=0 ctermbg=none cterm=none
highlight Visual              ctermfg=0 ctermbg=6
highlight WarningMsg          ctermfg=1
highlight WildMenu            ctermfg=0 ctermbg=6 cterm=bold

highlight shConditional       ctermfg=1
highlight shDerefSimple       ctermfg=1
highlight shDerefVar          ctermfg=1
highlight shDerefVarArray     ctermfg=1
highlight shDerefWordError    ctermfg=3
highlight shFunctionone       ctermfg=6
highlight shLoop              ctermfg=2
highlight shQuote             ctermfg=6
highlight shRange             ctermfg=2
highlight shTestOpr           ctermfg=6

highlight htmlEndTag          ctermfg=4
highlight htmlSpecialTagName  ctermfg=1
highlight htmlTag             ctermfg=4
highlight htmlTagName         ctermfg=1
highlight htmlTitle           ctermfg=7

highlight cssBraces           ctermfg=8
highlight cssClassName        ctermfg=4 cterm=none
highlight cssIdentifier       ctermfg=1 cterm=none
highlight cssProp             ctermfg=7
highlight cssTagName          ctermfg=5
highlight cssUnitDecorators   ctermfg=6
highlight cssValueLength      ctermfg=6
highlight cssValueNumber      ctermfg=3

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
