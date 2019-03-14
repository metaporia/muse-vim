" Muse 

function! MuseLogEntry()
    execute "normal! Go\<C-r>=strftime(\"%H:%M:%S λ. \")\<CR>"
    call feedkeys('A', ' ')
endfunction

function! MuseLastRead()
    call MuseLogEntry()
    call feedkeys(system("muse lastRead --suppress-newline") . "\<ESC>") 
endfunction

command! LogEntry :call LogEntry()
command! LastRead call MuseLastRead()

" KEYMAPS
if !exists('g:muse_vim_map_keys')
    let g:muse_vim_map_keys = 1
endif

" Sets default prefix to `<leader>`
if !exists('g:muse_vim_prefix')
    let g:muse_vim_prefix = '<leader>'
endif

if g:muse_vim_map_keys
    " continue reading: insert log entry with attribution of most recently read
    " book and author.
    execute "au BufEnter" g:muse_vim_log_dir."/*" "nnoremap ".g:muse_vim_prefix."cr :LastRead<CR>"
    " insert log entry header/timestamp at bottom of file with appropriate
    " indentation
    execute "au BufEnter" g:muse_vim_log_dir."/*" "nnoremap ".g:muse_vim_prefix."tGo<C-r>=strftime(\"%H:%M:%S λ. \")<CR>"
    execute "au BufEnter" g:muse_vim_log_dir."/*" "nnoremap <buffer> ".g_muse_vim_prefix."v o<Esc>16i <Esc>a--- vs ---<Esc>o"
endif

" I set mine to the ~/sputum/muse and sym-link it to ~/.muse/entries; that is I
" `let g:muse_vim_log_dir = ~/sputum/muse`.
if !exists('g:muse_vim_log_dir')
    let g:muse_vim_log_dir = '~/.muse/entries'
endif

" Auto commands
execute "au BufEnter" g:muse_vim_log_dir."/*" "setfiletype muse"
execute "au BufEnter" g:muse_vim_log_dir."/*" 'set efm=%EFile:\ %f,%+C>\ (interactive):l:%c:%m,%+Z>\ %.%#,%+C>\ %.%#'


