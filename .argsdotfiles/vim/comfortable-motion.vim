let g:comfortable_motion_interval = 1000.0 / 60.0
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 8.0

nnoremap <silent> <C-d> :call comfortable_motion#flick(200)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-200)<CR>
