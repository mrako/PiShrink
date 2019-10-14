# PiShrink

PiShrink is a bash script that automatically shrink a pi image that will then resize to the max size of the SD card on boot. This will make putting the image back onto the SD card faster and the shrunk images will compress better.

## Usage

```
sudo pishrink.sh [-sdrpzh] imagefile.img [newimagefile.img]
  -s: Skip autoexpand
  -d: Debug mode on
  -r: Use advanced repair options
  -z: Gzip compress image after shrinking
  -h: display help text
```

If you specify the `newimagefile.img` parameter, the script will make a copy of `imagefile.img` and work off that. You will need enough space to make a full copy of the image to use that option.

* `-s` will skip the autoexpanding part of the process.
* `-d` will create a logfile `pishrink.log` which may help for problem analysis.
* `-r` will attempt to repair the filesystem if regular repairs fail
* `-z` will Gzip compress the image after shrinking. The `.gz` extension will be added to the filename.

## Usage with Docker

    docker build -t pishrink .
    docker run --privileged -v $(pwd):/root pishrink [-sdrpzh] imagefile.img [newimagefile.img]

## Example ##

```bash
[user@localhost PiShrink]$ docker run --privileged -v $(pwd):/root pishrink pi.img
e2fsck 1.42.9 (28-Dec-2013)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/loop1: 88262/1929536 files (0.2% non-contiguous), 842728/7717632 blocks
resize2fs 1.42.9 (28-Dec-2013)
resize2fs 1.42.9 (28-Dec-2013)
Resizing the filesystem on /dev/loop1 to 773603 (4k) blocks.
Begin pass 2 (max = 100387)
Relocating blocks             XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
Begin pass 3 (max = 236)
Scanning inode table          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
Begin pass 4 (max = 7348)
Updating inode references     XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
The filesystem on /dev/loop1 is now 773603 blocks long.

Shrunk pi.img from 30G to 3.1G
```

## Contributing

If you find a bug please create an issue for it. If you would like a new feature added, you can create an issue for it but I can't promise that I will get to it.

Pull requests for new features and bug fixes are more than welcome!
