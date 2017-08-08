# rclone-mount

For mounting a directory (extra permissions needed for FUSE)

    docker run \
           -it \                                   #
           --rm \                                  # remove once finished
           --cap-add SYS_ADMIN \                   # extra permissions needed for fuse mount
           --security-opt apparmor:unconfined \    #
           --device /dev/fuse \                    #
           -v "<empty directory>:/mnt" \           # need to provide a directory for the fuse mount otherwise it can't be nfs exported
           -v "/root/config:/root" \               # config file
           -p 2049:2049 \                          # expose NFS port
           martinjohn/rclone-mount

Once that's running

connect to nfs server

    mount -v <ip address>:/mnt /mnt/nfs
           

