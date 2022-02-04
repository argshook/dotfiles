" this function requires prettier executable
function! Prettify(filetype) range
  silent! execute a:firstline . "," . a:lastline . " ! prettier --stdin-filepath filename." . shellescape(a:filetype)
endfunction
command! -range -nargs=1 -complete=filetype Pretty '<,'> call Prettify(<q-args>)
