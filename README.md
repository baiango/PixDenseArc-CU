# PixDenseArc-`CU`
> Yet another lossy image format.  
> But this time, it is in CUDA.

> The concept of GPGPU on the image hit me right at the wire!
# Goal
This image format aims to store the RGB888 pixels with the minimum amount of space by trading off with brute-force search differential coding and lossy compression.  

**However, it is still a lossy format.**

It's the same idea as the PNG filters. But more aggressive and it runs on GPU. It also compresses 3 color channels at once like QOI as well.
