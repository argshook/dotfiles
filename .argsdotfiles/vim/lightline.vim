let g:lightline = {
  \ 'colorscheme': 'tokyonight',
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
