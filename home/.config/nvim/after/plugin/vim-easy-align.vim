" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Custom alignment rules
" l inline lua comments
let g:easy_align_delimiters = {
    \ 'l': { 'pattern': '--', 'ignore_groups': [] }}
