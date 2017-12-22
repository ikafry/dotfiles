"実行コマンド
nnoremap <F5> :Gcc<CR><CR>

command! Gcc call Gcc()
function! Gcc()
   if(search("math.h","w")==1)
   :w
   :!gcc % -o %:r % -lm
   :!./%:r

   else
   :w
   :!gcc % -o %:r
   :!./%:r

   endif
endfunction

:autocmd BufNewFile  *.c      0r ~/vim/skeleton.c

function! Sn()
  if &number
    setlocal nonumber
  else
    setlocal number
  endif
endfunction

nnoremap <silent><F4> :call Sn()<CR>

nnoremap <F6> :QuickRun<CR>

set pastetoggle=<F3>

" ESC連打でハイライト解除
nmap <silent><Esc><Esc> :nohlsearch<CR><Esc>
