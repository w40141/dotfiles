dotfiles
-------------

**If you don't install brew, zsh, and git, you should install them.**  

1. Install brew  
	You past this command.  
	`$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`  
	>[homebrew](http://brew.sh/index_ja.html)

	You command `brew doctor` after installing brew.  
	If there are some errors, you must fix the errors.

2. Install zsh and git  
	Next, you install zsh and git.  
	`$ brew install zsh git`

3. Neobundle install  

		$ mkdir -p ~/.vim/bundle  
		$ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bunedle/neobundle.vim
		
    >http://qiita.com/Kuchitama/items/68b6b5d5ed40f6f96310  
    >https://github.com/Shougo/neobundle.vim  
	
4. git clone dotfiles  

		$ cd ~/ # if windows use this > cd %HOMEPATH%  
 		$ git clone https://github.com/w40141/dotfiles.git  
		$ cd dotfiles  
		$ sh dotfilesLink.sh # if windows use this > mklink.bat  
