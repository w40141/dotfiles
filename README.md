# クリーンインストールなどやること一覧

## Mac の設定

1.  隠しファイルを表示する.

        defaults write com.apple.finder AppleShowAllFiles TRUE
        defaults read com.apple.finder AppleShowAllFiles
        killall Finder

1.  DS_Store を作成しないようにする.

        defaults write com.apple.desktopservices DSDontWriteNetworkStores true
        defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

## dotfiles によるバックアップ復元

### 1. Homebrew をインストールする.

1.  以下のコマンドをコピペする.

        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    > [homebrew](http://brew.sh/index_ja.html)

1.  windows では以下を設定する.

        test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
        test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
        echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.config/fish/conf.d/user.fish

1.  以下のコマンドでエラーを確認する.

        brew doctor

### 2. dotfiles を git から clone する.

1.  以下のコマンドをコピペする.

        git clone https://github.com/w40141/dotfiles.git

2.  シンボリックリンクを貼る.

        cd dotfiles
        ./init.sh

3.  brew bundle でアプリを一括インストールする.  
    2 回くらいやると大丈夫

        brew bundle --global

4.  インストールできないものは都度変更する.

## 開発環境を整える.

### 1. fish の設定

1.  fish のパスの確認する.

        which fish

1.  シェルの変更する.

        sudo vi /etc/shells

1.  末尾に fish のパス (/usr/local/bin/fish) を追加する.

1.  ログインシェルを fish に変更する.

        fish
        chsh -s /usr/local/bin/fish

1.  [fisher](https://github.com/jorgebucaran/fisher) をインストールする.

        curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

1.  fisher プラグインを入れる.

        fisher update

### 2. asdf のインストール

1.  [asdf](https://asdf-vm.com/#/core-manage-asdf) に従いインストールする.

        echo -e "\nsource "(brew --prefix asdf)"/libexec/asdf.fish" >> ~/.config/fish/config.fish

1.  各種プログラミング言語をインストールする.

        asdf plugin-add danhper/asdf-python
        asdf plugin-add asdf-vm/asdf-ruby
        asdf plugin-add asdf-vm/asdf-nodejs
        asdf plugin-add twuni/asdf-yarn
        asdf plugin-add asdf-community/asdf-poetry

1.  各種プログラミング言語のバージョンをインストールする.

        asdf install python 3.9.0
        asdf install nodejs latest
        asdf install ruby 2.7.4

1.  各種プログラミング言語のバージョンを global で指定する.

        asdf global python 3.9.0
        asdf global nodejs latest
        asdf global ruby 2.7.4

1.  poetry の補完

        poetry completions fish > ~/.config/fish/completions/poetry.fish
        poetry config virtualenvs.in-project true

### 3. python 周りをインストールする

0.  [pipx をインストールする（Homebrew でしてある）.](https://pipxproject.github.io/pipx/installation/)

        pipx ensurepath

1.  必要なモジュールをインストールする.

        pipx install flake8
        pipx install black
        pipx install isort
        pipx install mypy

### 4. neovim のインストール

1.  python の設定

        cd ~/.config/nvim/neovim3
        poetry install

1.  ruby の設定

        gem install neovim

1.  node の設定

        yarn global add neovim
        yarn global add coc

### 5. Rust のインストール

1.  rustup でインストール (Homebrew でインストール済)

        rustup-init

1.  Rust Language Server のインストール

        rustup component add rls rust-analysis rust-src

1.  cargo-edit のインストール

        cargo install cargo-edit

## SSH の設定

1.  秘密鍵と公開鍵を作る.

    1.  RSA 4096bit

            ssh-keygen -t rsa -b 4096

    2.  Ed25519

            ssh-keygen -t ed25519

1.  .ssh ディレクトリを作り, config ファイルを書く. config ファイルはどこかから持ってくる.

1.  github などにアクセスをして確認する.

        ssh -T git@github.com

## eskk の設定

1.  [eskk の辞書ファイル](http://openlab.jp/skk/wiki/wiki.cgi?page=SKK%BC%AD%BD%F1)をダウンロードする.

    1.  SKK-JISYO.S と SKK-JISYO.L をダウンロードする。
    2.  SKK-JISYO.S を my-jisyo にリネームする。
    3.  上記 2 ファイルを以下のディレクトリへ移動する。

             mv my-jisyo SKK-JISYO.L ~/.config/eskk

1.  使い方は以下を参考にする。

    - https://qiita.com/jan_pali_1212/items/363a0b78408dcb2ec6d7
    - https://blog.manj.io/entry/20181221/1545318000
    - http://quruli.ivory.ne.jp/document/ddskk_14.2/skk_3.html#g_t_00e5_0085_00a5_00e5_008a_009b_00e3_0083_00a2_00e3_0083_00bc_00e3_0083_0089

## Tex の文字の設定

1. https://texwiki.texjp.org/?TeX%20Live%2FMac ここに従い, 設定する.

## Mac のクリーンインストール方法

1. 電源シャットダウンする.
1. command + R + 電源 キー３つ長押しで、[ macOS ユーティリティ ] 起動する.
1. [ ディスクユーティリティ ] 選択する.
1. [ MacintoshHD ] を消去.
1. [ ディスクユーティリティ ] 終了し, [ macOS ユーティリティ ] に戻る.
1. [ macOS を再インストール ] 選択する.
1. WiFi に接続する.
1. フルネームとアカウント名を同じにする. (例: daisuke.oku)
