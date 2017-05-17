" vi:foldmethod=marker
" Prelude {{{1
set nocompatible
filetype off
"}}}
set termguicolors
" Plugins {{{1
" Define list of plugins {{{2
" theme plugins {{{3
let g:theme_plugins = {
    \ 'bling/vim-airline' : {},
    \ 'vim-airline/vim-airline-themes': {},
    \ 'morhetz/gruvbox': {'editor': 'nvim'},
    \ 'flazz/vim-colorschemes': {}}

" lua plugins {{{3
let g:lua_plugins = {
    \ 'xolox/vim-lua-ftplugin' : {'for': 'lua'},
    \ 'xolox/vim-lua-inspect' : {'for': 'lua'}}

" haskell plugins {{{3
let g:haskell_plugins = {
    \ 'neovimhaskell/haskell-vim' : {'for': 'haskell'},
    \ 'eagletmt/neco-ghc' : {'for': 'haskell'},
    \ 'bitc/vim-hdevtools' : {'for': 'haskell'}}

" scala plugins {{{3
let g:scala_plugins = {
    \ 'derekwyatt/vim-scala' : {},
    \ '~/.vim/bundle/vim-sbt' : {},
    \ 'ensime/ensime-vim' : {}}

" python plugins {{{3
let g:python_plugins = {
    \ 'xolox/vim-pyref' : {'for': 'python'},
    \ 'AitorATuin/ropevim' : {'for': 'python'},
    \ 'davidhalter/jedi-vim' : {'for': 'python'},
    \ 'zchee/deoplete-jedi': {'for': 'python', 'editor': 'nvim'}}
" typescript plugins {{{3
let g:typescript_plugins = {
    \ 'Quramy/tsuquyomi' : {'for': 'typescript'},
    \ 'leafgarland/typescript-vim' : {'for': 'typescript'}}

" php plugins {{{4
let g:php_plugins = {
    \ 'joonty/vim-phpqa' : {'for': 'php'}}

" general coding plugins {{{3

let g:coding_plugins = {
    \ 'Shougo/deoplete.nvim': {'editor': 'nvim'},
    \ 'scrooloose/syntastic' : {'editor': 'vim'},
    \ 'neomake/neomake': {'editor': 'nvim'},
    \ 'SirVer/ultisnips' : {},
    \ 'honza/vim-snippets' : {},
    \ 'kien/rainbow_parentheses.vim' : {},
    \ 'tpope/vim-surround' : {},
    \ 'nathanaelkane/vim-indent-guides' : {},
    \ 'majutsushi/tagbar' : {},
    \ 'tomtom/tcomment_vim' : {}}
" elm plugins ?!?!?!?! {{{3
let g:elm_plugins = {
    \ 'lambdatoast/elm.vim' : {'for': 'elm'}}

" c plugins {{{3
let g:c_plugins = {
    \ 'zchee/deoplete-clang' : {'editor': 'nvim', 'for': 'c'}}

let g:arduino_plugins = {
    \ 'jplaut/vim-arduino-ino' : {'editor': 'nvim', 'for': 'arduino'}}

" go plugins {{{3
let g:go_plugins = {
    \ 'zchee/deoplete-go': { 'editor': 'nvim', 'do': 'make'},
    \ 'fatih/vim-go' : {'editor': 'nvim', 'for': 'go'}}

" General editor plugins {{{3
let g:editor_plugins = {
    \ 'Lokaltog/vim-easymotion' : {},
    \ 'junegunn/fzf' : { 'dir': '~/.fzf', 'do': './install --all' },
    \ 'junegunn/fzf.vim' : {},
    \ 'vimwiki/vimwiki' : {},
    \ 'tpope/vim-fugitive' : {},
    \ 'airblade/vim-gitgutter' : {},
    \ 'junegunn/vim-easy-align' : {},
    \ 'kassio/neoterm' : {'editor': 'nvim', 'frozen': 1}}

" Misc plugins {{{3
let g:misc_plugins = {
    \ 'scrooloose/nerdtree' : {'on': 'NERDTreeToggle'},
    \ 'xolox/vim-misc' : {},
    \ 'mbbill/undotree' : {},
    \ 'tpope/vim-unimpaired' : {},
    \ 'mantiz/vim-plugin-dirsettings' : {},
    \ 'Shougo/vimproc.vim' : {'editor': 'vim'}}

" Custom (unmanaged plugins) {{{3
let g:unmanaged_plugins = {
    \ '~/.vim/plugged/nvim-example-python-plugin': {}}

" Declare plugins to use {{{2
let g:all_plugins = [
    \ g:theme_plugins,
    \ g:lua_plugins,
    \ g:python_plugins,
    \ g:typescript_plugins,
    \ g:php_plugins,
    \ g:coding_plugins,
    \ g:elm_plugins,
    \ g:editor_plugins,
    \ g:misc_plugins,
    \ g:go_plugins,
    \ g:haskell_plugins,
    \ g:scala_plugins,
    \ g:c_plugins,
    \ g:arduino_plugins]

" Function to load plugins {{{2
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

" Load plugins" {{{2
call plug#begin('~/.vim/plugged')"
if !has('nvim')
    call _load_plugins('vim')
else
    call _load_plugins('nvim')
endif
call plug#end()

" Config {{{1
" General Config {{{2
" Some paths {{{3
"" Point python into virtualenv
let g:HOME = expand("$HOME")
let g:python_host_prog=g:HOME . "/.virtualenvs/neovim2/bin/python2"
let g:python3_host_prog=g:HOME . "/.virtualenvs/neovim3/bin/python3"
" Some UI options {{{3
if has("unix")
    let s:uname = substitute(system("uname -s"), "\n", "", "")
    if s:uname == "Darwin"
        " Do Mac stuff here
        set guifont=Anonymous\ Pro\ for\ Powerline:h14
    else
        set guifont=Inconsolata\ 11
    endif
endif

set t_Co=256
colorscheme Tomorrow-Night-Eighties
set background=dark

" highlighting column and row for current position
set cursorcolumn
set cursorline

let mapleader=","

filetype plugin indent on
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
syntax on

" Reload .vimrc {{{3
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Autocmd group for Terminal {{{3
augroup Terminal
    au!
    au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
augroup END

" Copy and paste {{{3
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Improve movement {{{3
" Move between windows
nmap <silent> <M-k> :wincmd k<CR>
nmap <silent> <M-j> :wincmd j<CR>
nmap <silent> <M-h> :wincmd h<CR>
nmap <silent> <M-l> :wincmd l<CR>

" Move between tabs
nmap <silent> <C-h> :tabprevious<CR>
nmap <silent> <C-l> :tabnext<CR>

" Move between location list
nmap <silent> <C-k> :lNext<CR>
nmap <silent> <C-j> :lnext<CR>

" popup movement
inoremap <A-j> <C-n>
inoremap <A-k> <C-p>

" move in command line
cnoremap <Esc>0 <Home>
cnoremap <Esc>$ <End>
cnoremap <Esc>l <Right>
cnoremap <Esc>h <Left>
cnoremap <Esc>cb <C-W>
cnoremap <Esc>e <S-Right>
cnoremap <Esc>b <S-Left>

" Default tab configuration {{{3
set shiftwidth=4 softtabstop=4 tabstop=4
set smartindent
set expandtab
" Inserts a real tab
inoremap <Leader><Tab> <C-V><Tab>
" Function to use tab for everything!
function! Super_tab_complete()
    if pumvisible()
        return "\<c-n>"
    endif
    return "\<tab>"
endfunction
"imap <silent><expr><tab> Super_tab_complete()

" Misc general options {{{3
" more subtle popup colors
if has('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
    set guioptions-=T  " no toolbar
    " Navigate windows
    nmap <silent> <A-k> :wincmd k<CR>
    nmap <silent> <A-j> :wincmd j<CR>
    nmap <silent> <A-h> :wincmd h<CR>
    nmap <silent> <A-l> :wincmd l<CR>
end

" Add numbers
set number
set relativenumber

" Use <leader>l to toggle display of whitespace
set listchars=tab:▶\ ,eol:¶,trail:●
nmap <leader>l :set list!<CR>
hi SpecialKey ctermfg=160 guifg=160

" automatically change window's cwd to file's dir
set autochdir

" We don't like beeps
set noerrorbells

" Improve the search
set incsearch ignorecase hlsearch

" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

nmap gb :bn<CR>
nmap gB :bN<CR>

set tags=.tags;/

" TODO: Move to after/ftplugins/vim
nnoremap <silent> <leader><leader><leader>S :%y"<cr>:@"<cr>
nnoremap <silent> <leader><leader><leader>e :@"<cr>

" Rainbow {{{3
" Rainbow colors {{{4
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

" Rainbow options {{{4
let g:rbpt_max = 16

" Rainbow parenthesys always 
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

:command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

nnoremap    <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

" Powerline setup {{{2
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_symbols.maxlinenr = 'Ξ'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemode = ":t"
set hidden
set laststatus=2

" EasyMotion {{{2
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" two characters search
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" LocalVim {{{2
command! LocalVim call dirsettings#Install()

" UtilSnip {{{2
let g:UltiSnipsExpandTrigger="<m-tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<m-tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir="~/.vim/mySnippets"
" TODO: create a small window to show snippets in current scope
" UltiSnips#SnippetsInCurrentScope
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mySnippets"]

" NERDTree {{{2
nmap <silent> <Leader>1 :NERDTreeToggle<CR>


" Syntastic settings {{{2
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
if exists('g:loaded_syntastic_plugin')
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
    function! ToggleErrors()
        let old_last_winnr = winnr('$')
        lclose
        if old_last_winnr == winnr('$')
            " Nothing was closed, open syntastic error location panel
            Errors
        endif
    endfunction
else
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
endif
nmap <leader>0 :call ToggleErrors()<CR>

" FZF settings {{{2
let g:fzf_launcher = 'urxvt -geometry 120x30 -e sh -c %s'

" Deoplete {{{2
if has('nvim')
    inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<tab>"
    let g:deoplete#enable_at_startup = 1

    " clang TODO: Move to file plugin
    let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
    let g:deoplete#sources#clang#clang_header = '/usr/include/clang'
    let g:deoplete#sources#clang#std#c = 'c11'
    let g:deoplete#sources#clang#std#cpp = 'c++1z'
    let g:deoplete#sources#clang#sort_algo = 'priority'
    let g:deoplete#sources#clang#debug#log_file = '~/.log/nvim/python/deoplete-clang.log'
    "
    " debug
    let g:deoplete#enable_debug = 1
endif

" EasyAlign {{{2
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Custom alignment rules
" l inline lua comments
let g:easy_align_delimiters = {
\ 'l': { 'pattern': '--', 'ignore_groups': [] }}

" Custom functions {{{1
"
" Send to terminal
function! REPLSend(lines)
    call jobsend(g:last_terminal_job_id, add(a:lines, ''))
endfunction

command! REPLSendCurrentLine call REPLSend([getline('.')])

" Project related functions {{{2
"
" Returns the root for a scala project
function! Find_scala_root(path, was_candidate)
    " Reduce one level the path
    let l:current_path = fnamemodify(a:path, ":h")
    " Base case! Stop recursion
    " We reach $HOME, / (. or empty string also finishes the recursion)
    " In that case we return an empty string
    if l:current_path == $HOME || l:current_path == "" || l:current_path == "/" || l:current_path == "."
        return "" 
    else
        let l:current_files = globpath(l:current_path, "*/", 0, 1)
        if a:was_candidate
            " Pevious directory contains main || test
            let l:has_src = index(l:current_files, l:current_path . "src/")
            if l:has_src
                " We found the parent of the src directory, this is the root for
                " the scala project!
                return l:current_path
            endif
        endif
    endif
    let l:has_main = (index(l:current_files, l:current_path . "/main/") < 0) ? 0 : 1
    let l:has_test = (index(l:current_files, l:current_path . "/test/") < 0) ? 0 : 1
    return Find_scala_root(l:current_path, l:has_main || l:has_test)
endfunction

colorscheme gruvbox

