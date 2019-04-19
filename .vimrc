"Configure ColorScheme
colorscheme zenburn

set noswapfile

set encoding=utf-8

scriptencoding utf-8

syntax on
set t_Co=256

set expandtab
set tabstop=3
set shiftwidth=3


set cursorline
highlight CursorLine term=reverse cterm=none ctermfg=none

set clipboard=unnamed,autoselect

set nocompatible

set ttimeoutlen=50 " ノーマルモードへ変更時のラグを無くす

set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される

set wildmenu " コマンドモードの補完
set history=2500 " 保存するコマンド履歴の数

" ESC連打でハイライト解除
nmap <silent><Esc><Esc> :nohlsearch<CR><Esc>

"文字のないところにカーソル移動できるようにする
set whichwrap=b,s,[,],<,>

set incsearch

set hlsearch

:command! -nargs=+ Sub %s/<args>/<args>/g

" :autocmd BufNewFile  *.c      0r ~/.vim/template/c/template_c.c

set cindent
set backspace=indent,eol,start

set shiftwidth=3

set runtimepath+=~/.vim/
runtime! userautoload/*.vim

set guifont=Cica:h16
set printfont=Cica:h12
set ambiwidth=single

"----------------------dein.vim設定----------------------"
"
"let s:dein_dir = expand('~/.vim/dein')
"
"let s:dein_repo_dir = s:dein_dir . '/repos/Shougo/dein.vim'
"
"if dein#load_state(s:dein_dir)
"   call dein#begin(s:dein_dir)
"
"   "プラグインのTOMLファイル
"   let g:rc_dir    = expand('~/.vim/dein/rc')
"   let s:toml      = g:rc_dir . '/dein.toml'
"   let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
"
"   "TOMLファイルのキャッシュ
"   call dein#load_toml(s:toml,      {'lazy':0})
"   call dein#load_toml(s:lazy_toml, {'lazy':1})
"
"   call dein#end()
"   call dein#save_state()
"endif
"
"if dein#check_install()
"   call dein#install()
"endif
"--------------------------------------------------------"

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
 NeoBundle 'ConradIrwin/vim-bracketed-paste'
 NeoBundle 'vim-airline/vim-airline'
 NeoBundle 'vim-airline/vim-airline-themes'
 "スニペットの補完機能
 NeoBundle "Shougo/neosnippet"
 "スニペット集
 NeoBundle 'Shougo/neosnippet-snippets'
 " 構文エラーチェック
 "NeoBundle 'scrooloose/syntastic'
 "Devicons表示
 NeoBundle 'ryanoasis/vim-devicons'
 "ファイル検索
 NeoBundle 'ctrlpvim/ctrlp.vim'
 "複数行の同時コメントアウト実現
 NeoBundle 'tomtom/tcomment_vim'
 "_________________________________________________________
 " jellybeans カラースキーム
   NeoBundle 'nanotech/jellybeans.vim'
 " zenburn カラースキーム
   NeoBundle 'jnurmine/Zenburn'
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
" 3文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 3
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 0
" バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
"タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"

"---------------------CompleCache設定----------------------------"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1 " Use smartcase.  let g:neocomplcache_enable_smart_case = 1 let g:neocomplcache_enable_underbar_completion = 1
"  '_' 区切りの補完を有効化
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2
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
"let g:unite_enable_start_insert=1
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
"Devicons
"----------------------------------------------------------
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"----------------------------------------------------------
"NERDTree
"----------------------------------------------------------
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"------------------------------------------------------
"Airline
"------------------------------------------------------
let g:airline_theme = 'violet'
let g:airline_powerline_fonts = 1
set laststatus=2

let g:airline_enable_branch = 0
let g:airline_section_b = "%t %M"
let g:airline_section_c = ''
let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
let g:airline_section_x =
      \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
      \ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
      \ "%{strlen(&filetype)?&filetype:'no ft'}"
let g:airline_section_y = '%3p%%'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline#extensions#whitespace#enabled = 0
"let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_mode_map = {
		\'n'  : 'の～まる',
		\'i'  : 'へんしゅー',
		\'R'  : 'ちかん！',
		\'c'  : 'こまんど',
		\'v'  : 'びじゅある',
		\'V'  : 'らいん',
		\'' : 'ぶろっく'
		\}
"---------------------------------------------------------
"multiple-cursors
"---------------------------------------------------------
let g:multi_cursor_start_word_key      = '<C-m>'

"---------------------------------------------------------
"tcomment.vim
"---------------------------------------------------------
let g:tcommentMapLeader1 = '<C-_>'       "(default: '<C-_>')
let g:tcommentMapLeader2 = '<Leader>'    "(default: '<Leader>_')
let g:tcommentMapLeaderOp1 = 'gc'        "(default: 'gc')
let g:tcommentMapLeaderOp2 = 'gC'        "(default: 'gC')

