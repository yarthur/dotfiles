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
Plug 'Yggdroot/indentLine'

" Linting/Syntax Checking
Plug 'neomake/neomake'

" Functionality
Plug 'craigemery/vim-autotag'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'sirver/ultisnips' " Required for tobys/pdv
Plug 'spf13/vim-autoclose'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/IndexedSearch'

" VCS
Plug 'airblade/vim-gitgutter'
Plug 'low-ghost/nerdtree-fugitive'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" --- LANGUAGE-SPECIFIC --- "
" JS/JSON
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'jelera/vim-javascript-syntax'
Plug 'tpope/vim-jdaddy'

" Markdown
Plug 'plasticboy/vim-markdown'

" PHP
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'arnaud-lb/vim-php-namespace', { 'for' : 'php' } " This one's for use statements.
Plug 'joonty/vdebug', {'for': 'php'}
Plug 'dantleech/vim-phpnamespace', {'for': 'php'} " This one's for class namespaces. Integrated into Ultisnips!!
" Plug 'padawan-php/padawan.vim', {'for': 'php'} " Requires padawan server, which requires php5.4+
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
Plug 'stanangeloff/php.vim', {'for': 'php'}
Plug 'tobys/pdv', {'for': 'php'}

" Twig
Plug 'lumiliet/vim-twig', {'for': 'twig'}


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
	autocmd FileType nerdtree setlocal list!
augroup END


" Neomake
source ~/.config/nvim/neomake.vim


" PDV (PHP Documentor for Vim)
let g:pdv_template_dir = $HOME ."/.dotfiles/nvim/plugged/pdv/templates_snip"
nnoremap <leader>doc :call pdv#DocumentWithSnip()<CR>


" Solarized
set background=dark
colorscheme solarized


" UltiSnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" vim-autoclose
let g:autoclose_vim_commentmode = 1  " If file type uses \" as comment, won't auto close them.

" vim-phpcomplete
let g:phpcomplete_min_num_of_chars_for_namespace_completion = 3  " Type at least 3 characters for completion to kick in.
let g:phpcomplete_parse_docblock_comments = 1  " Parses docblock comments, and presents improved meta data.

" vim-phpnamespace
nnoremap <silent><leader>nn :call PhpNamespaceInsert()<CR>


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
