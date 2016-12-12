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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Linting/Syntax Checking
Plug 'neomake/neomake'

" Functionality
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'sirver/ultisnips' " Required for tobys/pdv
Plug 'tobys/pdv'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" VCS
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" --- LANGUAGE-SPECIFIC --- "
" JS/JSON
Plug 'jelera/vim-javascript-syntax'
Plug 'elzr/vim-json'

" Markdown
Plug 'plasticboy/vim-markdown'

" PHP
Plug 'stanangeloff/php.vim'
Plug 'arnaud-lb/vim-php-namespace'

" Twig
Plug 'lumiliet/vim-twig'


" --- OTHER --- "
Plug 'ryanoasis/vim-devicons' " Put this last-ish, so that devicons integrate into everything else.
Plug 'tobyS/vmustache' " Required for tobys/pdv

filetype plugin indent on                   " required!
call plug#end()


" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
source ~/.config/nvim/airline.vim


" NERDTree
augroup NERDTreeAU
	autocmd!

	"	Start with NERDTreeCWD when opening without a file
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeCWD | endif
	"	Close vim completely if nothing but NERDTree is open.
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END


" Neomake
source ~/.config/nvim/neomake.vim


" Solarized
set background=dark
colorscheme solarized


" UltiSnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"


" vim-php-namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
" Call function above in normal or insert mode to insert function above.
augroup vimPhpNamespace
	autocmd!
	autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
	autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
augroup END
