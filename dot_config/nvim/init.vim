:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set encoding=UTF-8

call plug#begin()
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree'
    " Remember to install fonts, see
    " https://github.com/ryanoasis/nerd-fonts#option-3-install-script
    Plug 'ryanoasis/vim-devicons'
call plug#end()

nnoremap <C-b> :NERDTreeToggle<CR>
