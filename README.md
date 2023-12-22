# README

開発環境を整えるためのドキュメント

## 目次

- [PC の設定](#pc-の設定)
  - [Mac の設定](#mac-の設定)
  - [Windows の設定](#windows-の設定)
- [開発環境の設定](#開発環境の設定)
  - [設定ファイルの復元](#設定ファイルの復元)
  - [シェルの設定](#シェルの設定)
  - [SSH の設定](#ssh-の設定)
- [プログラミング言語の設定](#プログラミング言語の設定)
  - [asdf のインストール](#asdf-のインストール)
  - [python 周りをインストールする](#python-周りをインストールする)
  - [Rust のインストール](#rust-のインストール)
  - [eskk の設定](#eskk-の設定)
- [その他](#その他)
  - [Tex の文字の設定](#tex-の文字の設定)
  - [Mac のクリーンインストール方法](#mac-のクリーンインストール方法)

## PC の設定

### Mac の設定

1. 隠しファイルを表示する.

   ```sh
   defaults write com.apple.finder AppleShowAllFiles TRUE
   defaults read com.apple.finder AppleShowAllFiles
   killall Finder
   ```

2. DS_Store を作成しないようにする.

   ```sh
   defaults write com.apple.desktopservices DSDontWriteNetworkStores true
   defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
   ```

### Windows の設定

## 開発環境の設定

### 設定ファイルの復元

dotfiles で設定ファイルを管理している.

1. Homebrew をインストールする

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
   ```

   > [homebrew](http://brew.sh/index_ja.html)

1. windows では以下を設定する.

   ```sh
   test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
   test -d /home/linuxbrew/.linuxbrew && \
   eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
   test -r ~/.bash_profile && \
   echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
   echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.config/fish/conf.d/user.fish
   ```

1. 以下のコマンドでエラーを確認する.

   ```sh
   brew doctor
   ```

1. dotfiles を git から clone する

   ```sh
   git clone https://github.com/w40141/dotfiles.git
   ```

1. シンボリックリンクを貼る.

   ```sh
   cd dotfiles
   ./init.sh
   ```

1. brew bundle でアプリを一括インストールする (2 回くらいやると大丈夫).

   ```sh
   brew bundle --global
   ```

1. インストールできないものは都度変更する.

### シェルの設定

fishを設定する

1. fish のパスの確認する(`brew bundle --global`でインストール済なはず).

   ```sh
   which fish
   ```

1. シェルの変更する.

   ```sh
   sudo vi /etc/shells
   ```

1. 末尾に fish のパス (/usr/local/bin/fish) を追加する.

1. ログインシェルを fish に変更する.

   ```sh
   fish
   chsh -s /usr/local/bin/fish
   ```

1. [fisher](https://github.com/jorgebucaran/fisher) をインストールする.

   ```sh
   curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
   ```

1. fisher プラグインを入れる.

   ```sh
   fisher update
   ```

### SSH の設定

1. 秘密鍵と公開鍵を作る.

   1. RSA 4096bit

      ```sh
      ssh-keygen -t rsa -b 4096
      ```

   2. Ed25519

      ```sh
      ssh-keygen -t ed25519
      ```

1. .ssh ディレクトリを作り, config ファイルを書く. config ファイルはどこかから持ってくる.

1. github などにアクセスをして確認する.

   ```sh
   ssh -T git@github.com
   ```

1. dotfiles を https から ssh へ変更する

   ```sh
   git remote set-url origin git@github.com:w40141/dotfiles.git
   ```

## プログラミング言語の設定

### asdf のインストール

1. [asdf](https://asdf-vm.com/#/core-manage-asdf) に従いインストールする.

   ```sh
   echo -e "\nsource "(brew --prefix asdf)"/libexec/asdf.fish" >> ~/.config/fish/config.fish
   ```

1. 各種プログラミング言語をインストールする.

   ```sh
   asdf plugin-add danhper/asdf-python
   asdf plugin-add asdf-vm/asdf-ruby
   asdf plugin-add asdf-vm/asdf-nodejs
   asdf plugin-add twuni/asdf-yarn
   asdf plugin-add asdf-community/asdf-poetry
   ```

1. 各種プログラミング言語のバージョンをインストールする.

   ```sh
   asdf install python 3.9.0
   asdf install nodejs latest
   asdf install ruby 2.7.4
   ```

1. 各種プログラミング言語のバージョンを global で指定する.

   ```sh
   asdf global python 3.9.0
   asdf global nodejs latest
   asdf global ruby 2.7.4
   ```

1. poetry の補完

   ```sh
   poetry completions fish > ~/.config/fish/completions/poetry.fish
   poetry config virtualenvs.in-project true
   ```

### python 周りをインストールする

0. [pipx をインストールする（Homebrew でしてある）.](https://pipxproject.github.io/pipx/installation/)

   ```sh
   pipx ensurepath
   ```

1. 必要なモジュールをインストールする.

   ```sh
   pipx install flake8
   pipx install black
   pipx install isort
   pipx install mypy
   pipx install sphinx
   ```

### Rust のインストール

1. rustup でインストール (Homebrew でインストール済)

   ```sh
   rustup-init
   ```

1. Rust Language Server のインストール

   ```sh
   rustup component add rls rust-analysis rust-src
   ```

1. cargo-edit のインストール

   ```sh
   cargo install cargo-edit
   ```

### eskk の設定

1. [eskk の辞書ファイル](http://openlab.jp/skk/wiki/wiki.cgi?page=SKK%BC%AD%BD%F1)をダウンロードする.

   1. SKK-JISYO.S と SKK-JISYO.L をダウンロードする。
   2. SKK-JISYO.S を my-jisyo にリネームする。
   3. 上記 2 ファイルを以下のディレクトリへ移動する。

      ```sh
      mv my-jisyo SKK-JISYO.L ~/.config/eskk
      ```

1. 使い方は以下を参考にする。

   - <https://qiita.com/jan_pali_1212/items/363a0b78408dcb2ec6d7>
   - <https://blog.manj.io/entry/20181221/1545318000>
   - <http://quruli.ivory.ne.jp/document/ddskk_14.2/skk_3.html#g_t_00e5_0085_00a5_00e5_008a_009b_00e3_0083_00a2_00e3_0083_00bc_00e3_0083_0089>

## その他

### Tex の文字の設定

1. <https://texwiki.texjp.org/?TeX%20Live%2FMac> ここに従い, 設定する.

### Mac のクリーンインストール方法

1. 電源シャットダウンする.
1. command + R + 電源 キー３つ長押しで、[ macOS ユーティリティ ] 起動する.
1. [ ディスクユーティリティ ] 選択する.
1. [ MacintoshHD ] を消去.
1. [ ディスクユーティリティ ] 終了し, [ macOS ユーティリティ ] に戻る.
1. [ macOS を再インストール ] 選択する.
1. WiFi に接続する.
1. フルネームとアカウント名を同じにする. (例: daisuke.oku)
