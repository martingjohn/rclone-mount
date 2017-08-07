FROM martinjohn/rclone:latest

# Install dependancies and remove cache (fuse for mount - will that work?)
RUN apk update && apk add \
        fuse \
        nfs-utils \
     && rm -rf /var/cache/apk/*

RUN echo "/mnt *(ro,sync,no_subtree_check)" >> /etc/exports \
    && /usr/sbin/exportfs -r \
    && /sbin/rpcbind -- \
    && /usr/sbin/rpc.statd \
    && /usr/sbin/rpc.nfsd |: \
    && /usr/sbin/rpc.mountd

VOLUME /data
VOLUME /mnt

EXPOSE 111/udp
EXPOSE 2049/tcp
ENTRYPOINT ["rclone","--config","/data/rclone.conf"]
