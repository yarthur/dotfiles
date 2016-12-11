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

