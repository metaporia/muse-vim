if exists("b:current_syntax")
    finish
endif

echom "Syntax highlighting code goes here."

" KEYWORDS

syn keyword defPrefix d dvs
syn keyword readPrefix read finish
"[begin to] read
"finish [reading]
synt keyword commentaryPrefix commentary
synt keyword phrasePrefix phrase phr
synt keyword dialoguePrefix dialogue
synt keyword quotePrefix quotation q


" MATCHES

syn match timestamp '^ \+\d\+:\d\+:\d\+'

" REGIONS

syn region quotedArea start='"' end='"'

let b:current_syntax = "muse"
