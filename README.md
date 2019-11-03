# DNxHD_ProRes-conversion-bash-script
This is a script to use ffmpeg to convert videos to DNxHD and apple prores for use in video editors like Davinci Resolve on Linux!

In my opnion DNxHD is better for processing using FFmpeg. There are special parameters for enabling DNxHR for 4K, and you have to choose very specific bitrates, but it spits out MOV files compatible with Premiere and Resolve.

-c:a should be pcm_s24be for better compatibility with NLEs since MOV wrappers like Big Endian audio when they’re typically recorded from something like a Atomos Shogun or Ninja.

The reason I say DNxHD is because the FFmpeg ProRes implementation was reverse engineered and is nowhere near QC passing quality for broadcast media.

The HQ presets are the only ones to support 10bit, everything else is 8bit, so that’s a disadvantage over ProRes, but DNxHD is properly built off of SMPTE papers for the standard, vs ProRes being Apple Proprietary.

But I have put the script to convert on prores based on Shane Milton [repository](https://github.com/ShaneMilton/ProRes-conversion-bash-script).

# How to use

Create a folder named **bin** in your home directory and add it to your path in the **~/.bashrc** using the text below.

`PATH="${PATH}:~/bin"`  

This is so you can execute the script from any ware on your system.

Then put the prores script into the bin folder and **chmod +x prores** to make executable.

# Changing the quality!

### The -profile:v # is for DNxHR quality
#### dnxhr_lb: DNxHR LB - Low Bandwidth (8-bit 4:2:2) Offline Quality
#### dnxhr_sq: DNxHR SQ - Standard Quality (8-bit 4:2:2) (suitable for delivery format)
#### dnxhr_hq: DNxHR HQ - High Quality (8-bit 4:2:2)
#### dnxhr_hqx: DNxHR HQX - High Quality (12-bit 4:2:2) (UHD/4K Broadcast-quality delivery)
#### dnxhr_444: DNxHR 444 - Finishing Quality (12-bit 4:4:4) (Cinema-quality delivery)

Change the text in `-profile:v dnxhr_hq` to the quality level you wold like to use.

## If using the prores script

### The -profile:v # is for ProRes quality
#### 0: ProRes422 (Proxy)
#### 1: ProRes422 (LT)
#### 2: ProRes422 (Normal)
#### 3: ProRes422 (HQ)

Change the number in `-profile:v 2` to the quality level you wold like to use.

# Out of the box

Conversion to an intermediate format: 

```
$ ffmpeg -i input.mp4 \
    -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p \
    -c:a pcm_s16le \
    -f mov output.mov
```

These files can now be used as input to Resolve and editing can commence.

Once done with rendering a conversion to MP4 might be in order again. For this I use settings discussed on Video StackExchange. While the original discussion was for YouTube, I find their recommendations quite good as a starting point:

```
ffmpeg -i render.mov \
    -c:v libx264 -pix_fmt yuv420p -crf 16 \
    -force_key_frames 'expr:gte(t,n_forced/2)' -bf 2 \
    -vf yadif -use_editlist 0 \
    -movflags +faststart \
    -c:a aac -q:a 1 \
    -ac 2 -ar 48000 \
    -f mp4 out.mp4
```




