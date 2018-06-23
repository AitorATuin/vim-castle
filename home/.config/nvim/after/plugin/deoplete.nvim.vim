" Uncomment for logging
" call deoplete#enable_logging('DEBUG', $HOME . '/.local/log/deoplete.log')
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
