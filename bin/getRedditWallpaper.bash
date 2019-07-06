#!/usr/bin/env bash

hash jq >/dev/null 2>&1 || { 
	echo >&2 "Required dependency jq not installed.  Aborting."; 
	exit 1; 
}

readarray -t redditData < <(curl -H "User-Agent: $USER@$HOSTNAME" -s https://www.reddit.com/r/wallpaper/hot.json?limit=1 | jq -r '.data.children[0].data.url, .data.children[0].data.title')

printf "Got reddit data:\nurl — %s\ntitle — %s\n" "${redditData[@]}"

ext=".jpg"

if [[ ${redditData[0]} = *".png" ]]; then
  ext=".png"
fi

pic_path="Pictures/reddit"

printf "Saving wallpaper to %s...\n" "$pic_path"

wget -q ${redditData[0]} -O $pic_path/"${redditData[1]}$ext"

xdg-open $pic_path/"${redditData[1]}$ext"
