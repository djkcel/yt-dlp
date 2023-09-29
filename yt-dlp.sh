#!/bin/bash

# Remove all .webm files in the Downloads directory to avoid confusion
rm -f ~/Downloads/*.webm
rm -f ~/Downloads/*.mkv

# Get the URL from the command line argument
url=$1

# Trim everything in the URL after an '&'
trimmed_url=$(echo "$url" | cut -d '&' -f 1)

# Set the path to the config file
config_file=~/config.txt

# Set the path to the downloads directory
downloads_dir=~/Downloads

# Download the video using yt-dlp and the config file
yt-dlp --config-location $config_file $trimmed_url

cd $downloads_dir  # change directory to ~/Downloads

# Convert the video to mp4 and move it to the downloads directory
for i in *.{webm,mkv}; do
    if [ -f "$i" ]; then
        if [[ "$i" == *.webm ]]; then
            ~/webm.sh "$i"
        elif [[ "$i" == *.mkv ]]; then
            ~/mkv.sh "$i"
        else
            file_name=$(basename "$i")
            base="${file_name%.*}"
            ffmpeg -i "$i" -codec copy "${base}.mp4"
            mv "${base}.mp4" "$downloads_dir"
        fi
    fi
done
