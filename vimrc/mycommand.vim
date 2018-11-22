"実行コマンド

command! Gcc call Gcc()
function! Gcc()
   if(search("math","w")!=0)
   :w
   :!gcc %:r.c -lm
   :!./a.out

	elseif(search("curses", "w")!=0)
	:w
	:!gcc %:r.c -lncurses
	:!./a.out

   else
   :w
   :!gcc %:r.c
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

nnoremap <silent><F4> :call Sn()<CR>

set pastetoggle=<F3>


