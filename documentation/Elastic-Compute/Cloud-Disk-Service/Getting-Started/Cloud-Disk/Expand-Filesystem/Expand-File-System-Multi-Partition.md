# 扩容文件系统（有分区）



## 扩容Windows系统多分区的云硬盘

以Windows Server 2012 R2 标准版 64位为例，将云主机已挂载的云硬盘由20G扩容到40G。

1、打开Windows服务器管理器，进入磁盘管理页面：

[![img](https://github.com/jdcloudcom/cn/raw/edit/image/Elastic-Compute/CloudDisk/cloud-disk/expand-filesystem/expand_multipart_001.jpg)](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/cloud-disk/expand-filesystem/expand_multipart_001.jpg)

2、在需要进行扩容的分区上点击右键，然后选择扩展卷，按照向导进行扩容即可。

[![img](https://github.com/jdcloudcom/cn/raw/edit/image/Elastic-Compute/CloudDisk/cloud-disk/expand-filesystem/expand_multipart_002.jpg)](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/cloud-disk/expand-filesystem/expand_multipart_002.jpg)

## 扩容Linux系统多分区的云硬盘

数据盘 xfs 有分区 系统盘也可以按此步骤扩容
1、云硬盘控制台扩容云盘
2、lsblk 确认裸盘扩容成功
3、扩容分区 growpart /dev/vdc 1 # 1 是分区号，只支持扩最后一个分区
4、如果没有命令growpart，执行yum安装 yum install cloud-utils-growpart
5、lsblk 确认分区扩容成功
6、xfs_growfs -d /mnt # 注意参数是挂载点，不是设备节点
7、df -h 确认扩容成功

-------------------------

数据盘 ext2、ext3、ext4 有分区
1、云硬盘控制台扩容云盘
2、进入云主机，umount 文件系统
3、lsblk 确认裸盘扩容成功
4、扩容分区 growpart /dev/vdc 1 # 1 是分区号，只支持扩最后一个分区
5、如果没有命令growpart，执行yum安装 yum install cloud-utils-growpart
6、lsblk 确认分区扩容成功
7、e2fsck -f /dev/vdc1
8、resize2fs /dev/vdc1
9、重新mount文件系统，df -h 确认扩容成功