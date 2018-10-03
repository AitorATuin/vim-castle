" Let xolox/vim-lua-ftplugin work with deoplete
let g:lua_check_syntax = 0
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 0
let g:lua_define_completion_mappings = 0

" Disable automatic lua_inspect
let g:lua_inspect_events = ''

let g:lua_author = "AitorATuin"
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

let g:lua_lsp_debug_mode = 0

function! LuaLSPDebugModeOn() abort
    LanguageClient#Notify('workspace/didChangeConfiguration', {
        \ 'debugMode': true
    \ })
endfunction

function! LuaLSPDebugModeOff() abort
    LanguageClient#Notify('workspace/didChangeConfiguration', {
        \ 'debugMode': false
    \ })
endfunction

let g:LanguageClient_trace = "messages"
