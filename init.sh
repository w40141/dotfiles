#!/bin/bash

DOTPATH=~/dotfiles
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".gitmodules" ]] && continue
    echo "$f"
	ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done
