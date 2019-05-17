
" Auto commands
execute "au BufEnter" g:muse_vim_log_dir."/*" "setfiletype muse"
execute "au BufEnter" g:muse_vim_log_dir."/*" 'set efm=%EFile:\ %f,%+C>\ (interactive):l:%c:%m,%+Z>\ %.%#,%+C>\ %.%#'


