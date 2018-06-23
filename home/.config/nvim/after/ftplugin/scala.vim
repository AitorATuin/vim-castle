nnoremap <buffer> <silent> <LocalLeader>t :EnType<CR>
nnoremap <buffer> <silent> <LocalLeader>T :EnTypeCheck<CR>
nnoremap <buffer> <silent> K  :EnDocBrowse<CR>
nnoremap <buffer> <silent> gd :EnDeclaration<CR>
nnoremap <buffer> <silent> <C-]>  :EnDeclaration<CR>
nnoremap <buffer> <silent> <C-w>] :EnDeclarationSplit<CR>
nnoremap <buffer> <silent> <C-w><C-]> :EnDeclarationSplit<CR>
nnoremap <buffer> <silent> <C-v>] :EnDeclarationSplit v<CR>
nnoremap <buffer> <silent> <LocalLeader>i :EnInspectType<CR>
nnoremap <buffer> <silent> <LocalLeader>I :EnSuggestImport<CR>
nnoremap <buffer> <silent> <LocalLeader>r :EnRename<CR>
let EnErrorStyle='Underlined'
au BufWritePost *.scala :EnTypeCheck
