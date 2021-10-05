function! ToJira()
  let buffer = join(getline(1,'$'), "\n")
  let output = system('node ~/repos/markdown-to-jira/bin.mjs toJira', buffer)
  normal ggDG
  call setline(1, split(output, '\n'))
endfunction
command! ToJira call ToJira()

function! ToMarkdown()
  let buffer = join(getline(1,'$'), "\n")
  let output = system('node ~/repos/markdown-to-jira/bin.mjs toMarkdown', buffer)
  normal ggDG
  call setline(1, split(output, '\n'))
endfunction
command! ToMarkdown call ToMarkdown()
