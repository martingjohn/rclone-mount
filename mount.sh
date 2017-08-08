#!/bin/ash
rclone --config "/data/rclone.conf" mount test:Plex /mnt &
echo "/mnt *(fsid=1,ro,sync,no_subtree_check)" >> /etc/exports
/usr/sbin/exportfs -r
/sbin/rpcbind --
/usr/sbin/rpc.statd
/usr/sbin/rpc.nfsd |:
/usr/sbin/rpc.mountd

sleep 9000
