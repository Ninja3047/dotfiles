#!/bin/bash

cd $HOME/Torrents    # set your watch directory here (where rTorrent looks for torrent files)
[[ "$1" =~ xt=urn:btih:([^&/]+) ]] || exit;
echo "d10:magnet-uri${#1}:${1}e" > "meta-${BASH_REMATCH[1]}.torrent"
