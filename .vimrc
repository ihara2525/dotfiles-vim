scriptencoding utf-8

" add runtimepathe .vim/bundle/*
call pathogen#runtime_append_all_bundles()

" Use Vim defaults instead of 100% vi compatibility
set nocompatible

  " more powerful backspacing
set backspace=indent,eol,start

" Don't wrap words by default
set textwidth=0

" バックアップファイルをつくらない
set nobackup

" read/write a .viminfo file, don't store more than
set viminfo='500,<10000,s1000,\"500

" keep 50 lines of command line history
set history=1000

" show the cursor position all the time
set ruler

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86" || &term =~ "xterm-256color"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

syntax on

if has("autocmd")
  filetype plugin on
  filetype indent on
  " これらのftではインデントを無効に
  " autocmd FileType php filetype indent off
  " autocmd FileType xhtml :set indentexpr=
  autocmd FileType text setlocal textwidth=72
endif

" タブの入力を空白文字に置き換える
set expandtab
" タブ幅
set tabstop=2
set softtabstop=2
set shiftwidth=2
set modelines=0

" カーソルがある行を反転する
"set cursorline
"highlight CursorLine term=reverse cterm=reverse

" 自動でインデントする
set smartindent

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索で色をつけない
set nohlsearch

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" タブ文字の表示
set list
set listchars=tab:\ \ ,trail:\ 

" コメント行が連続するときはコメントに
set formatoptions+=r

" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

" 入力中のコマンドをステータスに表示する
set showcmd

" 括弧入力時の対応する括弧を表示
set showmatch

" ステータスラインを常に表示
set laststatus=2

" ステータスラインの表示
"set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff}%{']'}%y%{fugitive#statusline()}\ %F%=%l,%c%V%8P
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff}%{']'}%y%{fugitive#statusline()}\ %F%=

" コマンドライン補間をシェルっぽく
set wildmode=list:longest

" バッファが編集中でもその他のファイルを開けるように
set hidden

" 外部のエディタで編集中のファイルが変更されたら自動で読み直す
set autoread

" svn/git での文字エンコーディング設定
autocmd FileType svn :set fileencoding=utf-8
autocmd FileType git :set fileencoding=utf-8

set ambiwidth=double

" タグファイルの自動セット
if has("autochdir")
  set autochdir
  set tags=tags;
else
  set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
endif

" tagsのキーマッピングがC-tだとtmuxとかぶるのでC-zに
nnoremap <C-z> <C-t>

" 辞書ファイルからの単語補間
set complete+=k

" C-]でtjumpと同等の効果
nnoremap <C-]> g<C-]>

" command line で command window 開く
set cedit=<C-O>

"表示行単位で行移動する
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" Functions
",e でそのファイルを実行
function! ShebangExecute()
  let m = matchlist(getline(1), '#!\(.*\)')
  if(len(m) > 2)
    execute '!'. m[1] . ' %'
  else
    execute '!' &ft ' %'
  endif
endfunction

if has('win32')
  nnoremap ,e :execute '!' &ft ' %'<CR>
else
  nnoremap ,e :call ShebangExecute()<CR>
end

:function! HtmlEscape()
silent s/&/\&amp;/eg
silent s/</\&lt;/eg
silent s/>/\&gt;/eg
:endfunction

:function! HtmlUnEscape()
silent s/&lt;/</eg
silent s/&gt;/>/eg
silent s/&amp;/\&/eg
:endfunction

set t_Co=16
set t_Sf=[3%dm
set t_Sb=[4%dm

if !has('win32')
  " 補完候補色
  hi Pmenu ctermbg=8
  hi PmenuSel ctermbg=12
  hi PmenuSbar ctermbg=0
endif

if !has('macunix')
  highlight Visual ctermbg=0
else
  highlight Visual ctermfg=15 ctermbg=4
end

highlight SpecialKey ctermbg=2
highlight MatchParen cterm=none ctermbg=15 ctermfg=0
highlight Search ctermbg=5 ctermfg=0

"" highlight 上書き
"autocmd VimEnter,WinEnter * highlight SpecialKey ctermbg=0
"autocmd VimEnter,WinEnter * highlight PmenuSel ctermbg=12

" encoding
nnoremap <silent> eu :set fenc=utf-8<CR>
nnoremap <silent> ee :set fenc=euc-jp<CR>
nnoremap <silent> es :set fenc=cp932<CR>
" encode reopen encoding
nnoremap <silent> eru :e ++enc=utf-8 %<CR>
nnoremap <silent> ere :e ++enc=euc-jp %<CR>
nnoremap <silent> ers :e ++enc=cp932 %<CR>

" paste/nopaste
nnoremap ep :set paste<CR>
nnoremap enp :set nopaste<CR>

" yanktmp.vim
noremap <silent> sy :call YanktmpYank()<CR>
noremap <silent> sp :call YanktmpPaste_p()<CR>

if has('macunix')
  noremap <silent> sY :call system("pbcopy", @0)<CR>
  noremap <silent> sP :r! pbpaste<CR>
end

" for rails
autocmd BufNewFile,BufRead app/**/*.rhtml set fenc=utf-8
autocmd BufNewFile,BufRead app/**/*.erb set fenc=utf-8
autocmd BufNewFile,BufRead app/**/*.haml set fenc=utf-8
autocmd BufNewFile,BufRead app/**/*.rb set fenc=utf-8

" rails.vim
let g:rails_level=4
let g:rails_statusline=1
" ruby omin complete
"let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails=1

" cofs's fsync
autocmd BufNewFile,BufRead /mnt/c/* set nofsync

" YankRing.vim
nnoremap ,y :YRShow<CR>

" delete input line
cnoremap <C-U> <C-E><C-U>

" fold 使わない
set nofoldenable

" folding keymap
nnoremap zz za
nnoremap zZ zA

" str2numchar.vim
" 範囲選択してる文字列を変換
vnoremap <silent> sn :Stn2NumChar<CR> " あ => &#12354;
vnoremap <silent> sh :Str2HexLiteral<CR> " あ => \\xE3\\x81\\x82

" 早い端末を使う
set ttyfast

" BufExplorer
nmap <c-l> :BufExplorer<CR>
