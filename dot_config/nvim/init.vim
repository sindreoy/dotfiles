:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set encoding=UTF-8

call plug#begin()
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree'
    Plug 'joshdick/onedark.vim'
    Plug 'bryanmylee/vim-colorscheme-icons'
    Plug 'w0rp/ale' " async lint engine

    " Always end with this plugin
    Plug 'ryanoasis/vim-devicons'
    " Remember to install fonts, see
    " https://github.com/ryanoasis/nerd-fonts#option-3-install-script
call plug#end()

nnoremap <C-b> :NERDTreeToggle<CR>

" ALE
let g:ale_linters = {'python': ['flake8', 'mypy']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort']
\}

let g:ale_fix_on_save = 1

