local options = {
  -- 基本設定
  -- 文字コード
  encoding = "utf-8",
  fileencodings = "utf-8",
  -- 全モードでマウスを有効化
  mouse = "a",
  -- 変更中のファイルでも、保存しないで他のファイルを表示する
  hidden = true,
  -- スペルチェック
  spell = true,
  spelllang = "en_us",
  -- 内容が変更されたら自動的に再読み込み
  autoread = true,
  number = true,
  -- クリップボードをWindowsと連携する
  clipboard = { "unnamed", "unnamedplus" },
  -- ビープ音すべてを無効にする
  visualbell = true,
  errorbells = false,
  -- 自動更新の時間
  updatetime = 300,
  -- タイトルをウィンドウ枠に表示する
  title = true,
  -- 不可視文字を表示
  list = true,
  listchars = {
    tab = "▸ ",
    extends = "»",
    trail = "-",
    precedes = "«",
    eol = "↲",
    nbsp = "%",
    space = "⋅"
  },
  -- ウィンドウ幅より長い行は折り返して、次の行に続けて表示す
  wrap = true,
  -- コマンド行の長さ
  cmdheight = 1,
  -- カラムを表示
  signcolumn = "yes",
  -- エディタウィンドウの末尾から2行目にステータスラインを常時表示させるための指定
  laststatus = 2,
  -- ステータスラインにコマンドを表示
  showcmd = true,
  -- 1行が長くても全部表示
  display = "lastline",
  -- ポップアップメニューの高さを指定
  pumheight = 30,
  -- カーソル行の強調表示
  cursorline = true,
  -- コマンドラインでmodeの表示をしない
  showmode = false,
  -- 日本語help
  helplang = "ja",
  background = "dark",
  -- 文字を隠す
  conceallevel = 1,
  -- 検索設定
  -- 検索時に大/小を区別しない
  ignorecase = true,
  -- 検索時に大文字を含んでいたら大/小を区別
  smartcase = true,
  -- 検索時にマッチした単語をハイライトにする
  hlsearch = true,
  -- 検索時に最後まで行ったら最初に戻る
  wrapscan = true,
  -- インクリメンタルサーチを行う
  incsearch = true,
  -- 編集設定
  -- deleteでインデントを削除可能にする
  backspace = { "indent", "eol", "start" },
  completeopt = { "menu", "menuone", "noselect" },
  -- 閉括弧が入力された時、対応する括弧を強調する
  showmatch = true,
  -- 閉括弧が入力された時対応する括弧に一時的に移動
  startofline = false,
  -- コマンドライン履歴保存
  history = 10000,
  -- カーソルを常に画面の中央に表示させる
  scrolloff = 999,
  -- C-vの矩形選択で行末より後ろもカーソルを置ける
  virtualedit = "block",
  -- 新しく開く代わりにすでに開いてあるバッファを開く
  switchbuf = "useopen",
  -- <"や">"でインデントする際に"shiftwidth"の倍数に丸める
  shiftround = true,
  -- 行頭での<tab>の幅
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,
  -- 新しい行のインデントを現在行と同じにする
  smartindent = true,
  -- 行頭ではshiftwidthの数だけ，以外ではtabstopの数だけindent
  smarttab = true,
  -- タブを空白入力に置換
  expandtab = true,
  -- 補完時に大文字小文字を区別しない
  infercase = true,
  -- 必要ない設定
  writebackup = false,
  swapfile = false,
  backup = false,
  termguicolors = true,
  -- カーソルを行頭、行末で止まらないようにする
  whichwrap = "b,s,h,l,<,>,[,]",
  winblend = 20,
  pumblend = 20,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
