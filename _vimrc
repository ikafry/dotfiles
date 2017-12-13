set encoding=utf-8
scriptencoding utf-8

syntax enable
set t_Co=256

set tabstop=3

set cindent
set shiftwidth=3

set cursorline
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=grey

set clipboard=unnamed,autoselect

set nocompatible

set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
<<<<<<< HEAD
"set ambiwidth=double " □や○文字が崩れる問題を解決
=======
>>>>>>> 2df8cff331fd235e4d7cc7552a7431f8a9ee26d1

set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

" ESC連打でハイライト解除
nmap <silent><Esc><Esc> :nohlsearch<CR><Esc>

"文字のないところにカーソル移動できるようにする
set whichwrap=b,s,[,],<,>

set incsearch

set hlsearch

"実行コマンド
nnoremap <F5> :Gcc<CR><CR>

command! Gcc call Gcc()
function! Gcc()
	if(search("math.h","w")!=0)
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
set backspace=indent,eol,start

set shiftwidth=3
"----------------------NeoBandle設定---------------------"

if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

"プラグインのインストール
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'junegunn/vim-easy-align'
"スニペットの補完機能
NeoBundle "Shougo/neosnippet"
"スニペット集
NeoBundle 'Shougo/neosnippet-snippets'
" 構文エラーチェック
NeoBundle 'scrooloose/syntastic'
"テキストブロックの移動・複製
NeoBundle 't9md/vim-textmanip'
"_________________________________________________________
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
"_________________________________________________________

call neobundle#end()

" NeoBundleCheck を走らせ起動時に未インストールプラグインをインストールする
NeoBundleCheck

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin on
"----------------------------------------------------"

" smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" 2文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 2
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 0
" バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"

"---------------------CompleCache設定----------------------------"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_underbar_completion = 1
"  '_' 区切りの補完を有効化
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


"----------------------------------------------------------"

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""
"----------------------------------------------------------
" ステータスラインの設定
"----------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
"set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する

"----------------------------------------------------------
" Syntasticの設定
"----------------------------------------------------------
" 構文エラー行に「>>」を表示
let g:syntastic_enable_signs = 1
" 他のVimプラグインと競合するのを防ぐ
let g:syntastic_always_populate_loc_list = 1
" 構文エラーリストを非表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時に構文エラーチェックを実行する
let g:syntastic_check_on_open = 1
" 「:wq」で終了する時も構文エラーチェックする
let g:syntastic_check_on_wq = 1

let g:syntastic_cpp_compiler="gcc"

"-----------------------------------------------------------
"textmanipの設定
"-----------------------------------------------------------
<<<<<<< HEAD
"選択したテキストの移動
xmap <Space>d <Plug>(textmanip-duplicate-down)
nmap <Space>d <Plug>(textmanip-duplicate-down)
xmap <Space>D <Plug>(textmanip-duplicate-up)
nmap <Space>D <Plug>(textmanip-duplicate-up)

"ctr+キーで移動
xmap <C-DOWN> <Plug>(textmanip-move-down)
xmap <C-UP> <Plug>(textmanip-move-up)
xmap <C-LEFT> <Plug>(textmanip-move-left)
xmap <C-RIGHT> <Plug>(textmanip-move-right)
=======
" 選択したテキストの移動
xmap <C-j> <Plug>(Textmanip.move_selection_down)
xmap <C-k> <Plug>(Textmanip.move_selection_up)
xmap <C-h> <Plug>(Textmanip.move_selection_left)
xmap <C-l> <Plug>(Textmanip.move_selection_right)

" 行の複製
vmap <M-d> <Plug>(Textmanip.duplicate_selection_v)
nmap <M-d> <Plug>(Textmanip.duplicate_selection_n)
>>>>>>> 2df8cff331fd235e4d7cc7552a7431f8a9ee26d1

" toggle insert/replace with <F10>
nmap <F10> <Plug>(textmanip.toggle-mode)
xmap <F10> <Plug>(textmanip.toggle-mode)
"-------------------------------------------------------------
"
"-------------------------------------------------------------
"EasyAlignの設定
"-------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"-------------------------------------------------------------
"

