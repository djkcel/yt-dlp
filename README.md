A simple shell script for downloading a video using yt-dlp and then converting it to latest.mp4, no matter the format

Prereqs: ffmpeg and yt-dlp, probably Python

usage
yt-dlp (video URL)

You'll have to create mkv.sh and webm.sh yourself for converting the videos, or just use this:

webm
#!/bin/bash
cd ~/Downloads
rm -rf latest.mp4
ffmpeg -fflags +genpts -i ./*.webm -r 24 latest.mp4

mkv
#!/bin/bash
cd ~/Downloads
rm -rf latest.mp4
ffmpeg -fflags +genpts -i ./*.mkv -r 24 latest.mp4
