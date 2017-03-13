autocmd User VimagitEnterCommit startinsert
autocmd User VimagitBufferInit setlocal foldenable
autocmd User VimagitBufferInit setlocal nocindent
autocmd User VimagitBufferInit nunmap <silent> <buffer> 0
let g:magit_show_help=0
let g:magit_default_sections = [ 'commit', 'staged', 'unstaged', 'stash', 'info', 'global_help' ]

