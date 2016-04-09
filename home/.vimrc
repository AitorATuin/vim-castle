set nocompatible
filetype off

let g:theme_plugins = {
    \ 'bling/vim-airline' : {},
    \ 'vim-airline/vim-airline-themes': {}}

let g:lua_plugins = {
    \ 'xolox/vim-lua-ftplugin' : {'for': 'lua'},
    \ 'xolox/vim-lua-inspect' : {'for': 'lua'}}

let g:scala_plugins = {
    \ 'derekwyatt/vim-scala' : {},
    \ 'ensime/ensime-vim' : {}}

let g:python_plugins = {
    \ 'xolox/vim-pyref' : {'for': 'python'},
    \ 'AitorATuin/ropevim' : {'for': 'python'},
    \ 'davidhalter/jedi-vim' : {'for': 'python', 'editor': 'vim'},
    \ 'zchee/deoplete-jedi': {'for': 'python', 'editor': 'nvim'}}

let g:typescript_plugins = {
    \ 'Quramy/tsuquyomi' : {'for': 'typescript'},
    \ 'leafgarland/typescript-vim' : {'for': 'typescript'}}

let g:php_plugins = {
    \ 'joonty/vim-phpqa' : {'for': 'php'}}

let g:coding_plugins = {
    \ 'Shougo/deoplete.nvim': {'editor': 'nvim'},
    \ 'scrooloose/syntastic' : {},
    \ 'SirVer/ultisnips' : {},
    \ 'honza/vim-snippets' : {},
    \ 'kien/rainbow_parentheses.vim' : {},
    \ 'tpope/vim-surround' : {},
    \ 'nathanaelkane/vim-indent-guides' : {},
    \ 'majutsushi/tagbar' : {},
    \ 'tomtom/tcomment_vim' : {}}

let g:elm_plugins = {
    \ 'lambdatoast/elm.vim' : {'for': 'elm'}}

let g:c_plugins = {
    \ 'zchee/deoplete-clang' : {'editor': 'nvim', 'for': 'c'}}

let g:go_plugins = {
    \ 'fatih/vim-go' : {'editor': 'nvim', 'for': 'go'}}

let g:editor_plugins = {
    \ 'Lokaltog/vim-easymotion' : {},
    \ 'junegunn/fzf' : { 'dir': '~/.fzf', 'do': './install --all' },
    \ 'junegunn/fzf.vim' : {},
    \ 'vimwiki/vimwiki' : {},
    \ 'tpope/vim-fugitive' : {},
    \ 'junegunn/vim-easy-align' : {}}

let g:misc_plugins = {
    \ 'scrooloose/nerdtree' : {'on': 'NERDTreeToggle'},
    \ 'xolox/vim-misc' : {},
    \ 'mbbill/undotree' : {},
    \ 'tpope/vim-unimpaired' : {},
    \ 'mantiz/vim-plugin-dirsettings' : {},
    \ 'Shougo/vimproc.vim' : {'editor': 'vim'}}

let g:unmanaged_plugins = {
    \ '~/.vim/plugged/nvim-example-python-plugin': {}}

let g:all_plugins = [
    \ g:theme_plugins,
    \ g:lua_plugins,
    \ g:python_plugins,
    \ g:typescript_plugins,
    \ g:php_plugins,
    \ g:scala_plugins,
    \ g:coding_plugins,
    \ g:elm_plugins,
    \ g:editor_plugins,
    \ g:misc_plugins,
    \ g:go_plugins,
    \ g:c_plugins]

function! _load_plugins(editor)
    let plugins = {}
    for p in g:all_plugins
        let plugins = extend(plugins, p) 
    endfor
    for plugin in keys(plugins)
        let props =  plugins[plugin]
        if has_key(props, 'editor')
            let editor = props['editor']
            unlet props['editor']
        else
            let editor = a:editor
        endif
        if editor == a:editor
            if empty(props)
               Plug plugin
            else
               Plug plugin, props
            end
        endif
    endfor
endfunction

" Load plugins
call plug#begin('~/.vim/plugged')
if !has('nvim')
    call _load_plugins('vim')
else
    call _load_plugins('nvim')
endif
call plug#end()

set t_Co=256
colorscheme vividchalk
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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemode = ":t"
set hidden
set laststatus=2

" Copy and paste
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

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
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
let g:UltiSnipsSnippetsDir="~/.vim/mySnippets"
" TODO: create a small window to show snippets in current scope
" UltiSnips#SnippetsInCurrentScope
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mySnippets"]


" Move between windows
nmap <silent> <M-Up> :wincmd k<CR>
nmap <silent> <M-Down> :wincmd j<CR>
nmap <silent> <M-Left> :wincmd h<CR>
nmap <silent> <M-Right> :wincmd l<CR>
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

" Move between tabs
nmap <silent> <C-Left> :tabNext<CR>
nmap <silent> <C-Right> :tabnext<CR>

" Move between location list
nmap <silent> <C-Up> :lNext<CR>
nmap <silent> <C-Down> :lnext<CR>

" NERDTree
nmap <silent> <Leader>1 :NERDTreeToggle<CR> 

" TagBar
nmap <silent> <Leader>2 :TagbarToggle<CR>

" more subtle popup colors 
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold    
    set guioptions-=T  " no toolbar
    " Navigate windows
    nmap <silent> <A-Up> :wincmd k<CR>
    nmap <silent> <A-Down> :wincmd j<CR>
    nmap <silent> <A-Left> :wincmd h<CR>
    nmap <silent> <A-Right> :wincmd l<CR>
    nmap <silent> <A-k> :wincmd k<CR>
    nmap <silent> <A-j> :wincmd j<CR>
    nmap <silent> <A-h> :wincmd h<CR>
    nmap <silent> <A-l> :wincmd l<CR>

end

" Add numbers
set number
set relativenumber

" Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_debug = 0
let g:syntastic_enable_signs = 1
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_style_warning_symbol = "⚠"
let g:syntastic_auto_loc_list = 0

" FZF settings
let g:fzf_launcher = 'urxvt -geometry 120x30 -e sh -c %s'

" clang TODO: Move to file plugin
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'
let g:deoplete#sources#clang#std#c = 'c11'
let g:deoplete#sources#clang#std#cpp = 'c++1z'
let g:deoplete#sources#clang#sort_algo = 'priority'

" debug
let g:deoplete#enable_debug = 1
let g:deoplete#sources#clang#debug#log_file = '~/.log/nvim/python/deoplete-clang.log'

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Custom alignment rules
" l inline lua comments
let g:easy_align_delimiters = {
\ 'l': { 'pattern': '--', 'ignore_groups': [] }}

nmap gb :bn<CR>
nmap gB :bN<CR>
