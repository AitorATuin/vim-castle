set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'gertjanreynaert/cobalt2-vim-theme'
Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'AitorATuin/ropevim'
Plugin 'davidhalter/jedi-vim'
Plugin 'xolox/vim-misc'
Plugin 'joonty/vim-phpqa'
Plugin 'mbbill/undotree'
Plugin 'ervandew/supertab'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-surround'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-unimpaired'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tcomment_vim'
Plugin 'reinh/vim-makegreen'
Plugin 'mantiz/vim-plugin-dirsettings'
Plugin 'vimwiki/vimwiki'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'xolox/vim-pyref'
Plugin 'xolox/vim-lua-inspect'
Plugin 'lambdatoast/elm.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim' 
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
call vundle#end()

let g:solarized_termcolors=256
colorscheme dracula
set background=dark

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


" Python stuff
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    autocmd FileType python source $HOME/.vim/bundle/ropevim/plugin/ropevim.vim
    autocmd FileType python UltiSnipsAddFiletypes python 
    autocmd Filetype html setlocal ts=2 sts=2 sw=2
    autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
    autocmd Filetype javascript setlocal ts=8 sts=8 sw=8 noet
    autocmd Filetype php setlocal ts=8 sts=8 sw=8 noet
    autocmd Filetype sh UltiSnipsAddFiletypes sh
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
        set guifont=Inconsolata\ 11
    endif
endif

" Powerline setup
let g:airline_powerline_fonts = 1
set laststatus=2

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
let g:UltiSnipsSnippetsDir="~/.vim/mySnippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mySnippets"]

" Move between windows
nmap <silent> <M-Up> :wincmd k<CR>
nmap <silent> <M-Down> :wincmd j<CR>
nmap <silent> <M-Left> :wincmd h<CR>
nmap <silent> <M-Right> :wincmd l<CR>

" Move between tabs
nmap <silent> <C-Left> :tabNext<CR>
nmap <silent> <C-Right> :tabnext<CR>

" Move between location list
nmap <silent> <C-Up> :lNext<CR>
nmap <silent> <C-Down> :lnext<CR>

" NERDTree
nmap <silent> <Leader><Esc> :NERDTreeToggle<CR> 

" more subtle popup colors 
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold    
    set guioptions-=T  " no toolbar
    " Navigate windows
    nmap <silent> <A-Up> :wincmd k<CR>
    nmap <silent> <A-Down> :wincmd j<CR>
    nmap <silent> <A-Left> :wincmd h<CR>
    nmap <silent> <A-Right> :wincmd l<CR>
end

" Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['flake8', 'mypy', 'pylint', 'pep8', 'py3kwarn', 'pyflakes', 'python']
let g:syntastic_python_flake8_args='--ignore=E501 --max-line-length=160'
let g:syntastic_sh_checkers = ['bashate', 'sh']
let g:syntastic_debug = 0

" FZF settings
let g:fzf_launcher = 'urxvt -geometry 120x30 -e sh -c %s'
