" Neoterm settings
if ! exists('g:neoterm_loaded')
    finish
endif

let g:neoterm_position = "vertical"

function! s:send_register(register)
    let reg_contents = getreg(a:register)
    call g:neoterm.repl.exec(split(reg_contents), "\n")
endfunction

" Send some register to repl
" TODO: Generalize this thing!
nnoremap <leader>tpra :call s:send_register("a")<CR>
nnoremap <leader>tprb :call s:send_register("b")<CR>
nnoremap <leader>tprc :call s:send_register("c")<CR>
nnoremap <leader>tprd :call s:send_register("d")<CR>
nnoremap <leader>tpre :call s:send_register("e")<CR>

" Send current line to repl
nnoremap <leader>tl :TREPLSendLine<CR>

" Send current buffer to repl
nnoremap <leader>tf :TREPLSendFile<CR>

" Send selection to repl
nnoremap <leader>tp :TREPLSendSelection<CR>

" Start repl
nnoremap <leader>tr :call g:neoterm.repl.exec([])<CR>



