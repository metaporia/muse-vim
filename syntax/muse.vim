if exists("b:current_syntax")
    finish
endif

" KEYWORDS

"syn keyword defPrefix d dvs containedin=headword
"syn keyword readPrefix read finish containedin=titleStr
"[begin to] read
"finish [reading]
"synt keyword commentaryPrefix commentary
"synt keyword phrasePrefix phrase phr containedin=headword
"synt keyword dialoguePrefix dialogue
"synt keyword quotePrefix quotation q containedIn=quoteBody


" MATCHES

syn match timestamp '^ *\d\+:\d\+:\d\+'
"syn match titleStr '\(\(read\|begin to read\|finish reading\|finish\)\ \+\)\@<=\".*\"'
syn match quoteBody '\. q\_s\+\zs\"\_.\{-}"'
" match from (phr | phrase | d | dvs) until ' :'
"syn match headword '\(\. \(dvs\|d\|phrase\|phr\)\|--- vs ---\)\_s*\zs\<.\{-}\>'


" REGIONS

"syn region quotedArea start='"' end='"'


let b:current_syntax = "muse"

"hi def link quotedArea String
hi def link quoteBody String
"hi def link headword String
"hi def link titleStr String
"hi def link timestamp Number

"hi def link defPrefix Keyword
"hi def link readPrefix Keyword
"hi def link phrasePrefix Keyword
"hi def link commentaryPrefix Keyword
"hi def link dialoguePrefix Keyword
"hi def link quotePrefix Keyword
