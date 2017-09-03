" Fire on file save (BufWritePost) and load (BufEnter)
autocmd! BufWritePost * Neomake

" Open Error List window automatically
let g:neomake_open_list = 2

augroup my_warning_sign_colors
    autocmd!
    autocmd ColorScheme *
        \ highlight NeomakeWarningSign ctermfg=3 ctermbg=0
augroup END

augroup my_error_sign_color
	autocmd!
	autocmd ColorScheme *
		\ highlight NeomakeErrorSign ctermfg=1 ctermbg=0
augroup END

let g:neomake_twig_twiglint_maker = {
    \ 'args': ['lint'],
    \ 'exe': 'twig-lint',
    \ 'errorformat': '%f:%l:%c: %m',
    \ }
let g:neomake_html_twig_enabled_makers = ['twiglint']

let g:neomake_logfile = "/Users/req86809/.neomake_log"
