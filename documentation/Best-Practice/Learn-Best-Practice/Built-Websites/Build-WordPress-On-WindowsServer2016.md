# 手动搭建WordPress（Windows）

WordPress是使用PHP语言开发的博客平台，在支持PHP和MySQL数据库的服务器上，您可以用WordPress架设自己的网站，也可以用作内容管理系统（CMS）。本文介绍如何在Windows Server操作系统的云主机实例上搭建WordPress网站。

## 前提条件

已创建Windows操作系统的云主机实例，并且手动部署WIPM环境，详情请参见[手动搭建WIPM环境](https://docs.jdcloud.com/cn/learn-best-practice/build-wipm-env-manually)。

本文的示例步骤中，使用的软件版本信息如下所述。当您使用不同软件版本时，需要根据实际情况自行调整命令和参数配置。

- Windows：Windows Server 2016 （数据中心版 64位 中文版）
- IIS版本：10.0

- MySQL版本：MySQL Community Server 8.0.28
- PHP版本：PHP 8.1.3
- WordPress版本：5.9.2

## 步骤1：下载WordPress安装包

1. 前往WordPress官网下载[WordPress安装包](https://wordpress.org/download/releases/)。

   本教程下载的版本为[5.9.2](https://wordpress.org/wordpress-5.9.2.zip)。

   <img src="https://img1.jcloudcs.com/cn/best-practice/Wordpress-WIPM/0.wordpress-download-version.jpg" alt="0.wordpress-download-version" style="width:80%;" />

2. 解压WordPress安装包。

   本教程将安装包解压至`C:\wordpress`目录下。

<img src="https://img1.jcloudcs.com/cn/best-practice/Wordpress-WIPM/1.wordpress-install-package.jpg" alt="1.wordpress-install-package" style="width:70%;" />

## 步骤2：为WordPress创建Mysql数据库

1. 在开始菜单找到Mysql Command Line Client

<img src="https://img1.jcloudcs.com/cn/best-practice/WIPM/43.mysql-command-line.jpg" alt="43.mysql-command-line" style="width:30%;" />

2. 输入root密码后即可实现本地访问Mysql服务

3. 为WordPress网站创建数据库的名称为`wordpress`

```SQL
create database wordpress;
```

<img src="https://img1.jcloudcs.com/cn/best-practice/Wordpress-WIPM/2.create-wordpress-db.jpg" alt="2.create-wordpress-db" style="width:80%;" />



## 步骤3：配置WordPress

1. 在WordPress解压路径`C:\wordpress`下，找到`wp-config-sample.php`文件，复制该文件，并将副本文件重命名为`wp-config.php`。

2. 使用文本编辑器打开`wp-config.php`文件，修改已创建的MySQL数据库`wordpress`有关的信息。

   如下图所示：

<img src="https://img1.jcloudcs.com/cn/best-practice/Wordpress-WIPM/3.wordpress-config-modify.jpg" alt="3.wordpress-config-modify" style="width:70%;" />

3. 保存`wp-config.php`文件。

## 步骤4：在IIS添加WordPress网站

在服务器管理器顶部菜单栏，单击**工具**> **Internet Information Services (IIS)管理器**。

<img src="https://img1.jcloudcs.com/cn/best-practice/Wordpress-WIPM/4.server-manager-IIS.jpg" alt="4.server-manager-IIS" style="width:80%;" />

在**连接**列表，单击**服务器名称** > **网站**。将已绑定80端口的网站删除，或者修改80端口为其他未被占用的端口号，例如：8080端口。

<img src="https://img1.jcloudcs.com/cn/best-practice/Wordpress-WIPM/5.web-default.jpg" alt="5.web-default" style="width:80%;" />

在右侧**操作**区域，单击**添加网站**，添加WordPress网站。添加信息如下图所示：

<img src="https://img1.jcloudcs.com/cn/best-practice/Wordpress-WIPM/6.add-wordpress-config.jpg" alt="6.add-wordpress-config" style="width:60%;" />

配置说明：

- 网站名称：自定义网站名称，本教程使用`wordpress`作为网站名称。
- 应用程序池：DefaultAppPool。
- 物理路径：您WordPress的解压目录，本教程的目录为`C:\wordpress`。
- 端口：80。

## 步骤5：配置php.ini文件

1. 在 PHP 的解压安装路径下，打开`php.ini`文件，并修改以下内容。

   （1）根据 PHP 版本不同，修改相应的配置参数：

   ```
   针对 PHP 版本为5.X版本，找到 extension=php_mysql.dll，删除前面的;。
   针对 PHP 版本为7.X版本，找到 extension=php_mysqli.dll 或 extension=mysqli，删除前面的;。
   ```

   （2）找到 `extension_dir = "ext"`，删除前面的`;`。

2. 保存 `php.ini` 文件。

如果不执行本步骤的配置，将会报错，如下所示。

<img src="https://img1.jcloudcs.com/cn/best-practice/Wordpress-WIPM/7.visit-localhost-php-error.jpg" alt="7.visit-localhost-php-error" style="width:80%;" />

## 步骤6：

使用浏览器访问云主机公网IP，进入WordPress安装页面。

1. 填写网站基本信息，然后单击**安装WordPress**。

   填写信息参数说明：

   - 站点标题：WordPress网站的名称。例如：wordpressdemo。
   - 用户名：登录WordPress时所需的用户名，请注意安全性。例如：mike。
   - 密码：登录WordPress时所需的密码，建议您设置安全性高的密码。例如：Password456$。
   - 您的电子邮件：用于接收通知的电子邮件。例如：1234567890@jdcloud.com。

<img src="https://img1.jcloudcs.com/cn/best-practice/Wordpress-WIPM/8.wordpress-install-init.jpg" alt="8.wordpress-install-init" style="width:70%;" />

2. 单击**登录**。

3. 输入在安装WordPress时设置的用户名`mike`和密码`Password456$`，然后单击**登录**。

   成功进入您个人的WordPress网站管理后台，现在可以配置样式并开始发布博客文章了。

   <img src="https://img1.jcloudcs.com/cn/best-practice/Wordpress-WIPM/9.wordpress-web-demo.jpg" alt="9.wordpress-web-demo" style="width:80%;" />
