dotfilesによるバックアップ復元
===

### 1. Safari でiterm をダウンロードする.  

> https://www.iterm2.com/

### 2. Homebrew をインストールする.  

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

### 4. neovim, fish などを整える.
