call tinykeymap#EnterMap("windows", g:tinykeymap#map#windows#map, {
      \ 'name': 'windows mode',
      \ 'message': 'winnr() .": ". bufname("%")'
      \ })

call tinykeymap#Map('windows', 'K', 'wincmd K', {'desc': 'Move current window to the top'})
call tinykeymap#Map('windows', 'J', 'wincmd J', {'desc': 'Move current window to the bottom'})
call tinykeymap#Map('windows', 'H', 'wincmd H', {'desc': 'Move current window to the left'})
call tinykeymap#Map('windows', 'L', 'wincmd L', {'desc': 'Move current window to the right'})
call tinykeymap#Map('windows', 'T', 'wincmd T', {'desc': 'Move current window to a new tab page'})
call tinykeymap#Map('windows', 'c', 'wincmd c', {'desc': 'Close window'})
call tinykeymap#Map('windows', 's', 'split')
call tinykeymap#Map('windows', 'v', 'vert split')

call tinykeymap#Map('windows', 'h', 'noh', {'desc': 'Quit tinykeymode', 'exit': 1})
call tinykeymap#Map('windows', 'j', 'noh', {'desc': 'Quit tinykeymode', 'exit': 1})
call tinykeymap#Map('windows', 'k', 'noh', {'desc': 'Quit tinykeymode', 'exit': 1})
call tinykeymap#Map('windows', 'l', 'noh', {'desc': 'Quit tinykeymode', 'exit': 1})

