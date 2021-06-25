let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste', 'readonly' ],
  \             [ 'folder', 'filename', 'modified' ]
  \           ],
  \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'folder': 'GetCurrentFolder'
  \ },
\ }

let g:lightline.inactive = {
      \ 'left': [ [ 'folder', 'filename', 'modified' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ] ] }


function! GetCurrentFolder()
  return expand('%:p:h:t')
endfunction
