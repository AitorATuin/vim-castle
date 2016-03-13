set nocompatible
filetype off

let g:theme_plugins = {
    \ 'bling/vim-airline' : {},
    \ 'vim-airline/vim-airline-themes': {}}

let g:lua_plugins = {
    \ 'xolox/vim-lua-ftplugin' : {'for': 'lua'},
    \ 'xolox/vim-lua-inspect' : {'for': 'lua'}}

let g:python_plugins = {
    \ 'xolox/vim-pyref' : {'for': 'python'},
    \ 'AitorATuin/ropevim' : {'for': 'python'},
    \ 'davidhalter/jedi-vim' : {'for': 'python'}}

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

let g:editor_plugins = {
    \ 'Lokaltog/vim-easymotion' : {},
    \ 'junegunn/fzf' : { 'dir': '~/.fzf', 'do': './install --all' },
    \ 'junegunn/fzf.vim' : {},
    \ 'vimwiki/vimwiki' : {},
    \ 'tpope/vim-fugitive' : {}}

let g:misc_plugins = {
    \ 'scrooloose/nerdtree' : {'on': 'NERDTreeToggle'},
    \ 'xolox/vim-misc' : {},
    \ 'mbbill/undotree' : {},
    \ 'tpope/vim-unimpaired' : {},
    \ 'mantiz/vim-plugin-dirsettings' : {},
    \ 'Shougo/vimproc.vim' : {'editor': 'vim'}}

let g:all_plugins = [
    \ g:theme_plugins,
    \ g:lua_plugins,
    \ g:python_plugins,
    \ g:typescript_plugins,
    \ g:php_plugins,
    \ g:coding_plugins,
    \ g:elm_plugins,
    \ g:editor_plugins,
    \ g:misc_plugins]

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

" FZF settings
let g:fzf_launcher = 'urxvt -geometry 120x30 -e sh -c %s'

