""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install vim-plug if we don't already have it
let firstrun = 0
if !filereadable(expand("~/.config/nvim/autoload/plug.vim"))
    let firstrun = 1
    silent !mkdir -p ~/.config/nvim/{autoload,undo,backups}
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'altercation/vim-colors-solarized'
set background=dark

" LightLine {{{
	Plug 'itchyny/lightline.vim'
	let g:lightline = {
		\   'colorscheme': 'solarized',
		\   'active': {
		\       'left': [ [ 'mode', 'paste' ],
		\               [ 'gitbranch' ],
		\               [ 'readonly', 'filetype', 'filename' ]],
		\       'right': [ [ 'percent' ], [ 'lineinfo' ],
		\               [ 'fileencoding' ],
		\               [ 'gitblame', 'currentfunction', 'cocstatus', 'linter_errors', 'linter_warnings' ]]
		\   },
		\   'component_expand': {
		\   },
		\   'component_type': {
		\       'readonly': 'error',
		\       'linter_warnings': 'warning',
		\       'linter_errors': 'error'
		\   },
		\   'component_function': {
		\       'cocstatus': 'coc#status',
		\       'currentfunction': 'helpers#lightline#currentFunctin',
		\       'fileencoding': 'helpers#lightline#fileEncoding',
		\       'filename': 'helpers#lightline#fileName',
		\       'filetype': 'helpers#lightline#fileType',
		\       'gitblame': 'helpers#lightline#gitBlame',
		\       'gitbranch': 'helpers#lightline#gitBranch',
		\       'readonly': 'helpers#lightline#readonly',
		\   },
		\   'mode_map': {
		\       'n' : 'N',
		\       'i' : 'I',
		\       'R' : 'R',
		\       'v' : 'V',
		\       'V' : 'VL',
		\       "\<C-v>": 'VB',
		\       'c' : 'C',
		\       's' : 'S',
		\       'S' : 'SL',
		\       "\<C-s>": 'SB',
		\       't': 'T',
		\   },
		\   'tabline': {
		\       'left': [ [ 'tabs' ] ],
		\       'right': [ [ 'close' ] ]
		\   },
		\   'tab': {
		\       'active': [ 'filename', 'modified' ],
		\       'inactive': [ 'filename', 'modified' ],
		\   },
	   \   'separator': { 'left': '', 'right': '' },
	   \   'subseparator': { 'left': '', 'right': '' }
	\ }
" }}}

Plug 'Yggdroot/indentLine'
" allow syntax concealment in normal and command modes (allows you to see concealed content in insert and visual modes
let g:indentLine_concealcursor = 'nc'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linting/Syntax Checking/Test Runners
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'janko-m/vim-test'
let test#strategy = "dispatch_background"

Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [
\    'coc-css',
\    'coc-diagnostic',
\    'coc-eslint',
\    'coc-explorer',
\    'coc-git',
\    'coc-html',
\    'coc-json',
\    'coc-marketplace',
\    'coc-pairs',
\    'coc-phpls',
\    'coc-prettier',
\    'coc-snippets',
\    'coc-stylelintplus',
\    'coc-vetur',
\    'coc-yaml',
\ ]
"
" Open coc-explorer with <space>e
nmap <space>e :CocCommand explorer<CR>

" Prettier formats file on save
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

Plug 'tpope/vim-dispatch'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functionality
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'craigemery/vim-autotag'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'ervandew/supertab'

Plug 'mtth/scratch.vim'
let g:scratch_height=25

Plug 'Raimondi/delimitMate'

Plug 'tpope/vim-abolish'

Plug 'tpope/vim-commentary'
augroup vimCommentary
    autocmd!
    autocmd FileType twig setlocal commentstring={#\ %s\ #}
augroup END

Plug 'tpope/vim-surround'

Plug 'vim-scripts/IndexedSearch'

Plug '/usr/local/opt/fzf'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VCS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

Plug 'low-ghost/nerdtree-fugitive'

Plug 'sodapopcan/vim-twiggy'

Plug 'tpope/vim-fugitive'

Plug 'Xuyuanp/nerdtree-git-plugin'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- LANGUAGE-SPECIFIC --- "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Blade Templates
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'jwalton512/vim-blade'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jenkinsfile
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'thanethomson/vim-jenkinsfile', {'for': 'Jenkinsfile'}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JS/JSON
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'elzr/vim-json', {'for': 'json'}
let g:vim_json_syntax_conceal = 0  " Prevent quotes from being hidden.

Plug 'othree/yajs.vim', { 'for': [ 'javascript', 'javascript.jsx', 'html' ] }

Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

Plug 'tpope/vim-jdaddy'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'plasticboy/vim-markdown'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}

Plug 'arnaud-lb/vim-php-namespace', { 'for' : 'php' } " This one's for use statements.
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

Plug 'dantleech/vim-phpnamespace', {'for': 'php'} " This one's for class namespaces. Integrated into Ultisnips!!
nnoremap <silent><leader>nn :call PhpNamespaceInsert()<CR>

Plug 'dantleech/vim-phpunit', {'for': 'php'}

Plug 'joonty/vdebug', {'for': 'php'}

Plug 'lvht/phpcd.vim', {'for': 'php'}
"
Plug 'Rican7/php-doc-modded', {'for': 'php'}
" Ripped from http://kushellig.de/vim-automatic-phpdoc/
function! UpdatePhpDocIfExists()
    normal! k
    if getline('.') =~ '/'
        normal! V%d
    else
        normal! j
    endif
    call PhpDocSingle()
    normal! k^%k$
    if getline('.') =~ ';'
        exe "normal! $svoid"
    endif
endfunction
nnoremap <leader>h :call UpdatePhpDocIfExists()<CR>

Plug 'stanangeloff/php.vim', {'for': 'php'}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Twig
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'lumiliet/vim-twig', {'for': 'twig'}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- OTHER --- "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ryanoasis/vim-devicons' " Put this last-ish, so that devicons integrate into everything else.
" Needed for custom extension match
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
" support for *.vue
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue'] = '﵂'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on                   " required!
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- AND FINALLY ---
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme solarized
