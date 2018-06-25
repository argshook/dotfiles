source ~/.vimrc

autocmd FocusGained *.md :normal ggdG"+P
autocmd FocusLost *.md :normal mpggvGg_"+y`p
