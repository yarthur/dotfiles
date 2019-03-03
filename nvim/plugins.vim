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

Plug 'vim-airline/vim-airline'
source ~/.config/nvim/airline.vim

Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/indentLine'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linting/Syntax Checking/Test Runners
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'janko-m/vim-test'
let test#strategy = "dispatch_background"

Plug 'tpope/vim-dispatch'

Plug 'w0rp/ale'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functionality
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'craigemery/vim-autotag'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'ervandew/supertab'

Plug 'mtth/scratch.vim'
let g:scratch_height=25

Plug 'Raimondi/delimitMate'

Plug 'scrooloose/nerdtree'
" augroup NERDTreeAU
	" autocmd!

	"	Start with NERDTreeCWD when opening without a file
	" autocmd StdinReadPre * let s:std_in=1
	" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeCWD | endif
	"	Close vim completely if nothing but NERDTree is open.
	" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	" autocmd FileType nerdtree setlocal list!
" augroup END

Plug 'sirver/ultisnips' " Required for tobys/pdv
let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key 
" Source: <https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-15451411>
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction
" Apply the above function
" Source: <https://stackoverflow.com/a/18685821>
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Plug 'spf13/vim-autoclose'
" let g:autoclose_vim_commentmode = 1  " If file type uses \" as comment, won't auto close them.

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

Plug 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git', 'svn' ]   " These are the only VCS tools I need to worry about.
let g:signify_realtime = 1  " I like it when my gutter updates in real time.

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
" JS/JSON
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'carlitux/deoplete-ternjs'  " Deoplete completions for JS/Tern.

Plug 'elzr/vim-json', {'for': 'json'}
let g:vim_json_syntax_conceal = 0  " Prevent quotes from being hidden.

Plug 'jelera/vim-javascript-syntax'

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
" Plug 'padawan-php/padawan.vim', {'for': 'php'} " Requires padawan server, which requires php5.4+

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

Plug 'tobyS/vmustache' " Required for tobys/pdv


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on                   " required!
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- AND FINALLY ---
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme solarized
