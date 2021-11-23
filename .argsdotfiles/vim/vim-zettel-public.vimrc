source ~/.argsdotfiles/vim/vim-zettel.vimrc

unmap <leader>ww
command! ZettelPublicIndex edit ~/zettel-public/index.md

function! Publish()
  let l:modified_files = systemlist("git diff origin/main --name-only")
  let l:date = strftime("%Y-%m-%d")
  for l:file in l:modified_files
    let l:cmd = "sed -i 's/date-modified: [0-9-]\\{10,\\}/date-modified: " . l:date . "/' " . l:file
    call system(l:cmd)
    :edit
  endfor

  call MegaSave()
  call jobstart("git push origin main")
endfunction

command! Publish call Publish()
