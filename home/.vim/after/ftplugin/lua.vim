UltiSnipsAddFiletypes lua
" Disable automatic lua_inspect
let g:lua_inspect_events = ''
if !exists('g:loaded_syntastic_plugin')
    let g:syntastic_lua_checkers = ['luacheck']
endif
let g:lua_author = "AitorATuin"
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
