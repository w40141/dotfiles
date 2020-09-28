クリーンインストールなどやること一覧
===

## Macの設定

1. 隠しファイルを表示する.  

	defaults write com.apple.finder AppleShowAllFiles TRUE
	defaults read com.apple.finder AppleShowAllFiles
	killall Finder


1. DS_Storeを作成しないようにする.  

    defaults write com.apple.desktopservices DSDontWriteNetworkStores true
    defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true


## dotfilesによるバックアップ復元  

### 1. Homebrew をインストールする.  

1. 以下のコマンドをコピペする.  

        $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    >[homebrew](http://brew.sh/index_ja.html)

1. 以下のコマンドでエラーを確認する.  

        $ brew doctor  

### 2. dotfilesをgitからcloneする.  

1. 以下のコマンドをコピペする.  

        $ git clone https://github.com/w40141/dotfiles.git

2. シンボリックリンクを貼る.  

        $ cd dotfiles
        $ ./init.sh

3. brew bundle でアプリを一括インストールする.  
2回くらいやると大丈夫

        $ brew bundle --global

1. `brew man` コマンドをするとなんだかうまくいく. 

### 3. fish, neovim, pipx, poetryを整える.

1. fish の設定

    1. fish のパスの確認する.  

            which fish

    1. シェルの変更する.  

            sudo vi /etc/shells

    1. 末尾にfishのパス (/usr/local/bin/fish) を追加する.

    1. ログインシェルをfish に変更する.  

            fish
            chsh -s /usr/local/bin/fish

    1. poetryの補完

            poetry completions fish > ~/.config/fish/completions/poetry.fish

1. neovimのインストール

    1. pyenv の設定

            pyenv init
            pyenv install lastest python2
            pyenv install lastest python3
            cd ~/.config/nvim/neovim3
            poetry install

    1. rbenv の設定

            rbenv init
            rbenv install lastest
            rbenv global lastest
            rbenv rehash
            gem install neovim

    1. node の設定

            nodenv init
            nodenv install lastest
            nodenv global lastest
            nodenv rehash
            yarn global add neovim

1. python周りをインストールする

    1. [pyenvのglobalにpipxをインストールする.](https://pipxproject.github.io/pipx/installation/)  

            pip install pipx

    1. 必要なモジュールをインストールする.  

            pipx install flake8
            pipx install black
            pipx install isort
            pipx install mypy

    1. [poetryをインストールする](https://python-poetry.org/docs/)

            curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python


## SSHの設定

1. 秘密鍵と公開鍵を作る.  

	1. RSA 4096bit  

			$ ssh-keygen -t rsa -b 4096

	2. Ed25519  

			$ ssh-keygen -t ed25519

1. .ssh ディレクトリを作り,  config ファイルを書く. config ファイルはどこかから持ってくる. 

1. github などにアクセスをして確認する. 

        $ ssh -T git@github.com

## Tex の文字の設定  

1. https://texwiki.texjp.org/?TeX%20Live%2FMac ここに従い, 設定する. 


## Mac のクリーンインストール方法

1. 電源シャットダウンする.  
1. command + R + 電源 キー３つ長押しで、[ macOSユーティリティ ] 起動する.  
1. [ ディスクユーティリティ ] 選択する.  
1. [ MacintoshHD ] を消去.  
1. [ ディスクユーティリティ ] 終了し, [ macOSユーティリティ ] に戻る.  
1. [ macOSを再インストール ] 選択する.  
1. WiFi に接続する.  
1. フルネームとアカウント名を同じにする. (例: daisuke.oku)

