highlight Excess ctermbg=DarkGrey guibg=Black
match Excess /\%120v.*/
set wrap
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_bin_path = expand("~/.local/share/vim/go/bin")
let g:go_autodetect_gopath = 0
if !exists('g:loaded_syntastic_plugin')
    let g:syntastic_go_checkers = ['gometalinter']
endif
