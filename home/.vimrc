set nocompatible
filetype off

let g:solarized_termcolors=256
colorscheme solarized
set background=dark

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
let mapleader=","

filetype plugin indent on
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
syntax on

set shiftwidth=4 softtabstop=4 tabstop=4
set smartindent
set expandtab

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>

" automatically change window's cwd to file's dir
set autochdir

set noerrorbells

set incsearch ignorecase hlsearch
" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" Reload .vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

Bundle 'gertjanreynaert/cobalt2-vim-theme'
Bundle 'gmarik/vundle'
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
"Bundle 'klen/python-mode'
"Bundle 'python-rope/ropevim'
Bundle 'AitorATuin/ropevim'
Bundle 'davidhalter/jedi-vim'
Bundle 'xolox/vim-misc'
Bundle 'joonty/vim-phpqa'
Bundle 'mbbill/undotree'
Bundle 'ervandew/supertab'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tpope/vim-surround'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-unimpaired'
Bundle 'nvie/vim-pyunit'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'lambdalisue/nose.vim'
Bundle 'reinh/vim-makegreen'
Bundle 'mantiz/vim-plugin-dirsettings'

Bundle 'nvie/vim-flake8'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'xolox/vim-pyref'


" Python stuff
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    autocmd FileType python source $HOME/.vim/bundle/ropevim/plugin/ropevim.vim
    autocmd FileType python UltiSnipsAddFiletypes python 
    autocmd BufWritePost *.py call Flake8()
    autocmd Filetype html setlocal ts=2 sts=2 sw=2
    autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
    autocmd Filetype javascript setlocal ts=8 sts=8 sw=8 noet
    autocmd Filetype php setlocal ts=8 sts=8 sw=8 noet
    augroup END

" Rainbow colors
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

" Rainbow parenthesys always
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

:command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

nnoremap    <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

if has("unix")
    let s:uname = substitute(system("uname -s"), "\n", "", "")
    if s:uname == "Darwin"
        " Do Mac stuff here
        set guifont=Anonymous\ Pro\ for\ Powerline:h14
    else
        set guifont=Inconsolata\ 9
    endif
endif

" Powerline setup
let g:airline_powerline_fonts = 1
set laststatus=2

" Navigate windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" EasyMotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" two characters search
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" LocalVim
command! LocalVim call dirsettings#Install()

" UtilSnip
let g:UltiSnipsExpandTrigger="<A-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<A-tab>"

" more subtle popup colors 
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold    
    set guioptions-=T  " no toolbar
endif



