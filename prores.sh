#!/bin/bash

# A script to transcode video in directory to Apple ProRes

# The -profile:v # is for ProRes quality
# 0: ProRes422 (Proxy)
# 1: ProRes422 (LT)
# 2: ProRes422 (Normal)
# 3: ProRes422 (HQ)

mkdir converted

if file = [*.mkv]
then
  for file in *.mkv; do ffmpeg -i "$file" -vcodec prores -profile:v 2 -acodec pcm_s16le "${file%.mkv}".mov; done
fi

if file = [*.mp4]
then
  for file in *.mp4; do ffmpeg -i "$file" -vcodec prores -profile:v 2 -acodec pcm_s16le "${file%.mp4}".mov; done
fi

if file = [*.MTS]
then
  for file in *.MTS; do ffmpeg -i "$file" -vcodec prores -profile:v 2 -acodec pcm_s16le "${file%.MTS}".mov; done
fi

if file = [*.flv]
then
  for file in *.flv; do ffmpeg -i "$file" -vcodec prores -profile:v 2 -acodec pcm_s16le "${file%.flv}".mov; done
fi

if file = [*.avi]
then
  for file in *.avi; do ffmpeg -i "$file" -vcodec prores -profile:v 2 -acodec pcm_s16le "${file%.avi}".mov; done
fi

mv *.mov converted/
