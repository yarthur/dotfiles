" ----------------------------------------------------------------------------
"   Plug
" ----------------------------------------------------------------------------

" Install vim-plug if we don't already have it
let firstrun = 0
if !filereadable(expand("~/.vim/autoload/plug.vim"))
    let firstrun = 1
    silent !mkdir -p ~/.vim/{autoload,undo,backups}
    silent !curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

" Theme/Appearance
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" Syntax
Plug 'editorconfig/editorconfig-vim'
Plug 'plasticboy/vim-markdown'
Plug 'jelera/vim-javascript-syntax'
Plug 'elzr/vim-json'
Plug 'lumiliet/vim-twig'

" Linting/Syntax Checking
Plug 'scrooloose/syntastic'

" Functionality
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

filetype plugin indent on                   " required!
call plug#end()



" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" lightline
source ~/.dotfiles/vim/lightline.vim

" Syntastic
source ~/.dotfiles/vim/syntastic.vim
