#!/usr/bin/env bash

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes
# For debugging
# set -o xtrace


command -v jq >/dev/null 2>&1 || { 
	echo >&2 "Required dependency jq not installed"; 
	exit 1; 
}

sub=${1:-wallpaper}

pic_path="$HOME/Pictures/reddit"

[[ ! -d "${pic_path}" ]] && mkdir -p ${pic_path}

readarray -t redditData < <(curl -H "User-Agent: ${USER}@${HOSTNAME}" -s https://www.reddit.com/r/${sub}/hot.json?limit=1 | jq -r '.data.children[0].data.url, .data.children[0].data.title')

printf "Got reddit data:\nurl — %s\ntitle — %s\n" "${redditData[@]}"

echo "Saving wallpaper to ${pic_path}"

img="${redditData[1]}.${redditData[0]##*.}"

wget -q ${redditData[0]} -O "${pic_path}/${img}"

xdg-open "${pic_path}/${img}"
