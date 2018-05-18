" ATuin's own theme
"

if exists("syntax_on")
  syntax reset
endif

let g:colors_name='atuin'

let s:palette = {}

let s:palette.color0 = '#332233'
let s:palette.color1 = '#ac4142'
let s:palette.color2 = '#90a959'
let s:palette.color3 = '#f4bf75'
let s:palette.color4 = '#6a9fb5'
let s:palette.color5 = '#aa759f'
let s:palette.color6 = '#75b5aa'
let s:palette.color7 = '#d0d0d0'
let s:palette.color8 = '#505050'
let s:palette.color9 =  '#ac4142'
let s:palette.color10 = '#90a959'
let s:palette.color11 = '#f4bf76'
let s:palette.color12 = '#6a9fb5'
let s:palette.color13 = '#aa759f'
let s:palette.color14 = '#75b5aa'
let s:palette.color15 = '#f5f5f5'

let s:BG = s:palette.color0
let s:FG = s:palette.color15
let s:none = 'None'

" call s:HL('AtuinFg0', s:fg0)
" call s:HL('AtuinFg1', s:fg1)
" call s:HL('AtuinFg2', s:fg2)
" call s:HL('AtuinFg3', s:fg3)
" call s:HL('AtuinFg4', s:fg4)
" call s:HL('AtuinGray', s:gray)
" call s:HL('AtuinBg0', s:bg0)
" call s:HL('AtuinBg1', s:bg1)
" call s:HL('AtuinBg2', s:bg2)
" call s:HL('AtuinBg3', s:bg3)
" call s:HL('AtuinBg4', s:bg4)
"
" call s:HL('AtuinRed', s:red)
" call s:HL('AtuinRedBold', s:red, s:none, s:bold)
" call s:HL('AtuinGreen', s:green)
" call s:HL('AtuinGreenBold', s:green, s:none, s:bold)
" call s:HL('AtuinYellow', s:yellow)
" call s:HL('AtuinYellowBold', s:yellow, s:none, s:bold)
" call s:HL('AtuinBlue', s:blue)
" call s:HL('AtuinBlueBold', s:blue, s:none, s:bold)
" call s:HL('AtuinPurple', s:purple)
" call s:HL('AtuinPurpleBold', s:purple, s:none, s:bold)
" call s:HL('AtuinAqua', s:aqua)
" call s:HL('AtuinAquaBold', s:aqua, s:none, s:bold)
" call s:HL('AtuinOrange', s:orange)
" call s:HL('AtuinOrangeBold', s:orange, s:none, s:bold)
"
" call s:HL('AtuinRedSign', s:red, s:sign_column, s:invert_signs)
" call s:HL('AtuinGreenSign', s:green, s:sign_column, s:invert_signs)
" call s:HL('AtuinYellowSign', s:yellow, s:sign_column, s:invert_signs)
" call s:HL('AtuinBlueSign', s:blue, s:sign_column, s:invert_signs)
" call s:HL('AtuinPurpleSign', s:purple, s:sign_column, s:invert_signs)
" call s:HL('AtuinAquaSign', s:aqua, s:sign_column, s:invert_signs)


function! s:HL(group, fg, bg, ...)
  " Arguments: group, fg, bg

  " foreground
  let fg = a:fg
  let bg = a:bg

  " emphasis
  if a:0 == 1 && strlen(a:1)
    let emstr = a:1
  else
    let emstr = 'None'
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . toupper(fg),
        \ 'guibg=' . toupper(bg),
        \ 'gui='   . emstr,
        \ 'cterm='   . emstr,
        \ 'term='   . emstr
        \ ]
  execute join(histring, ' ')
endfunction

call s:HL('Normal', s:FG, s:BG)
call s:HL('CursorLine', 'None', '#584459') 
hi! link CursorColumn CursorLine
call s:HL('CursorLineNr', s:palette.color15, s:BG, 'bold,italic')
call s:HL('LineNr', s:palette.color2, s:BG)
call s:HL('Search', '#210529', '#867587')
call s:HL('IncSearch', s:palette.color2, s:FG)
call s:HL('WildMenu', s:BG, s:FG)
call s:HL('VertSplit', '#867587', '#867587')

" Cursor
call s:HL('Cursor', s:none, s:none, 'inverse')
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" Completion menu
" normal item
call s:HL('Pmenu', s:palette.color0, s:palette.color12)
" selected item
call s:HL('PmenuSel', s:palette.color15, s:palette.color5, 'bold,italic') 
" scrollbar
call s:HL('PmenuSbar', 'None', s:palette.color12)
" scrollbar thumb
call s:HL('PmenuThumb', 'None', s:palette.color12)

" Closed fold
call s:HL('Folded', s:palette.color0, '#867587', 'italic')
" Column where folds are displayed
" call s:HL('FoldColumn', s:palette.color0, s:palette.color0)

