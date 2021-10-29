set nocompatible              " be iMproved, required


" load plugins from vundle
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/mappings.vim




" Cribbed from https://gist.githubusercontent.com/benmccormick/4e4bc44d8135cfc43fc3/raw/41cb8709d72a56bf0be66d4294135c46613c312c/minimal.vim
" A minimal vimrc for new vim users to start with.
"
" Referenced here: http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty
"
" Original Author:	     Bram Moolenaar <Bram@vim.org>
" Made more minimal by:  Ben Orenstein
" Modified by :          Ben McCormick
" Last change:	         2014 June 8
"
" To use it, copy it to
"  for Unix based systems (including OSX and Linux):  ~/.vimrc
"  for Windows :  $VIM\_vimrc
"
"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
" filetype plugin indent on

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

"""""""""""""""""""""
" Personal Settings "
"""""""""""""""""""""
" Save netrw history file to cache dir.
let g:netrw_home=$XDG_CACHE_HOME.'/vim'

" Enable Unicode
if !has('nvim')
	set encoding=utf-8
endif

" Show whitespace
set list listchars=eol:¶,tab:→\ ,trail:·,space:·

" Use Spaces instead of Tabs
set expandtab

" Set Tab width to 4 space
set tabstop=4

" Highlight current row
set cursorline

" Set highlighting settings for Cursor Line Number
" Should be bold, and the same color as the rest of the column.
highlight CursorLineNr term=bold ctermbg=0

" Set highlighting for tab and line-end
" Should resemble comments -not bold, low contrast, no background.
highlight NonText cterm=NONE ctermfg=10 ctermbg=NONE  " EOL
highlight SpecialKey cterm=NONE ctermfg=10 ctermbg=NONE  " Tab

" Use italics like all those damned hipsters do with their Operator ;)
highlight Comment cterm=italic
highlight htmlArg cterm=italic

" Set clipboard to unnamed.
" This allows nvim to copy to OS clipboard.
set clipboard=unnamed

" Recognize hidden tags files (.tags)
set tags+=./.tags;,.tags;

" disable Python2 support
let g:loaded_python_provider = 0

" improve Python3 support
let g:python3_host_prog = '/usr/local/bin/python3'

" disable Ruby support
let g:loaded_ruby_provider = 1

" set text conceal to apply only to normal and command line modes
set concealcursor=nc

"-------------------- AutoCommands --------------------"
" Auto Source on saving a config file.
" Hat tip [Jeffrey
" Way](https://gist.github.com/JeffreyWay/9b034ee90346fbd05180)
augroup autosourcing
	autocmd!

	" Source if any .vim file within ~/.dotfiles/vim is edited and saved.
	autocmd BufWritePost ~/.config/dotfiles/nvim/*.vim source ~/.dotfiles/nvim/init.vim
augroup END


" Associate *.mjs files as Javascript Files
" (*.mjs is the current Node convention, I guess?)
au BufNewFile,BufRead *.mjs set filetype=javascript

" Associate *.zsh-theme files as zsh filetype
au BufNewFile,BufRead *.zsh-theme set filetype=zsh

" Ignore whitespace on diff.
set diffopt=filler,iwhite


" Associate .vue files with the correct languages.
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" Allow comment highlighting in JSON
autocmd FileType json syntax match Comment +\/\/.\+$+
