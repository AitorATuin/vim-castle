let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/home/atuin/.virtualenvs/pyls/bin/pyls'],
    \ 'go': ['go-langserver', '-gocodecompletion'],
    \ 'lua': ['lua-lsp'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
let g:LanguageClient_autoStart = 1
let g:LanguageClient_selectionUI = 'fzf'
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_fzfContextMenu = 1
" let g:LanguageClient_rootMarkers = ['.git']

" Commands

" Get symbols in workspace
command! -nargs=0 Symbols call LanguageClient#workspace_symbol()
" Get symbols in buffer
command! -nargs=0 BSymbols call LanguageClient#textDocument_documentSymbol()
" Rename
command! -nargs=0 Rename call LanguageClient#textDocument_rename()
