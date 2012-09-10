" カラースキーマをSolarizedにする
" colorscheme wombat256
colorscheme solarized

highlight CursorIM guibg=Purple guifg=NONE
highlight Search guibg=DarkBlue guifg=NONE

if has("gui_macvim")
  " タブを常に表示
  set showtabline=2
  " 透明度
  set transparency=4
  " ツールバーを非表示
  set guioptions-=T
  " アンチエイリアス
  set antialias
  " フォント
  set guifont=Ricty:h12
  " スクロールバーを非表示
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  " ビープ音をなくす
  set visualbell t_vb=
  " 全画面で起動
  " set fuoptions=maxvert,maxhorz
  " au GUIEnter * set fullscreen
  " ウィンドウを移動
  map <silent> gw :macaction selectNextWindow:
  map <silent> gW :macaction selectPreviousWindow:
  " 入力モードを抜けるとIMEをオフにする
  set imdisable

  " Command-T configuration
  nnoremap <silent> <Space>t :<C-u>CommandT<Return>
  let g:CommandTMaxHeight=10
  set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,tmp/*,spec/fixtures/cassettes/*,app/assets/images/*,public/*

  " Strip trailing whitespace
  function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
  endfunction
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

  " custom status line
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
endif

if has('gui_running')
endif

"autocmd VimEnter * tab all
"autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'
