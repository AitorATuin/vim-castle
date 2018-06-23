" vi:foldmethod=marker
" Prelude {{{1
set nocompatible
filetype off
set termguicolors
let g:deoplete#enable_at_startup = 1
"}}}

" Plugins {{{1
" Define list of plugins {{{2
" theme plugins {{{3
let g:theme_plugins = {
    \ 'bling/vim-airline' : {},
    \ 'vim-airline/vim-airline-themes': {}}

" lua plugins {{{3
let g:lua_plugins = {}

" haskell plugins {{{3
let g:haskell_plugins = {
    \ 'neovimhaskell/haskell-vim' : {'for': 'haskell'},
    \ 'eagletmt/neco-ghc' : {'for': 'haskell'},
    \ 'bitc/vim-hdevtools' : {'for': 'haskell'}}

" scala plugins {{{3
let g:scala_plugins = {}

" python plugins {{{3
let g:python_plugins = {}
" typescript plugins {{{3
let g:typescript_plugins = {
    \ 'Quramy/tsuquyomi' : {'for': 'typescript'},
    \ 'leafgarland/typescript-vim' : {'for': 'typescript'}}

" php plugins {{{4
let g:php_plugins = {
    \ 'joonty/vim-phpqa' : {'for': 'php'}}

" general coding plugins {{{3

let g:coding_plugins = {
    \ 'autozimu/LanguageClient-neovim': {'editor': 'nvim', 'branch': 'next',},
    \ 'Shougo/deoplete.nvim': {'editor': 'nvim'},
    \ 'neomake/neomake': {'editor': 'nvim'},
    \ 'Shougo/neosnippet.vim' : {},
    \ 'Shougo/neosnippet-snippets' : {},
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
let g:c_plugins = {}

let g:arduino_plugins = {
    \ 'jplaut/vim-arduino-ino' : {'editor': 'nvim', 'for': 'arduino'}}

" go plugins {{{3
let g:go_plugins = {}
    " \ 'zchee/deoplete-go': { 'editor': 'nvim', 'do': 'make'},
    " \ 'fatih/vim-go' : {'editor': 'nvim', 'for': 'go'}}


" General editor plugins {{{3
let g:editor_plugins = {
    \ 'Lokaltog/vim-easymotion' : {},
    \ 'junegunn/fzf' : { 'dir': '~/.fzf', 'do': './install --all' },
    \ 'junegunn/fzf.vim' : {},
    \ 'vimwiki/vimwiki' : {},
    \ 'tpope/vim-fugitive' : {},
    \ 'airblade/vim-gitgutter' : {},
    \ 'junegunn/vim-easy-align' : {},
    \ 'kassio/neoterm' : {'editor': 'nvim', 'frozen': 1},
    \ 'junegunn/limelight.vim': {},
    \ 'junegunn/goyo.vim': {}}

" Misc plugins {{{3
let g:misc_plugins = {
    \ 'scrooloose/nerdtree' : {'on': 'NERDTreeToggle'},
    \ 'xolox/vim-misc' : {},
    \ 'mbbill/undotree' : {},
    \ 'tpope/vim-unimpaired' : {}}

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
colorscheme atuin
set background=dark

" highlighting row for current position
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
    au TermOpen * tnoremap <Esc> <C-\><C-n>
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
if has('gui_running')
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

" NERDTree {{{2
nmap <silent> <Leader>1 :NERDTreeToggle<CR>

" Custom functions {{{1
" Send to terminal
function! REPLSend(lines)
    call jobsend(g:last_terminal_job_id, add(a:lines, ''))
endfunction

command! REPLSendCurrentLine call REPLSend([getline('.')])

augroup my_limelight
    autocmd WinEnter * Limelight0.6
    autocmd WinLeave * Limelight!
augroup END

