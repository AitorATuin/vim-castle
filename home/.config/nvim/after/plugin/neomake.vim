let g:neomake_open_list = 2
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, call Neomake and open Neomake error location panel
        " if there were some error/warning
        Neomake
    endif
endfunction
nmap <leader>0 :call ToggleErrors()<CR>
