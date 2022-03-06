# 在线迁移教程

在线迁移流程如下图所示，本文将详细介绍各环节的操作步骤。
![](https://img1.jcloudcs.com/cn/image/vm/migration-operation-overview.png)

## 迁移前准备
### 1、迁移条件确认
#### 1.1、运行环境确认<br>

仅支持与以下京东云官方镜像操作系统一致的运行环境迁移，且须保证系统类型、版本、内核、位数完全一致。同时，为确保迁移后可在京东云环境下正常运行并支持平台提供的生命周期管理能力，请在迁移前完成虚拟化驱动 virtio 的安装，并参照 [导入镜像](https://docs.jdcloud.com/cn/virtual-machines/import-private-image) 的要求尽量保持系统关键配置一致。
* CentOS（64位）：8.2/7.6/7.3/7.2/6.9
* Ubuntu（64位）：20.04/18.04/16.04/14.04

#### 1.2、 网络联通确认<br>
由于源节点、目标节点、控制节点须保证两两网络可达，因此通常情况下，意味着三个节点均需要具有公网访问的能力，请提前规划好网络联通方式。

### 2、创建目标节点
根据待迁移节点的操作系统版本，在京东云环境下预先创建出与其匹配的目标节点主机，如涉及多个节点迁移，请尽量在云主机名称上有所区分和匹配，便于后续配置迁移任务。关于云主机创建详见 [创建云主机](https://docs.jdcloud.com/virtual-machines/create-instance)。

### 3、购买迁移许可
在线迁移服务为付费服务，可前往京东云云市场购买。建议您提前与京东云客服联系，获得在线迁移可执行情况的评估协助，再行购买合适数量的迁移许可。

## 迁移节点配置
### 1、安装迁移服务
请根据迁移节点的操作系统及版本，下载对应的代理程序安装包，源节点和目标节点均需要安装且安装步骤相同。

#### 1.1、下载迁移代理程序安装包
```
wget https://bj-vm-migration.s3.cn-north-1.jdcloud-oss.com/info2soft-<i2-version>.<os-version>.rpm
```
内网环境下载时，请将链接中的bucket地址"bj"和地域参数"cn-north-1"分别替换成主机所在地域的代码，并将域名中的"s3"改为"s3-internal"，将会使用免费内网流量下载：
* 华北-北京："bj","cn-north-1"
* 华南-广州："gz","cn-south-1"
* 华东-宿迁："sq","cn-east-1"
* 华东-上海："sh","cn-east-2"

#### 1.2、安装代理程序
1.2.1、CentOS系统安装代理程序

执行rpm包安装。
```
rpm -ivh info2soft-i2node-<i2-version>.<os-version>.rpm
```
如果系统是最小安装的，将会提示缺少zip, unzip, psmisc等3个软件包，可直接使用yum安装。
```
yum install -y zip unzip psmisc
```
在安装模式处，选择“1”；加载块复制驱动处，选择“n”；修改监听端口提示处，选择“n”。随后按回车键完成安装。
确认以下进程是否开启，以确保服务成功安装。
```
service i2node status
```
1.2.2、Ubuntu系统安装代理程序

执行deb包安装。
```
sudo dpkg -i info2soft-i2node-<i2-version>.<os-version>.rpm
```
如果系统是最小安装的，将会提示缺少 unzip 包，可直接使用 apt-get 安装。
```
sudo apt-get install -y unzip
```
在安装模式处，选择“1”；加载块复制驱动处，选择“n”；修改监听端口提示处，选择“n”。随后按回车键完成安装。
确认以下进程是否开启，以确保服务成功安装。
```
service i2node status
```
### 2、开放服务端口
请确保各节点已开放对应服务端口，京东云云主机实例端口可通过安全组配置，详见 [配置安全组入站规则](https://docs.jdcloud.com/cn/virtual-machines/configurate-inbound-rules)。
