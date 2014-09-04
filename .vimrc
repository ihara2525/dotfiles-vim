scriptencoding utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
NeoBundle 'gmarik/vundle'
NeoBundle 'tpope/vim-rails'
NeoBundle 'fugitive.vim'
NeoBundle 'neocomplcache'
NeoBundle 'neosnippet'
NeoBundle 'yanktmp.vim'
NeoBundle 'L9'
NeoBundle 'vim-coffee-script'
NeoBundle 'surround.vim'
NeoBundle 'Solarized'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'Command-T'
NeoBundle 'Yggdroot/indentLine'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"Bundle 'gmarik/vundle'
"Bundle 'tpope/vim-rails'
"Bundle 'fugitive.vim'
"Bundle 'neocomplcache'
"Bundle 'neosnippet'
"Bundle 'yanktmp.vim'
"Bundle 'L9'
"Bundle 'vim-coffee-script'
"Bundle 'surround.vim'
"Bundle 'Solarized'
"Bundle 'ZenCoding.vim'
"Bundle 'kana/vim-fakeclip'
"Bundle 'Command-T'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 色
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" シンタックスハイライトを有効にする
syntax on

" 背景色を暗くする
set background=dark

" カラースキーマをSolarizedにする
colorscheme solarized

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86" || &term =~ "xterm-256color"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 行番号を表示する
set number

" タブページを常に表示する
set showtabline=2

" Use Vim defaults instead of 100% vi compatibility
set nocompatible

" more powerful backspacing
set backspace=indent,eol,start

" Don't wrap words by default
set textwidth=0

" バックアップファイルをつくらない
set nobackup

" swpファイルの出力場所
set directory=~/.vim/tmp

" read/write a .viminfo file, don't store more than
set viminfo='500,<10000,s1000,\"500

" keep 50 lines of command line history
set history=1000

" show the cursor position all the time
set ruler

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

if has("autocmd")
  filetype plugin on
  filetype indent on
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

" 検索で色をつける
set hlsearch
" Esc連打で色を消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" タブ文字の表示
set list
set listchars=tab:\ \ ,trail:\

" ファイル保存時に行末のスペースを削除する
" function StripTrailingWhitespaces()
"   let pos = getpos(".")
"   %s/\s\+$//e
"   call setpos(".", pos)
" endfunction
" autocmd BufWritePre * :call StripTrailingWhitespaces()

" 行末の改行を強調表示する
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

" 挿入モードで改行した時に # を自動挿入しない
set formatoptions-=r

" ノーマルモードで o や O をした時に # を自動挿入しない
set formatoptions-=o

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

"if has('macunix')
"  noremap <silent> sY :call system("pbcopy", @0)<CR>
"  noremap <silent> sP :r! pbpaste<CR>
"end
set clipboard=unnamed

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
"nmap <c-l> :BufExplorer<CR>

" 自動的に閉じ括弧を入力する
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>

" Enterで空行を挿入する
noremap <CR> o<ESC>

" 自動的にコメント行を挿入しない
augroup auto_comment_off
	autocmd!
	autocmd BufEnter * setlocal formatoptions-=ro
augroup END

" ビジュアルベルを使う
set visualbell
set noerrorbells

" undoファイル
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/tmp/,~/.vim/undo_files/
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplcache
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" AutoComplPopを無効にする
let g:acp_enableAtStartup = 0
" neocomplcacheを有効にする
let g:neocomplcache_enable_at_startup = 1
" 大文字小文字を区別する
let g:NeoComplCache_SmartCase = 1
" キャメルケース補完を有効にする
let g:NeoComplCache_EnableCamelCaseCompletion = 1
" アンダーバー補完を有効にする
let g:NeoComplCache_EnableUnderbarCompletion = 1
" 2文字入力したら補完を有効にする
let g:neocomplcache_auto_completion_start_length = 2
" Enterでポップアップを閉じて改行する
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" タブで保管する
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" C-h、バックスペースでポップアップを閉じて一文字削除する
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplcache-snippets-complete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:neocomplcache_snippets_dir='~/.vim/snippets'
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 自動的に閉じ括弧を入力する
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimshell
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ,is: シェルを起動
nnoremap <silent> ,is :VimShell<CR>
" ,irb: irbを非同期で起動
nnoremap <silent> ,irb :VimShellInteractive irb<CR>
" ,ss: 非同期で開いたインタプリタに現在の行を評価させる
vmap <silent> ,ss :VimShellSendString<CR>
" 選択中に,ss: 非同期で開いたインタプリタに選択行を評価させる
nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更する
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=white cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <space>cdで開いているファイルと同じディレクトリに移動する
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoffeeScript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-coffee-scriptが読み込まれないので設定...
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-T
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> ,t :CommandT<CR>
nnoremap <silent> ,b :CommandTBuffer<CR>

" ウィンドウを上部に表示する
let g:CommandTMatchWindowAtTop=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd Filetype gitcommit setlocal spell textwidth=72

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" emmet-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:user_emmet_settings = {
\   'lang' : 'ja',
\   'attr_quotes' : 'single'
\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" peco
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! PecoOpen()
  for filename in split(system("find . -type f | peco"), "\n")
    execute "e" filename
  endfor
endfunction
nnoremap <Leader>op :call PecoOpen()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 適用するファイルタイプを設定する
let g:indentLine_fileType = ['ruby', 'coffee', 'eruby', 'scss', 'yml']

