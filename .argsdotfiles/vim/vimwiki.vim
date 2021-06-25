let g:vimwiki_key_mappings =
  \ {
  \ 'headers': 0,
  \ }
let g:vimwiki_conceallevel = 3
let g:vimwiki_folding = 'custom'
autocmd BufNewFile,BufReadPost ~/zettel set filetype=markdown
let g:vimwiki_list = [
  \{'path': '~/zettel/', 'ext': '.md', 'syntax': 'markdown', 'auto_tags': 1, 'nested_syntaxes': {'js':'javascript', 'ts': 'typescript' }},
  \{'path': '~/zettel/work', 'ext': '.md', 'syntax': 'markdown', 'auto_tags': 1, 'nested_syntaxes': {'js':'javascript', 'ts': 'typescript' }}
  \]

