" Let xolox/vim-lua-ftplugin work with deoplete
let g:lua_check_syntax = 0
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 0
let g:lua_define_completion_mappings = 0

" Disable automatic lua_inspect
let g:lua_inspect_events = ''


" Syntastic config (vim only)
if exists('g:loaded_syntastic_plugin')
    let g:syntastic_lua_checkers = ['luacheck']
endif

" Neomake config (neovim only)
if exists('g:loaded_neomake')
endif
let g:lua_author = "AitorATuin"
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
