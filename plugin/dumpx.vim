"********************************
"*** Copyright vbextreme 2017 ***
"*** License gplv3            ***
"******************************** 

"TODO
"-auto flags
"-auto cc

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

"mode 0 == only assembly
"mode 1 == mix C and assembly and jump
"mode 2 == only assembly current line of source
if !exists('g:dumpxMode')
	let g:dumpxMode = 1
endif

"create new window and puts mix C code and assembly, go to current line
function! DumpX(where)
	let l:cbl=line('.')
	let l:ncbl = 0
	let l:asmode = '-adhln'
	let l:filter = ''

	if g:dumpxMode == 0 
		let l:asmode = '-adln'
	elseif g:dumpxMode == 2
		let l:ncbl = l:cbl + 1
		let l:filter = " | awk '/[ \t]*" . l:cbl . ":[a-zA-Z0-9_\/]*/{flag=1;next}/[ \t]*" . l:ncbl . ":[a-zA-Z0-9_\/]*/{flag=0}flag'"
	endif

	let l:asm = system( g:dumpxCC . ' -g ' . g:dumpxCFLAGS . ' -Wa,' . l:asmode . ' -c ' . expand('%:p') . l:filter)
	
	if a:where ==# "down"
		below new
	elseif a:where ==# "right"
		below vnew
	elseif a:where ==# "left"
		vnew
	else
		new
	endif
	setlocal buftype=nofile bufhidden=hide noswapfile
	execute "put =l:asm"
	1d
	
	setf dumpx
	
	if g:dumpxMode == 2
		execute '?[ \t]*' . l:cbl . ':[a-zA-Z0-9_\/]*' . expand('%') . '/'
		normal! zt
	endif

endfunction

command DumpXTop :call DumpX('up')
command DXT :call DumpX('up')
command DumpXBottom :call DumpX('down')
command DXB :call DumpX('down')
command DumpXRight :call DumpX('right')
command DXR :call DumpX('right')
command DumpXLeft :call DumpX('left')
command DXL :call DumpX('left')
command DX :call DumpX('')
