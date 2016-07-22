" Fire on file save (BufWritePost) and load (BufEnter)
autocmd! BufWritePost * Neomake

" Open Error List window automatically
let g:neomake_open_list = 2



" let g:neomake_warning_sign = {
"   \ 'texthl': 'WarningMsg',
"   \ }
" let g:neomake_error_sign = {
"   \ 'text': 'E',
"   \ 'texthl': 'ErrorMsg',
"   \ }

