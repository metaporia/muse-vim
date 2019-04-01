" Muse 
" TODO 
" □  refactor w filetype=muse
" □  add syntax highlighting 
" □  add search interface (prepopulate scratch buffer w default `Input` vals;
"    users navigates to fields relevant to lookup, commits search; voilà! 

function! MuseLogEntry()
    execute "normal! Go\<C-r>=strftime(\"%H:%M:%S λ. \")\<CR>"
    call feedkeys('A', ' ')
endfunction

function! MuseLastRead()
    call MuseLogEntry()
    call feedkeys(system("muse lastRead --suppress-newline") . "\<ESC>") 
endfunction

function! MuseToday()
    let l:year = strftime("%Y")[2:3] . "."
    let l:day_month = strftime("%m.%d")
    let l:cmd =  "edit " . g:muse_vim_log_dir . "/" . l:year . l:day_month
    execute l:cmd
endfunction

command! LogToday :call MuseToday()
command! LogEntry :call MuseLogEntry()
command! LastRead call MuseLastRead()

" KEYMAPS
if !exists('g:muse_vim_map_keys')
    let g:muse_vim_map_keys = 1
endif

" Sets default prefix to `<leader>`
if !exists('g:muse_vim_prefix')
    let g:muse_vim_prefix = '<leader>'
endif

" I set mine to the ~/sputum/muse and sym-link it to ~/.muse/entries; that is I
" `let g:muse_vim_log_dir = ~/sputum/muse`.
if !exists('g:muse_vim_log_dir')
    let g:muse_vim_log_dir = '~/.muse/entries'
endif


if g:muse_vim_map_keys
    " continue reading: insert log entry with attribution of most recently read
    " book and author.
    execute "au BufEnter" g:muse_vim_log_dir."/*" "nnoremap ".g:muse_vim_prefix."cr :LastRead<CR>"
    " insert log entry header/timestamp at bottom of file with appropriate
    " indentation
    execute "au BufEnter" g:muse_vim_log_dir."/*" "nnoremap ".g:muse_vim_prefix."t Go<C-r>=strftime(\"%H:%M:%S λ. \")<CR>"
    execute "au BufEnter" g:muse_vim_log_dir."/*" "nnoremap <buffer> ".g:muse_vim_prefix."v o<Esc>16i <Esc>a--- vs ---<Esc>o"
endif

" Auto commands
execute "au BufEnter" g:muse_vim_log_dir."/*" "setfiletype muse"
execute "au BufEnter" g:muse_vim_log_dir."/*" 'set efm=%EFile:\ %f,%+C>\ (interactive):l:%c:%m,%+Z>\ %.%#,%+C>\ %.%#'


