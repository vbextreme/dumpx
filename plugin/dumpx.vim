"********************************
"*** Copyright vbextreme 2017 ***
"*** License gplv3            ***
"******************************** 

if exists('g:dumpx_plugin')
	finish
endif

let g:dumpx_plugin = 1

if !exists('g:dumpxCC')
	let g:dumpxCC = 'gcc'
endif

if !exists('g:dumpxCFLAGS')
	let g:dumpxCFLAGS = ''
endif

"create new window and puts mix C code and assembly, go to current line
function! DumpX(where)
	let l:cbl=line('.')
	let @a = system( g:dumpxCC . ' -g ' . g:dumpxCFLAGS . ' -Wa,-adhln -c ' . expand('%:p') . ' -o /tmp/vim.dumpx.' . expand('%'))
	if a:where ==# "down"
		below new 
	else
		new
	endif
	setlocal buftype=nofile bufhidden=hide noswapfile
	normal! G
	execute "put a"
	setf dumpx
	call cursor(1,1)
	execute '/[ \t]*' . l:cbl . ':[a-zA-Z0-9_\/]*' . expand('%') . '/'
endfunction

command DumpXTop :call DumpX('up')
command DXT :call DumpX('up')
command DumpXBottom :call DumpX('down')
command DXB :call DumpX('down')





