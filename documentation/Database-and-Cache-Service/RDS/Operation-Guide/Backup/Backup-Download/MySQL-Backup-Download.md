# MySQL 备份下载
当您想获取云数据库 MySQL 实例的备份数据的时候，京东云提供了内网地址，外网地址供用户自行下载。

## 注意事项
* 内网地址，外网地址是有有效期的，如果超过了有效期地址会失效.
* 需要点击下载按钮，才能生成下载弹出框，才能获取新地址。

## 下载数据备份
1. 登录 [云数据库 RDS 控制台](https://rds-console.jdcloud.com/database)。
2. 选择需要进行备份数据下载的目标实例，点击目标实例的名称，进入到实例详情页。
3. 选择 **备份管理** 标签，选择你要下载的备份数据，点击 **操作** 这一列的 **下载**。
4. 备份下载弹出框参数说明  

   |参数|说明|
   |--|--|
   |地址有效期|支持设置地址有效期，有效期最长不超过24小时|
   |内网地址|提供内网访问的域名，支持在同一个VPC下的资源进行下载备份，速度更快|
   |外网地址|提供公网访问的域名，可以通过互联网下载备份数据，下载速度受限于公网的网络带宽，所以如果公网网络带宽太小且备份文件太大，下载时间会比较长。|
 
5. 点击 **本地下载** 按钮，直接通过浏览器的方式，下载备份数据。

   ![backup](../../../../../../image/RDS/backup_download.jpg)
   
## 下载日志备份
1. 登录 [云数据库 RDS 控制台](https://rds-console.jdcloud.com/database)。
2. 选择需要进行备份数据下载的目标实例，点击目标实例的名称，进入到实例详情页。
3. 选择 **备份管理** 标签，切换至 **binlog** tab页，点击**操作**列的**下载**。
## 相关问题
1. 如何使用下载的备份文件？
您可以将本地盘实例下载的备份文件恢复至自建数据库，具体请参见[将备份恢复到自建MySQL](https://docs.jdcloud.com/cn/rds/restore-backup-to-self-built-mysql-database)
## 相关API
下载数据备份：[describeBackupDownloadURL](https://docs.jdcloud.com/cn/rds/api/describebackupdownloadurl)
下载日志备份：[describeBinlogDownloadURL](https://docs.jdcloud.com/cn/rds/api/describebinlogdownloadurl)
