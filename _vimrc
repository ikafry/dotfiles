:syntax on

set tabstop=3

set clipboard=unnamed,autoselect

set nocompatible

" 行番号を表示
"set number

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"set paste

"対応括弧へカーソルジャンプ
"set sm

"文字のないところにカーソル移動できるようにする
set whichwrap=b,s,[,],<,>

set ruler

set incsearch

set hlsearch

"実行コマンド
nnoremap <F5> :Gcc<CR><CR>

command! Gcc call Gcc()
function! Gcc()
	if(search("math.h") == 1) 
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

function Sn()
  if &number
    setlocal nonumber
  else
    setlocal number
  endif
endfunction

nnoremap <silent><F4> :call Sn()<CR>

"set mouse=a
"set ttymouse=xterm2

:command! -nargs=+ Sub %s/<args>/<args>/g

set pastetoggle=<F3>

set cindent
set showcmd
set backspace=indent,eol,start
"----------------------NeoBandle設定---------------------"

if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

" solarized カラースキーム
  NeoBundle 'altercation/vim-colors-solarized'
" mustang カラースキーム
  NeoBundle 'croaker/mustang-vim'
" wombat カラースキーム
  NeoBundle 'jeffreyiacono/vim-colors-wombat'
" jellybeans カラースキーム
  NeoBundle 'nanotech/jellybeans.vim'
" lucius カラースキーム
  NeoBundle 'vim-scripts/Lucius'
" zenburn カラースキーム
  NeoBundle 'vim-scripts/Zenburn'
" mrkn256 カラースキーム
  NeoBundle 'mrkn/mrkn256.vim'
" railscasts カラースキーム
  NeoBundle 'jpo/vim-railscasts-theme'
" pyte カラースキーム
  NeoBundle 'therubymug/vim-pyte'
" molokai カラースキーム
  NeoBundle 'tomasr/molokai'

call neobundle#end()

" NeoBundleCheck を走らせ起動時に未インストールプラグインをインストールする
NeoBundleCheck

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on
"----------------------------------------------------"

"---------------------CompleCache設定----------------------------"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"----------------------------------------------------------"
