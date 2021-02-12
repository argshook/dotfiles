let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '17%' }

let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nmap <leader>h :History<cr>
nmap <leader>/ :BLines<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>H :Helptags<cr>
nmap <leader>: :Commands<cr>

inoremap <expr> <c-x><c-f> fzf#vim#complete#path_relative('fd')

function! g:FzfFilesSource()
  let l:base = fnamemodify(expand('%'), ':h:.:S')
  let l:proximity_sort_path = $HOME . '/.cargo/bin/proximity-sort'

  if base == '.'
    return 'rg --files --hidden'
  else
    return printf('rg --files --hidden | %s %s', l:proximity_sort_path, expand('%'))
  endif
endfunction

function! g:FzfSearch()
  let l:fzf_options = join([
    \ '--tiebreak=index',
    \ '-m --preview "bat --color always --style numbers,changes,snip --theme Dracula {1}" --prompt "> " --preview-window noborder',
    \ '--bind="ctrl-w:backward-kill-word,ctrl-u:clear-query"'], ' ')

 call fzf#vim#files('', {
    \ 'source': g:FzfFilesSource(),
    \ 'options': l:fzf_options
    \})
endfunction

noremap <C-p> :call g:FzfSearch()<CR>

function! s:AppendDigraph(digraphLine)
  execute ':normal! a' . substitute(a:digraphLine, '\(\S\+\).*', '\1', '')
  call feedkeys('a')
endfunction

function! g:FzfSearchDigraphs()
  let l:fzf_options = join([], ' ')

  call fzf#run(fzf#wrap({
    \ 'source': 'cat ~/.argsdotfiles/vim/digraphs.txt',
    \ 'options': l:fzf_options,
    \ 'sink': function('s:AppendDigraph'),
    \ }))
endfunction
command! Digraphs cal g:FzfSearchDigraphs()
