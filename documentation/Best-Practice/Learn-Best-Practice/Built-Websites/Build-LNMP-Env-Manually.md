# 手动搭建LNMP环境（CentOS 7）

## 操作场景

LNMP 环境是指在 Linux 系统下，由 Nginx + MySQL/MariaDB + PHP 组成的网站服务器架构。本文档介绍如何在京东云云主机上手动搭建 LNMP 环境。

## 示例软件版本

本文的示例步骤中，使用的软件版本信息如下所述。当您使用不同软件版本时，需要根据实际情况自行调整命令和参数配置。

- Linux：Linux 操作系统，本文以 CentOS 7.6 为例。
- Nginx版本：Nginx 1.20.1

- MySQL版本：MySQL 5.7.37
- PHP版本：PHP 7.0.33

## 操作步骤

### 步骤一：准备编译环境

#### 1.关闭防火墙

（1）查看防火墙状态

- 如果防火墙的状态参数是inactive，则防火墙为关闭状态。
- 如果防火墙的状态参数是active，则防火墙为开启状态。

```Shell
systemctl status firewalld
```

（2）临时关闭防火墙

临时关闭防火墙后，如果Linux实例重启，则防火墙将会自动开启。

```Shell
systemctl stop firewalld
```

（3）如果您想永久关闭防火墙，运行以下命令

```
systemctl disable firewalld
```

#### 2.**关闭**SELinux

（1）查看SELinux状态

- 如果SELinux状态参数是Disabled，则SELinux为关闭状态。
- 如果SELinux状态参数是Enforcing，则SELinux为开启状态。

```
getenforce
```

（2）关闭SELinux

如果SELinux为关闭状态可以忽略此步骤。

SELinux关闭的方式分为临时关闭和永久关闭，请您根据自身业务需求进行选择。

```Shell
#临时关闭SELinux
setenforce 0
```

永久关闭SELinux需要修改配置文件，参考（<font color=red>阿里云文档，需要生成京东云自己的子页面</font>）：[配置SELinux](https://help.aliyun.com/document_detail/157022.htm?spm=a2c4g.11186623.0.0.37a067eebvvhxs#task-2385075)

### 步骤二：安装Nginx

安装Nginx并查看版本

```Shell
#安装nginx
yum -y install nginx

#查看nginx版本
nginx -v
```

返回结果如下所示，表示Nginx安装成功。

```Shell
nginx version: nginx/1.20.1
```

### 步骤三：安装Mysql

1.更新Yum源

```Shell
rpm -Uvh  http://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
```

2.导入公钥到RPM配置中

```
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
```

避免GPG验证不通过产生如下报错

```Shell
#报错1
mysql-community-server-5.7.37-1.el7.x86_64.rpm 的公钥尚未安装
失败的软件包是：mysql-community-server-5.7.37-1.el7.x86_64
GPG  密钥配置为：file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql

#报错2
源 "MySQL 5.7 Community Server" 的 GPG 密钥已安装，但是不适用于此软件包。请检查源的公钥 URL 是否配置正确。
失败的软件包是：mysql-community-server-5.7.37-1.el7.x86_64
GPG  密钥配置为：file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql
```

<font color=red>主要参考</font>：https://blog.csdn.net/enterpc/article/details/122702133

（2）安装Mysql

```Shell
yum -y install mysql-community-server
```

3.查看Mysql版本

```Shell
mysql -V
```

返回结果如下所示，表示MySQL安装成功。

```Shell
mysql  Ver 14.14 Distrib 5.7.37, for Linux (x86_64) using  EditLine wrapper
```

4.启动Mysql并设置开机启动

```Shell
systemctl start mysqld
systemctl enable mysqld
systemctl daemon-reload
```

### 步骤四：安装PHP

1.更新Yum源

```Shell
#添加epel源
yum install \
https://repo.ius.io/ius-release-el7.rpm \
https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

#添加Webtatic源
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
```

2.安装PHP

```Shell
yum -y install php70w-devel php70w.x86_64 php70w-cli.x86_64 php70w-common.x86_64 php70w-gd.x86_64 php70w-ldap.x86_64 php70w-mbstring.x86_64 php70w-mcrypt.x86_64  php70w-pdo.x86_64   php70w-mysqlnd  php70w-fpm php70w-opcache php70w-pecl-redis php70w-pecl-mongodb
```

3.查看PHP版本

```
php -v
```

返回结果如下所示，表示安装成功。

```Shell
PHP 7.0.33 (cli) (built: Dec  6 2018 22:30:44) ( NTS )
Copyright (c) 1997-2017 The PHP Group
Zend Engine v3.0.0, Copyright (c) 1998-2017 Zend Technologies
    with Zend OPcache v7.0.33, Copyright (c) 1999-2017, by Zend Technologies
```

### 步骤五：配置Nginx

1.备份Nginx配置文件

```
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
```

2.修改Nginx配置文件

```
vim /etc/nginx/nginx.conf
```

在`server`大括号内，修改或添加下列配置信息。除下面提及的需要添加或修改的配置信息外，其他配置保持默认值即可。

（1）添加或修改`location /`配置信息。

```Shell
        location / {
            index index.php index.html index.htm;
        }
```

（2）添加或修改`location /`配置信息

```Shell
        #添加下列信息，配置Nginx通过fastcgi方式处理您的PHP请求。
        location ~ .php$ {
            root /usr/share/nginx/html;    #将/usr/share/nginx/html替换为您的网站根目录，本文使用/usr/share/nginx/html作为网站根目录。
            fastcgi_pass 127.0.0.1:9000;   #Nginx通过本机的9000端口将PHP请求转发给PHP-FPM进行处理。
            fastcgi_index index.php;
            fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
            include fastcgi_params;   #Nginx调用fastcgi接口处理PHP请求。
        }
```

添加或修改配置信息后，文件内容如下图所示：

<img src="https://img1.jcloudcs.com/cn/best-practice/LNMP/1.nginx-config-php.jpg" alt="1.nginx-config-php" style="width:70%;" />

3. 启动Nginx服务，设置Nginx服务开机自启动。

```Shell
systemctl start nginx 
systemctl enable nginx
```

### 步骤六：配置Mysql

1. 运行以下命令查看/var/log/mysqld.log文件，获取并记录root用户的初始密码。

```Shell
grep 'temporary password' /var/log/mysqld.log
```

命令行返回结果如下，其中`iGffbskcq8<0`为MySQL的初始密码。在下一步重置root用户密码时，会使用该初始密码。

```
2022-03-16T00:58:44.986970Z 1 [Note] A temporary password is generated for root@localhost: iGffbskcq8<0
```

2. 运行以下命令配置MySQL的安全性。

```Shell
mysql_secure_installation
```

**说明**：在输入密码时，系统为了最大限度的保证数据安全，命令行将不做任何回显。您只需要输入正确的密码信息，然后按Enter键即可。

（1）输入Mysql初始密码

```Shell
Securing the MySQL server deployment.
Enter password for user root: #输入上一步获取的root用户初始密码
```

（2）为Mysql设置新密码

```Shell
The existing password for the user account root has expired. Please set a new password.

New password: #输入新密码。长度为8至30个字符，必须同时包含大小写英文字母、数字和特殊符号。特殊符号包含()` ~!@#$%^&*-+=|{}[]:;‘<>,.?/

Re-enter new password: #确认新密码。
The 'validate_password' plugin is installed on the server.
The subsequent steps will run with the existing configuration
of the plugin.
Using existing password for root.

Estimated strength of the password: 100 #返回结果包含您设置的密码强度。
Change the password for root ? ((Press y|Y for Yes, any other key for No) :Y #您需要输入Y以确认使用新密码。

#新密码设置完成后，需要再次验证新密码。
New password:#再次输入新密码。

Re-enter new password:#再次确认新密码。

Estimated strength of the password: 100
Do you wish to continue with the password provided?(Press y|Y for Yes, any other key for No) :Y #您需要输入Y，再次确认使用新密码。
```

（3）设置匿名用户、root登录等权限。

```Shell
Remove anonymous users? (Press y|Y for Yes, any other key for No) :Y  #输入Y删除匿名用户。
Success.

Disallow root login remotely? (Press y|Y for Yes, any other key for No) :Y #输入Y禁止使用root用户远程登录MySQL。
Success.

Remove test database and access to it? (Press y|Y for Yes, any other key for No) :Y #输入Y删除test库以及用户对test库的访问权限。
 - Dropping test database...
Success.
 - Removing privileges on test database...
Success.

Reload privilege tables now? (Press y|Y for Yes, any other key for No) :Y #输入Y重新加载授权表。
Success.
All done!
```

### 步骤七：配置PHP

1. 新建并编辑phpinfo.php文件，用于展示PHP信息。

```Shell
vim <网站根目录>/phpinfo.php

#<网站根目录>是您在nginx.conf配置文件中location ~ .php$大括号内，配置的root参数值
#本文配置的网站根目录为/usr/share/nginx/html
```

因此需要运行以下命令新建phpinfo.php文件：

```Shell
vim /usr/share/nginx/html/phpinfo.php
```

输入下列内容，函数`phpinfo()`会展示PHP的所有配置信息。

```PHP
<?php echo phpinfo(); ?>
```

2. 启动PHP-FPM并设置开机自启动

```Shell
systemctl start php-fpm
systemctl enable php-fpm
```

### 步骤八：测试访问LNMP配置信息页面

1. 在本地Windows主机或其他具有公网访问能力的Windows主机中，打开浏览器。

2. 在浏览器的地址栏输入`http://<云服务器公网IP地址>/phpinfo.php`进行访问。

   访问结果如下图所示，表示LNMP环境部署成功。

<img src="https://img1.jcloudcs.com/cn/best-practice/LNMP/2.phpinfo-test.jpg" alt="2.phpinfo-test" style="width:90%;" />

### 后续步骤

测试访问LNMP配置信息页面后，建议您运行以下命令将phpinfo.php文件删除，消除数据泄露风险。

```Shell
rm -rf <网站根目录>/phpinfo.php
```

本文配置的网站根目录为/usr/share/nginx/html，因此需要运行以下命令

```Shell
rm -rf /usr/share/nginx/html/phpinfo.php
```



