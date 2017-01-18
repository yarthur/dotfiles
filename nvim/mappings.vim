"Make it easy to edit the local CHANGELOG
nmap <Leader>CL :e CHANGELOG.md<cr>

" Launch .md file in Marked
nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>


nmap <Leader>config :tabnew\|cd ~/.dotfiles/\|NERDTreeCWD<cr>


noremap <Leader>q :bp\|bd #<cr>
