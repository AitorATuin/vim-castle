let g:deoplete#enable_at_startup = 1
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<tab>"
"call deoplete#enable_logging('DEBUG', $HOME . '/.local/log/deoplete.log')
" let g:deoplete#enable_debug = 1
call deoplete#custom#source('omni', 'debug_enabled', 0)
