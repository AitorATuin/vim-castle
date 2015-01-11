set nocompatible
set rtp+=~/.vim/bundle/vundle/
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
" more subtle popup colors 
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold    
endif

if has('gui_running')
  set guioptions-=T  " no toolbar
  colorscheme elflord
endif
set incsearch ignorecase hlsearch
" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" Reload .vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
"Bundle 'klen/python-mode'
Bundle 'python-rope/ropevim'
Bundle 'davidhalter/jedi-vim'
Bundle 'xolox/vim-misc'
Bundle 'joonty/vim-phpqa'
Bundle 'xolox/vim-pyref'
Bundle 'nvie/vim-flake8'

" Python stuff
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    autocmd FileType python source $HOME/.vim/bundle/ropevim/plugin/ropevim.vim
    autocmd BufWritePost *.py call Flake8()
    autocmd Filetype html setlocal ts=2 sts=2 sw=2
    autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
    autocmd Filetype javascript setlocal ts=8 sts=8 sw=8 noet
    autocmd Filetype php setlocal ts=8 sts=8 sw=8 noet
    augroup END

:command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

nnoremap    <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

" Powerline setup
set guifont=Inconsolata\ 9
set laststatus=2
