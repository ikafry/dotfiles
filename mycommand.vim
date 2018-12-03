"実行コマンド

command! Gcc call Gcc()
"自動でコンパイル(gcc)&実行
function! Gcc()
	:w

	if(search("math","w")!=0)
   :!gcc % -lm
	elseif(search("curses", "w")!=0)
	:!gcc % -lncurses
   else
   :!gcc %
   endif

	if has('win32')
   :!./a.exe	 
	elseif has('unix')
	:!./a.out
	endif

endfunction


function! Sn()
  if &number
    setlocal nonumber
  else
    setlocal number
  endif
endfunction

"行番号表示切り替え
nnoremap <silent><F4> :call Sn()<CR>
