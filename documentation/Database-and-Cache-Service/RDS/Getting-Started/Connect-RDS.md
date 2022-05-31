# 连接数据库
本文主要介绍实例初始化后，几种连接数据库实例的方式。

## 准备工作
* 创建一个mysql实例
* 创建数据库和账号

## 通过 DMS 连接实例
1. 登录 [云数据库 RDS 控制台](https://rds-console.jdcloud.com/database)。
2. 选择需要连接的目标实例，点击 **操作** 这一列的 **登录数据库**。
3. DMS 登录框界面如下图，连接云数据库 RDS 操作说明如下
    * 第一行文本框填写连接云数据库 RDS 的账号。
    * 第二行文本框填写云数据库 RDS 账号对应的密码，请确保账号和密码是对应的。
    * 点击 **执行** 按钮，发起连接云数据库 RDS 请求。
    ![4.png](https://img1.jcloudcs.com/cms/870cf55e-5a95-438e-b3e9-0015eee0bd8120170904172035.png)

## 通过京东云主机连接数据库
在京东云主机安装RDS客户端后，可进入命令行方式连接数据库。

1. 命令格式：mysql -h域名 -P端口 -u用户名-p密码 。
2. 域名：要访问的云数据库的域名，域名展示在云数据库的详情页面。
3. 端口：链接端口号默认为3306，其中PostgreSQL默认端口是5432。
4. 用户名：在创建数据库时的用户名。
5. 密码：用户名对应的密码。

## 通过本地数据库管理软件连接实例
如果需要本地的数据库管理软件连接云数据库 MySQL/Percona/MariaDB/PostgreSQL，默认云数据库 MySQL/Percona/MariaDB/PostgreSQL 不支持外网访问，需要手动开启，具体操作请参见 [开启外网访问](../Operation-Guide/Instance/Internet-Access.md)。
我们以 Sequel Pro 软件为例，介绍下如何连接云数据库 MySQL/Percona/MariaDB/PostgreSQL

### 操作步骤
1. 打开本地的数据库管理软件，具体参数说明如下：
    * Host：填写云数据库 MySQL/Percona/MariaDB/PostgreSQL 的外网访问域名。
    * Username：填写云数据库 MySQL/Percona/MariaDB/PostgreSQL 的账号。
    * Password：填写云数据库 MySQL/Percona/MariaDB/PostgreSQL 的账号对应的密码。
    * Port： MySQL/Percona/MariaDB默认就是 3306，其中PostgreSQL默认端口是5432，其他不需要做任何改动。

    ![截图](https://img1.jcloudcs.com/cms/94be7bf2-3a37-4d1d-9add-cb35d27cc7aa20180803100645.jpeg)


2.点击 **connect** 按钮，就可以连接到云数据库实例了。 
