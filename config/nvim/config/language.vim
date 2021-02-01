" 言語別設定

" タブ設定方法
" autocmd filetype <language> setlocal shiftwidth=? tabstop=? softtabstop=?
" Set sw/sts/ts
" sw  : shiftwidth (インデント時に使用されるスペースの数)
" sts : softtabstop (0でないなら、タブを入力時、その数値分だけ半角スペースを挿入)
" ts  : tabstop (タブを画面で表示する際の幅)
" et  : expandtab (有効時、タブを半角スペースとして挿入)
" ml  : modeline
" tw  : textwidth
" modeline : モードラインを有効

" 行頭での<tab>の幅
set shiftwidth=4 softtabstop=4 tabstop=4
" 行頭ではshiftwidthの数だけ，以外ではtabstopの数だけindent
set smarttab
" タブを空白入力に置換
set expandtab

" 言語ごとの設定
augroup MyAutoCmd
	autocmd filetype apache     setlocal sw=4 sts=4 ts=4
	autocmd filetype aspvbs     setlocal sw=4 sts=4 ts=4
	autocmd filetype c          setlocal sw=4 sts=4 ts=4
	autocmd filetype coffee     setlocal sw=2 sts=2 ts=2
	autocmd filetype cpp        setlocal sw=4 sts=4 ts=4
	autocmd filetype cs         setlocal sw=4 sts=4 ts=4
	autocmd filetype csh        setlocal sw=4 sts=4 ts=4
	autocmd filetype css        setlocal sw=2 sts=2 ts=2
	autocmd filetype diff       setlocal sw=4 sts=4 ts=4
	autocmd filetype eruby      setlocal sw=4 sts=4 ts=4
	autocmd filetype gitcommit  setlocal sw=4 sts=4 ts=4
	autocmd filetype gitconfig  setlocal sw=2 sts=2 ts=2
	autocmd filetype haml       setlocal sw=2 sts=2 ts=2
  autocmd filetype haskell    setlocal sw=4 sts=4 ts=4
	autocmd filetype html       setlocal sw=2 sts=2 ts=2
	autocmd filetype java       setlocal sw=4 sts=4 ts=4
	autocmd filetype javascript setlocal sw=2 sts=2 ts=2
	autocmd filetype jsx				setlocal sw=2 sts=2 ts=2
	autocmd filetype less       setlocal sw=2 sts=2 ts=2
	autocmd filetype make       setlocal sw=4 sts=4 ts=4
	autocmd filetype perl       setlocal sw=4 sts=4 ts=4
	autocmd filetype php        setlocal sw=4 sts=4 ts=4
	autocmd filetype ruby       setlocal sw=2 sts=2 ts=2
	autocmd filetype scala      setlocal sw=2 sts=2 ts=2
	autocmd filetype sh         setlocal sw=4 sts=4 ts=4
	autocmd filetype sql        setlocal sw=4 sts=4 ts=4
	autocmd filetype typescript setlocal sw=4 sts=4 ts=4
	autocmd filetype vb         setlocal sw=4 sts=4 ts=4
	autocmd filetype verilog    setlocal sw=4 sts=4 ts=4
	autocmd filetype vim        setlocal sw=2 sts=2 ts=2
	autocmd filetype wsh        setlocal sw=4 sts=4 ts=4
	autocmd filetype xhtml      setlocal sw=2 sts=2 ts=2
	autocmd filetype xml        setlocal sw=2 sts=2 ts=2
	autocmd filetype yaml       setlocal sw=2 sts=2 ts=2
	autocmd filetype zsh        setlocal sw=4 sts=4 ts=4
	autocmd filetype qf,qfreplace,quickrun,git,diff,gitv,gitcommit
				\ setlocal nofoldenable nomodeline foldcolumn=0 foldlevel=0
	autocmd BufNewFile,BufRead .{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
	autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

