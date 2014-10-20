"NeoBundle用の設定
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"ステータスライン
NeoBundle 'bling/vim-airline'

"ファイラ
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'

"補完
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'

"コーディング
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'AutoClose'
NeoBundle 'surround.vim'
NeoBundle 'jQuery'

"カラースキーム
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nginx.vim'

"Ruby on Rails開発
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-rails'
NeoBundle 'kchmck/vim-coffee-script'

"シンタックスチェック
NeoBundle 'scrooloose/syntastic'
NeoBundle 'hail2u/vim-css3-syntax'

"Git
NeoBundle 'tpope/vim-fugitive'

"Sudo
NeoBundle 'sudo.vim'

call neobundle#end()

filetype plugin indent on

"neocomplcache補完の設定
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

"オプション設定
set ambiwidth=double
set autoindent
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set expandtab
set number
set laststatus=2
set list
set listchars=tab:^_
set nobackup
set noswapfile
set nowrap
set scrolloff=999
set shiftwidth=2
set smartcase
set smartindent
set softtabstop=0
set splitbelow
set splitright
set title
set tabstop=2
set whichwrap=b,s,h,s,<,>,[,]

"シンタックス有効
syntax enable

"シンタックス
augroup HighLight
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.tpl set filetype=html
  autocmd BufRead,BufNewFile jquery.*.js set filetype=js syntax=javascript
  autocmd BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
  autocmd BufRead,BufNewFile /usr/local/etc/nginx/* set ft=nginx
augroup END

"HTMLとPHPの閉じタグの自動入力
augroup MyXML
  autocmd!
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

"前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"保存時に行末のスペースを削除
autocmd BufWritePre * :%s/\s\+$//ge

"保存時にタブをスペースに変換
autocmd BufWritePre * ;%s/\t/  /ge

"WordPress用の関数辞書の場所を設定
autocmd FileType php :set dictionary=~/.vim/dict/wordpress.dict

"カラースキーマ設定
colorscheme desert

"vimコマンド時、;:をshiftなしで:に統一する
noremap ; :

"Ctrl+fでVimFilerを開く
nnoremap <C-F> :VimFiler -buffer-name=explorer -split -winwidth=34 -toggle -no-quit -simple<CR>

"airlineの設定
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

"quickrun.vimを横分割で開く
let g:quickrun_config = { '_' : { 'outputter/buffer/split' : 'botright 8sp' } }

"Emmet lang
let g:user_emmet_settings = { 'lang' : 'ja' }

"NeoSnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"Clipboard Copy
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>

let g:syntastic_html_tidy_ignore_errors = ['trimming empty <span>', 'trimming empty <i>']
