#!/bin/bash

# A script to transcode video in directory to Apple ProRes


# DNxHR is available in the following flavors:
# The -profile:v # is for DNxHR quality
# dnxhr_lb: DNxHR LB - Low Bandwidth (8-bit 4:2:2) Offline Quality
# dnxhr_sq: DNxHR SQ - Standard Quality (8-bit 4:2:2) (suitable for delivery format)
# dnxhr_hq: DNxHR HQ - High Quality (8-bit 4:2:2)
# dnxhr_hqx: DNxHR HQX - High Quality (12-bit 4:2:2) (UHD/4K Broadcast-quality delivery)
# dnxhr_444: DNxHR 444 - Finishing Quality (12-bit 4:4:4) (Cinema-quality delivery)

mkdir converted

if file = [*.mkv]
then
  for file in *.mkv; do ffmpeg -i "$file" -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le "${file%.mkv}".mov; done
fi

if file = [*.mp4]
then
  for file in *.mp4; do ffmpeg -i "$file" -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le "${file%.mp4}".mov; done
fi

if file = [*.MTS]
then
  for file in *.MTS; do ffmpeg -i "$file" -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le "${file%.MTS}".mov; done
fi

if file = [*.flv]
then
  for file in *.flv; do ffmpeg -i "$file" -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le "${file%.flv}".mov; done
fi

if file = [*.avi]
then
  for file in *.avi; do ffmpeg -i "$file" -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le "${file%.avi}".mov; done
fi

mv *.mov converted/
