# 手动搭建WordPress（CentOS 7）

WordPress是使用PHP语言开发的博客平台，在支持PHP和MySQL数据库的服务器上，您可以用WordPress架设自己的网站，也可以用作内容管理系统（CMS）。本文介绍如何在Linux操作系统的云主机实例上搭建WordPress网站。

## 前提条件

已创建Linux操作系统的云主机实例，并且手动部署LNMP环境，详情请参见<font color=red>手动搭建LNMP环境的超链接</font>

本文的示例步骤中，使用的软件版本信息如下所述。当您使用不同软件版本时，需要根据实际情况自行调整命令和参数配置。

- Linux：Linux 操作系统，本文以 CentOS 7.6 为例。
- Nginx版本：Nginx 1.20.1

- MySQL版本：MySQL 5.7.37
- PHP版本：PHP 7.0.33
- WordPress版本：5.1.2

## 配置数据库

1. 使用`root`用户登录MySQL，并输入密码。密码为您在搭建LNMP环境时为数据库设置的密码。

```
mysql -uroot -p
```

2. 为WordPress网站创建数据库。本教程中数据库名为`wordpress`。

```
create database wordpress;
```

3. 创建一个新用户管理WordPress库，提高安全性。

MySQL在5.7版本后默认安装了密码强度验证插件validate_password。您可以登录MySQL后查看密码强度规则。

```
show variables like "%password%";
```

本教程中创建新用户`wpuser`，新用户密码为`Password123#`。

```
create user 'wpuser'@'localhost' identified by 'Password123#';
```

赋予用户对数据库`wordpress`的全部权限。

```
grant all privileges on wordpress.* to 'wpuser'@'localhost' identified by 'Password123#';
```

使配置生效后退出Mysql。

```
flush privileges;
exit;
```

## 配置WordPress

1. 通过**yum**命令下载的WordPress保存在/usr/share/wordpress目录下，将下载的WordPress移动至网站根目录。

```
yum -y install wordpress
mv /usr/share/wordpress /usr/share/nginx/html/wordpress
```

2. 进入移动后的WordPress路径下，软连接配置文件wp-config.php，并编辑`wp-config.php`文件。

```
cd /usr/share/nginx/html/wordpress
ln -snf /etc/wordpress/wp-config.php wp-config.php
vim wp-config.php
```

3. 根据已配置的WordPress数据库信息，修改MySQL相关配置信息，修改代码如下所示。WordPress网站的数据信息将通过数据库的`wpuser`用户保存在名为`wordpress`的数据库中。

```
// ** MySQL 设置 - 具体信息来自您正在使用的主机 ** //
/** WordPress数据库的名称 */
define('DB_NAME', 'wordpress');

/** MySQL数据库用户名 */
define('DB_USER', 'wpuser');

/** MySQL数据库密码 */
define('DB_PASSWORD', 'Password123#');

/** MySQL主机 */
define('DB_HOST', 'localhost');
```

## 配置Nginx

运行以下命令打开Nginx配置文件。

```
vim /etc/nginx/nginx.conf
```

在`server`大括号内，将`root`后的内容替换为WordPress根目录。本示例中根目录为/usr/share/nginx/html/wordpress。

在`location ~ .php$`大括号内，将`root`后的内容替换为WordPress根目录。

<img src="https://img1.jcloudcs.com/cn/best-practice/Wordpress-LNMP/1.nginx-config-root-cata.jpg" alt="1.nginx-config-root-cata" style="width:80%;" />

重启Nginx

```
systemctl restart nginx
```

## 安装Wordpress网站

使用浏览器访问云主机公网IP，进入WordPress安装页面。

1. 填写网站基本信息，然后单击**安装WordPress**。

   填写信息参数说明：

   - 站点标题：WordPress网站的名称。例如：wordpressdemo。
   - 用户名：登录WordPress时所需的用户名，请注意安全性。例如：mike。
   - 密码：登录WordPress时所需的密码，建议您设置安全性高的密码。例如：Password456$。
   - 您的电子邮件：用于接收通知的电子邮件。例如：1234567890@jdcloud.com。

2. 单击**登录**。

3. 输入在安装WordPress时设置的用户名`mike`和密码`Password456$`，然后单击**登录**。成功进入您个人的WordPress网站。

<img src="https://img1.jcloudcs.com/cn/best-practice/Wordpress-LNMP/2.wordpress-init.jpg" alt="2.wordpress-init" style="width:80%;" />





