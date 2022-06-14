#! /bin/sh

output_dir=$1

for f in ./*
do
  filenme=`basename "$f" .mp4`
  ffmpeg -i "${f}" -c:v mpeg4 -q:v 2 -q:a 2  ${output_dir}/${filenme}.avi
done 
