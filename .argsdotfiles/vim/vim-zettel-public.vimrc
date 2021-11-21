source ~/.argsdotfiles/vim/vim-zettel.vimrc

unmap <leader>ww
command! ZettelPublicIndex edit ~/zettel-public/index.md

function! Publish()
  call jobstart('git push origin main')
endfunction

command! Publish call Publish()
