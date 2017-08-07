# rclone-mount

For mounting a directory (extra permissions needed for FUSE)

    docker run \
           -it \
           --rm \
           --cap-add SYS_ADMIN \
           --device /dev/fuse \
           -v "/mnt/Onedrive:/mnt" \
           -v "/root/config:/root" \
           martinjohn/rclone-mount \
           mount remote:path/to/files /mnt
