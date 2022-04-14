# 云硬盘扩容概述

<br>

## 概述

云硬盘是京东云为云主机提供的可扩展的存储设备，创建云硬盘后用户可对云硬盘升级容量，以增加存储空间，同时保留云硬盘上原有的数据。云硬盘执行升级容量操作之后，还需要在云主机上扩展云硬盘的文件系统以识别新增存储空间。

云硬盘扩容有多种场景，以下列出了云硬盘做数据盘时，常见的几种云硬盘扩容场景及相关文档链接，请您根据具体场景选择合适的扩容方式：



- 扩容 有分区的Windows或Linux 实例的数据盘，请参考[扩容文件系统（有分区）](https://docs.jdcloud.com/cn/cloud-disk-service/expand-file-system-multi-partition)。



- 扩容 Linux 实例未做分区的数据盘，请参考[扩容文件系统（Linux无分区）](https://docs.jdcloud.com/cn/cloud-disk-service/expand-file-system-linux)。


## 扩容限制

新款云硬盘分为通用型SSD云盘、性能型SSD云盘和容量型HDD云盘。新款云硬盘允许扩容的上限相同，均为16000GB。详情参考下表：



	

	




	
	


