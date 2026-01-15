# README

開発環境を整えるためのドキュメントです。

## 目次

- [パソコンの設定](#パソコンの設定)
  - [Macの設定](#macの設定)
  - [Windowsの設定](#windowsの設定)
- [開発環境の設定](#開発環境の設定)
  - [設定ファイルの復元](#設定ファイルの復元)
  - [シェルの設定](#シェルの設定)
  - [SSH の設定](#sshの設定)
- [プログラミング言語の設定](#プログラミング言語の設定)
  - [asdfのインストール](#asdfのインストール)
  - [python周りをインストールする](#python周りをインストールする)
  - [Rustのインストール](#rustのインストール)
  - [eskkの設定](#eskkの設定)
  - [textlintの設定](#textlintの設定)
- [その他](#その他)
  - [Texの文字の設定](#texの文字の設定)
  - [Macのクリーンインストール方法](#macのクリーンインストール方法)

## PCの設定

### Macの設定

1. 隠しファイルを表示する

   ```sh
   defaults write com.apple.finder AppleShowAllFiles TRUE
   defaults read com.apple.finder AppleShowAllFiles
   killall Finder
   ```

2. DS_Storeを作成しないようにする

   ```sh
   defaults write com.apple.desktopservices DSDontWriteNetworkStores true
   defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
   ```

### Windowsの設定

ToDo

## 開発環境の設定

### 設定ファイルの復元

dotfilesで設定ファイルを管理している。

1. Homebrewをインストールする

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
   ```

   > [homebrew](http://brew.sh/index_ja.html)

1. windowsでは以下を設定する

```sh
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && \
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && \
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.config/fish/conf.d/user.fish
```

1. 次のコマンドでエラーを確認する

   ```sh
   brew doctor
   ```

1. dotfilesをGitからcloneする

   ```sh
   git clone https://github.com/w40141/dotfiles.git
   ```

1. シンボリックリンクを貼る

   ```sh
   cd dotfiles
   ./init.sh
   ```

1. brew bundleでアプリケーションを一括インストールする

うまくいかない場合、2回くらい実行する。

```sh
brew bundle --global
```

1. インストールできないものは都度変更する

### シェルの設定

fishを設定する。

1. fishのパスの確認する（`brew bundle --global` でインストール済なはず）

   ```sh
   which fish
   ```

1. シェルの変更する

   ```sh
   sudo vi /etc/shells
   ```

1. 末尾にfishのパス（`/usr/local/bin/fish`）を追加する

1. ログインシェルをfishに変更する

   ```sh
   fish
   chsh -s /usr/local/bin/fish
   ```

1. [fisher](https://github.com/jorgebucaran/fisher) をインストールする

   ```sh
   curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
   ```

1. fisherプラグインを入れる

   ```sh
   fisher update
   ```

### SSHの設定

1. 秘密鍵と公開鍵を作る

   1. RSA 4096bit

      ```sh
      ssh-keygen -t rsa -b 4096
      ```

   2. Ed25519

      ```sh
      ssh-keygen -t ed25519
      ```

1. .sshディレクトリを作り、 configファイルを書く。 configファイルはどこかから持ってくる

1. GitHubなどにアクセスをして確認する

   ```sh
   ssh -T git@github.com
   ```

1. dotfilesをHTTPSからsshへ変更する

   ```sh
   git remote set-url origin git@github.com:w40141/dotfiles.git
   ```

## プログラミング言語の設定

<!-- TODO mise に変更する -->

### asdfのインストール

1. [asdf](https://asdf-vm.com/#/core-manage-asdf)に従いインストールする

   ```sh
   echo -e "\nsource "(brew --prefix asdf)"/libexec/asdf.fish" >> ~/.config/fish/config.fish
   ```

1. 各種プログラミング言語をインストールする

   ```sh
   asdf plugin-add danhper/asdf-python
   asdf plugin-add asdf-vm/asdf-ruby
   asdf plugin-add asdf-vm/asdf-nodejs
   asdf plugin-add twuni/asdf-yarn
   asdf plugin-add asdf-community/asdf-poetry
   ```

1. 各種プログラミング言語のバージョンをインストールする

   ```sh
   asdf install python 3.9.0
   asdf install nodejs latest
   asdf install ruby 2.7.4
   ```

1. 各種プログラミング言語のバージョンをglobalで指定する

   ```sh
   asdf global python 3.9.0
   asdf global nodejs latest
   asdf global ruby 2.7.4
   ```

1. poetryの補完

   ```sh
   poetry completions fish > ~/.config/fish/completions/poetry.fish
   poetry config virtualenvs.in-project true
   ```

### Python周りをインストールする

0. [pipx をインストールする(（Homebrew でしてある）.](https://pipxproject.github.io/pipx/installation/)

   ```sh
   pipx ensurepath
   ```

1. 必要なモジュールをインストールする

   ```sh
   pipx install flake8
   pipx install black
   pipx install isort
   pipx install mypy
   pipx install sphinx
   ```

### Rustのインストール

1. rustupをインストール（Homebrewでインストール済）

   ```sh
   rustup-init
   ```

1. Rust Language Serverのインストール

   ```sh
   rustup component add rls rust-analysis rust-src
   ```

1. cargo-editのインストール

   ```sh
   cargo install cargo-edit
   ```

### eskkの設定

1. [eskk の辞書ファイル](http://openlab.jp/skk/wiki/wiki.cgi?page=SKK%BC%AD%BD%F1)をダウンロードする。

   1. SKK-JISYO.SとSKK-JISYO.Lをダウンロードする
   1. SKK-JISYO.Sをmy-jisyoにリネームする
   1. 上記2ファイルを `~/.config/eskk` のディレクトリへ移動する

      ```sh
      mv my-jisyo SKK-JISYO.L ~/.config/eskk
      ```

1. 使い方は以下を参考にする

   - <https://qiita.com/jan_pali_1212/items/363a0b78408dcb2ec6d7>
   - <https://blog.manj.io/entry/20181221/1545318000>
   - <http://quruli.ivory.ne.jp/document/ddskk_14.2/skk_3.html#g_t_00e5_0085_00a5_00e5_008a_009b_00e3_0083_00a2_00e3_0083_00bc_00e3_0083_0089>

### textlintの設定

1. textlintとルールセットをインストールする

```sh
yarn global add \
    textlint \
    textlint-rule-prh \
    textlint-rule-preset-jtf-style \
    textlint-rule-preset-ja-technical-writing \
    textlint-rule-terminology \
    textlint-rule-preset-ja-spacing
```

## その他

### Texの文字の設定

1. <https://texwiki.texjp.org/?TeX%20Live%2FMac> ここに従い、 設定する。

### Macのクリーンインストール方法

1. 電源シャットダウンする
1. command + R + 電源キー3つ長押しで「macOSユーティリティ」起動する
1. 「ディスクユーティリティ」選択する
1. 「MacintoshHD」を消去する
1. 「ディスクユーティリティ」終了し「macOSユーティリティ」に戻る
1. 「macOSを再インストール」選択する
1. Wi-Fiに接続する
1. フルネームとアカウント名を同じにする（例：daisuke.oku）
