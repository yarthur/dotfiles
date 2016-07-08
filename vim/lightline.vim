let g:lightline = {
\	'active': {
\		'left': [
\			['mode', 'paste'],
\ 			['readonly', 'filename', 'modified'],
\		],
\	},
\	'colorscheme': 'solarized_dark',
\	'component_visible_condition': {
\    	'readonly': '(&filetype!="help"&& &readonly)',
\		'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
\	},
\}

set laststatus=2

if !has('gui_running')
	set t_Co=256
endif
