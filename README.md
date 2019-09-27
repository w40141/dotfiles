クリーンインストールなどやること一覧
===

## dotfilesによるバックアップ復元  

### 1. Homebrew をインストールする.  

1. 以下のコマンドをコピペする.  

		$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	>[homebrew](http://brew.sh/index_ja.html)

2. 以下のコマンドでエラーを確認する.  

		$ brew doctor  

### 3. dotfilesをgitからcloneする.  

1. 以下のコマンドをコピペする.  
		
		$ git clone https://github.com/w40141/dotfiles.git

2. シンボリックリンクを貼る.  

		$ cd dotfiles
		$ ./init.sh

3. brew bundle でアプリを一括インストールする.  
2回くらいやると大丈夫

		$ brew bundle --global

### 4. neovim, fish, pip などを整える.

2. fish の設定

	1. fish のパスの確認する.  
			$ which fish

	2. シェルの変更する.  

			$ sudo vi /etc/shells

	3. 末尾にfishのパスを追加する.  

			/usr/local/bin/fish

	4. ログインシェルをfish に変更する.  

			$ fish
			$ chsh -s /usr/local/bin/fish

	5. fisher を導入する.  

			$ curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
		>[fisher](https://github.com/jorgebucaran/fisher)  

		以下のコマンドを打つ.
			$ fisher


1. neovimのインストール

1. pipの一括インストール

		$ pip install -r ./.requirements.txt



## SSHの設定

1. for RSA 4096bit  

		$ ssh-keygen -t rsa -b 4096

2. for Ed25519  

		$ ssh-keygen -t ed25519



## Mac のクリーンインストール方法

1. 電源シャットダウンする.  
1. command + R + 電源 キー３つ長押しで、[ macOSユーティリティ ] 起動する.  
1. [ ディスクユーティリティ ] 選択する.  
1. [ MacintoshHD ] を消去.  
1. [ ディスクユーティリティ ] 終了し, [ macOSユーティリティ ] に戻る.  
1. [ macOSを再インストール ] 選択する.  
1. WiFi に接続する.  
1. フルネームとアカウント名を同じにする.
