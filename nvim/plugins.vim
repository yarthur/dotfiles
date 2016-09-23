" ----------------------------------------------------------------------------
"   Plug
" ----------------------------------------------------------------------------

" Install vim-plug if we don't already have it
let firstrun = 0
if !filereadable(expand("~/.config/nvim/autoload/plug.vim"))
    let firstrun = 1
    silent !mkdir -p ~/.config/nvim/{autoload,undo,backups}
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')

" Theme/Appearance
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax
Plug 'editorconfig/editorconfig-vim'
Plug 'plasticboy/vim-markdown'
Plug 'jelera/vim-javascript-syntax'
Plug 'elzr/vim-json'
Plug 'lumiliet/vim-twig'

" Linting/Syntax Checking
Plug 'neomake/neomake'

" Functionality
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" VCS
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

filetype plugin indent on                   " required!
call plug#end()


" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" solarized
set background=dark
colorscheme solarized

" lightline
source ~/.config/nvim/airline.vim

" Neomake
source ~/.config/nvim/neomake.vim

" NERDTree
"	Start with NERDTreeCWD when opening without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeCWD | endif
"	Close vim completely if nothing but NERDTree is open.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
