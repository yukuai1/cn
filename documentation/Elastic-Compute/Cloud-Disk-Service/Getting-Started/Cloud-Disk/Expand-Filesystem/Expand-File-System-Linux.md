# 扩容文件系统（Linux无分区）

在云硬盘控制台完成扩容操作并挂载此云硬盘后，需要登录云主机对文件系统进行扩容才可继续使用。在控制台对云硬盘的扩容操作可参见“[控制台扩容操作](https://docs.jdcloud.com/cn/cloud-disk-service/disk-expand)”

如果您的云硬盘有分区，请参照“[扩容文件系统（有分区）](https://docs.jdcloud.com/cn/cloud-disk-service/expand-file-system-multi-partition)”文档进行分区。如果您直接在云硬盘上制作的文件系统，请参照一下步骤进行文件系统扩容。

**注意：扩容之前要备份好数据，可通过创建该云硬盘的快照进行数据备份。避免因误操作等因素导致数据丢失**

以CentOS操作系统为例，假设需扩容的云硬盘原大小为20GB，在控制台已扩容至50GB并重新挂载。文件系统扩容操作如下（需要root权限），操作前可以通过执行 `lsblk -f` 确认分区的云盘或分区的文件系统，再进行对应的扩容操作：

## XFS文件系统的扩容

1. 1、云硬盘控制台扩容云盘
   2、lsblk 确认裸盘扩容成功
   3、xfs_growfs -d /mnt # 注意参数是挂载点，不是设备节点
   4、df -h 确认扩容成功

## ext2、ext3或ext4文件系统的扩容

1. 1、云硬盘控制台扩容云盘
   2、进入云主机，umount 文件系统
   3、lsblk 确认裸盘扩容成功
   4、e2fsck -f /dev/vde
   5、resize2fs /dev/vde
   6、重新mount文件系统，df -h 确认扩容成功