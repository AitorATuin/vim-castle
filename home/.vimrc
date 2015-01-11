set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
syntax on
set shiftwidth=4 softtabstop=4 tabstop=4

set smartindent
set expandtab

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

" Python stuff
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

" Powerline setup
set guifont=Terminus\ 9
set laststatus=2
