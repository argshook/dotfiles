let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste', 'readonly' ],
  \             [ 'relativepath', 'modified' ]
  \           ],
  \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ] ]
  \ },
\ }

let g:lightline.inactive = {
      \ 'left': [ [ 'relativepath', 'modified' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ] ] }
