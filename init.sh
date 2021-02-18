#!/bin/bash

# DOTPATH=$HOME/dotfiles
DOTPATH=$(pwd)
echo $DOTPATH

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".gitmodules" ]] && continue
    echo $f
    ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done

CONFIG=$HOME/.config
DOTCONF=$DOTPATH/config
if [ ! -d $CONFIG ];then
	mkdir -p $CONFIG
fi

cd config
for f in ??*
do
	echo $f
	ln -snfv "$DOTCONF/$f" "$CONFIG/$f"
done

git submodule update -i
