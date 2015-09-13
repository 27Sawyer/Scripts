#!/bin/bash

if [[ ! -n $(pacman -Qdt) ]]; then
  echo '[-] No orphans to remove.'
else
    sudo pacman -Rns $(pacman -Qdtq)
fi

sudo pacman -Scc
sudo pacman-optimize
