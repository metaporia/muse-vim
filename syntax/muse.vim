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
" dvs
syn match inlines '\(dvs\|d\|phrase\|phr\) \+\zs\"*\(\a\|[^x00-x7F]\)\+\>\"*\ze *:' 
syn match dvsHwLn1 'dvs \+\zs\(\a\|[^x00-x7F]\)\+\>\ze *:' 
syn match dvsHwLn2 '^\_s\+\(\a\|[^()[]{}_-0-9!@#$%^&*()=+x00-x7F]\)\+\>\ze *:' contains=note
" \(\a\|[^x00-x7F]\)\+

syn match comma ','

" headwords (plural) 
syn match defHws '\. \+\(d\|phrase\|phr\) \zs\(\a\|[^x00-x7F]\)\+$' contains=comma

" inline def
"syn match inlineDef 'd \+\zs\(\a\|[^x00-x7F]\)\+\>\ze *:' 
" match from (phr | phrase | d | dvs) until ' :'
"syn match headword '\. \(dvs\|d\|phrase\|phr\)\_s*\zs\<.\{-}\>'

" read titlestr
syn match titleStr '\(begin to read\|finish reading\|finish\|read\) \+\zs\"\(\a\|[^x00-x7F]\)\+\"'


"syn region headword2ndLn start='--- vs ---\_s*\zs\<.' skip='.\{-}' end='\>'
"syn region dvsHwLn1 start='dvs \zs\<' skip='^[\s]*' end='\>'
syn match quotedArea '^\s\+\"\_[^\"]\{-}\"\s*\n'

syn match timestamp '^ *\d\+:\d\+:\d\+'


syn match note '[^\a]\+\zs\(N\.B\.\|Note\)\ze *:*'
hi def link quotedArea Special
"hi def link quoteBody String
hi def link dvsHwLn1 Identifier
hi def link dvsHwLn2 Identifier
hi def link defHws Function
hi def link inlines String
hi def link comma None
hi def link note Todo
hi def link titleStr Label
hi def link timestamp Number

"hi def link defPrefix Keyword
"hi def link readPrefix Keyword
"hi def link phrasePrefix Keyword
"hi def link commentaryPrefix Keyword
"hi def link dialoguePrefix Keyword
"hi def link quotePrefix Keyword

let b:current_syntax = "muse"
