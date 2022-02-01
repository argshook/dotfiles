if executable('rg')
  set grepprg=rg\ --vimgrep\ --ignore-case\ --hidden\ --glob\ '!.git'\ --glob\ '!*.gpg'\ --glob\ '!*.png'
endif

function! Grep(...)
  if empty(a:000)
    let l:query = expand("<cword>")
  else
    let l:query = expandcmd(join(a:000, ' '))
  endif

  return system(join([&grepprg] + [l:query], ' '))
endfunction

command! -nargs=* -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=* -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)

augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost cgetexpr cwindow
  autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

cnoreabbrev <expr> grep (getcmdtype() ==# ':' && getcmdline() ==# 'grep') ? 'Grep' : 'grep'
