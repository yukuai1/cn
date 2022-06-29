# 系统设置

## 安全设置

**操作步骤**

进入【系统配置】-【安全配置】

![](/image/Bastion/security.png) 

Access Key ID：提供用户的Access Key ID 和 Access Key Secret,否则“会话审计”和“操作审计”功能将无法正常使用。Access Key ID和Access Key Secret是您访问京东云API的密钥，可操作您名下的所有资源，为了您的财产和服务安全，请妥善保存和定期更换密钥。详细信息请参见[Accesskey管理](../../../../User-Service/Account-Management/AccessKey-Management.md)。
   
登录超时：编辑登录超时时间，完成后单击确定完成更改。
   
SSH最大空闲时间：超过最大空闲时间没有任何操作，将自动断开连接。

**开启零信任模式**

点击开启零信任，则弹出指导页面，如下图。

![](/image/Bastion/security1.png) 

a.**注意事项：**

京东云堡垒机的零信任模型暂时仅支持Chrome浏览器，通过安装浏览器扩展插件的方式进行终端绑定。您需要在开启前记录堡垒机实例中管理员的AccessKey及SecretKey，并配置到浏览器扩展插件中。

b.**插件安装：**

- 步骤一: 点击下载零信任插件并解压到本地目录。

- 步骤二: 在Chrome浏览器地址栏输入： chrome://extensions，点击按钮“加载已解压的扩展程序”，并选择刚刚解压的路径, 为了插件正常运行，不要删除此路径。

![](/image/Bastion/security2.png) 

- 步骤三：安装成功后，会出现“京东云堡垒机”的扩展插件图标。

![](/image/Bastion/security3.png) 

- 步骤四：将需要运维的堡垒机地址，以及用户的AccessKey及SecretKey配置到扩展插件中，并设置为“启用”状态；后续登录堡垒机控制台则只能通过此处进入。

![](/image/Bastion/security4.png) 

配置信息： 

堡垒机名称：堡垒机名称。

堡垒机地址：填写堡垒机实例域名

Accesskey ID：通过【用户管理】列表复制相关信息

Access Key Secret：通过【用户管理】列表复制相关信息

## 存储管理

进入【系统配置】-【存储管理】

![](/image/Bastion/security5.png) 

**存储配置**：通过存储管理可以查看堡垒机磁盘数据状态。


**转储配置**：可以将堡垒机日志（包含操作日志、会话日志、sftp日志和数据库日志）转存至京东云对象存储。

**自动删除**：在自动删除下，设置自动删除多少天之前的数据。

## 日志备份

进入【系统配置】-【存储管理】可以通过日志备份功能，方便下载任意时间段的审计日志。

![](/image/Bastion/security6.png) 

点击“创建备份”按钮，创建日志备份任务。选择时间范围，并选择需要导出的内容（操作日志、会话日志），即可生成备份文件。

![](/image/Bastion/backup.png) 

## 界面设置

界面设置主要是对登录堡垒机界面/标题、系统logo进行设置，设置后下次登录即展示最新设置。也可恢复默认状态。

![](/image/Bastion/security7.png) 



