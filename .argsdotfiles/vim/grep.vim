if executable('rg')
  let g:rg_options = '--vimgrep --ignore-case --hidden'
  let g:rg_globs = ['!.git', '!*.lock', '!*.gpg', '!*.png', '!.yarn', '!.pnp.cjs', '!pnpm-lock.yaml']
  let g:rg_cmd = 'rg ' . g:rg_options . ' ' . join(map(copy(g:rg_globs), "'--glob ' . '''' . v:val . ''''"), ' ')
  let &grepprg=g:rg_cmd
endif

function! Grep(...)
  if empty(a:000)
    let l:query = expand("<cword>")
  else
    let l:query = join(a:000, ' ')
  endif
  cexpr system(&grepprg . ' ' . shellescape(l:query))
endfunction

command! -nargs=* -complete=file_in_path Grep call Grep(<f-args>)

augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost cgetexpr cwindow
  autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

cnoreabbrev <expr> grep (getcmdtype() ==# ':' && getcmdline() ==# 'grep') ? 'Grep' : 'grep'
