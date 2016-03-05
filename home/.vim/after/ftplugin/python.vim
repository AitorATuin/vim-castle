"highlight characters past column 120
highlight Excess ctermbg=DarkGrey guibg=Black
match Excess /\%120v.*/
set nowrap
source $HOME/.vim/bundle/ropevim/plugin/ropevim.vim
UltiSnipsAddFiletypes python 
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['flake8', 'mypy', 'pylint', 'pep8', 'py3kwarn', 'pyflakes', 'python']
let g:syntastic_python_flake8_args='--ignore=E501 --max-line-length=160'
