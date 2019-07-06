#!/usr/bin/env bash

function r_mount() {
	eval "rclone mount $1: /home/teomik/$1 --allow-non-empty --vfs-cache-mode minimal"
}

r_mount GoogleDrive &
r_mount GoogleDrive_WFU &
r_mount OneDrive &
r_mount OneDrive_WFU &

