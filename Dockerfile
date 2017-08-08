FROM martinjohn/rclone:latest

# Install dependancies and remove cache
RUN apk update && apk add \
        fuse \
        nfs-utils \
     && rm -rf /var/cache/apk/*

VOLUME /data
VOLUME /mnt

EXPOSE 2049/tcp
WORKDIR /tmp
ADD mount.sh /tmp/mount.sh
RUN chmod 755 /tmp/mount.sh
ENTRYPOINT ["/tmp/mount.sh"]
