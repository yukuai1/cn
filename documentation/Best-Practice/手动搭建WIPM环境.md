# 手动搭建WIPM环境

## 步骤1：安装IIS服务

### 操作场景

本文档以京东云官方镜像 Windows Server 2016 （数据中心版 64位 中文版） 操作系统为例，介绍在 Windows 云服务器上进行 IIS 角色添加与安装。

### 操作步骤

1. 登录 Windows 云服务器。

2. 在操作系统界面，打开服务器管理器。如下图所示：

<img src="../../image/Best-Practice/WIMP/1.服务器管理器.jpg" alt="1.服务器管理器" style="width:70%;" />

3. 单击**添加角色和功能**，弹出 “添加角色和功能向导” 窗口。
4. 在 “添加角色和功能向导” 窗口中，单击**下一步**。
5. 在 “选择安装类型” 界面，选择**基于角色或基于功能的安装**，并连续单击2次**下一步**。如下图所示：

<img src="../../image/Best-Practice/WIMP/2.添加角色和功能向导.jpg" alt="2.添加角色和功能向导" style="width:70%;" />



6. 在 “选择服务器角色” 界面，勾选“Web 服务器(IIS)”。如下图所示：
   弹出 “添加 Web 服务器(IIS) 所需的功能” 提示框。

<img src="../../image/Best-Practice/WIMP/3.服务器角色.jpg" alt="3.服务器角色" style="width:70%;" />

7. 在弹出的 “添加 Web 服务器(IIS) 所需的功能” 提示框中，单击**添加功能**。如下图所示：

<img src="../../image/Best-Practice/WIMP/4.Web 服务器(IIS) 所需的功能.jpg" alt="4.Web 服务器(IIS) 所需的功能" style="width:40%;" />

8. 单击**下一步**。
9. 在 “选择功能” 界面，勾选 “.NET Framework 3.5 功能”，并连续单击2次**下一步**。如下图所示：

<img src="../../image/Best-Practice/WIMP/5.功能-NET35.jpg" alt="5.功能-NET35" style="width:70%;" />

10. 在 “选择角色服务” 界面，勾选 “CGI”，单击**下一步**。如下图所示：

11. 确认安装信息，单击**安装**，并等待安装完成。如下图所示：

    <img src="../../image/Best-Practice/WIMP/7.确认安装所选内容.jpg" alt="7.确认安装所选内容" style="width:70%;" />

12. 安装完成后，如下图所示：

    <img src="../../image/Best-Practice/WIMP/8.服务和功能安装成功.jpg" alt="8.服务和功能安装成功" style="width:70%;" />

13. 在云服务器的浏览器中访问 `http://localhost/`，验证 IIS 是否安装成功。
    若出现以下界面，即表示成功安装。

    <img src="../../image/Best-Practice/WIMP/9.IIS默认web页面.jpg" alt="9.IIS默认web页面" style="width:70%;" />



## 步骤2：部署PHP环境

### 操作场景

本文档以京东云官方镜像 Windows Server 2016 （数据中心版 64位 中文版） 操作系统为例，介绍在  Windows 云服务器中配置 PHP ，以下实验中我们以PHP 8.1.3为示例。

### 操作步骤

PHP 5.3 版本后取消了安装包模式，仅通过 zip 文件和 debug pack 两种方式进行安装。以下操作以使用 zip 文件方式在 Windows Server 2016 环境下安装 PHP 为例。

#### 下载PHP

在云主机中，访问 [PHP 官网Windows版本下载页面](http://windows.php.net/download/)，下载 PHP zip 安装包。如下图所示：

<img src="../../image/Best-Practice/WIMP/10.PHP版本选择-1.jpg" alt="10.PHP版本选择-1" style="width:40%;" />

<img src="../../image/Best-Practice/WIMP/11.PHP版本选择-2.jpg" alt="11.PHP版本选择-2" style="width:40%;" />

注意：

- 如果您的服务器是 Windows Server 64bit (x64) 操作系统，则在IIS下运行 PHP 时，需选择Non Thread Safe版本的 x86 或x64安装包。**本文档中我们使用了Windows Server 2016 64位操作系统，因此选择下载VS16 x64 Non Thread Safe版本的PHP。**
- 如果您的服务器是 Windows Server 32bit (x86) 操作系统，则需要将 IIS 替换成 Apache，并选择 Thread Safe 版本的 x86 安装包。

关于Non Thread Safe与Thread Safe的选择依据如下。

```
PHP 有两种服务模式：ISAPI和FastCGI。

（1）ISAPI服务模式是以DLL动态库的形式被调用，可以在被用户请求后执行，在处理完一个用户请求后不会马上消失，所以需要进行线程安全检查，以防止耗尽系统资源。当PHP以ISAPI模式运行服务时，选择Thread Safe(简称ts)版本。
（2）FastCGI执行方式则是以单一线程来执行操作，所以不需要进行线程的安全检查，除去线程安全检查反而可以提高执行效率。当PHP以FastCGI模式运行服务时，选择 Non Thread Safe(简称nts) 版本。

通常，IIS以FastCGI模式运行服务，只能选择Non Thread Safe 版本，Apache以ISAPI模式运行服务，只能选择Thread Safe版本。说明：可以通过 phpinfo()函数页面里的Thread Safety项查询当前PHP版本是不是线程安全的。
```

关于x64和x86的选择依据如下。

```
x64是64位软件，只能安装于64位的操作系统上；
x86是32位软件，一般情况下，在64位、32位操作系统上都可以安装。
```

#### 下载Visual C++ Redistributable

根据下载的 PHP 安装包名称，下载并安装 Visual C++ Redistributable 安装包。

PHP 安装包对应需下载和安装的 Visual C++ Redistributable 安装包对照表如下所示，仅为建议搭配使用，并非严格的一一对应关系，有些最新版本安装包是可以向下兼容的。

| PHP 安装包名                     | Visual C++ Redistributable 安装包下载地址                    |
| :------------------------------- | :----------------------------------------------------------- |
| php-x.x.x-nts-Win32-VS16-x86.zip | [Microsoft Visual C++ Redistributable for Visual Studio 2019](https://visualstudio.microsoft.com/zh-hans/vs/older-downloads/) x86版本 |
| php-x.x.x-nts-Win32-VC15-x86.zip | [Microsoft Visual C++ Redistributable for Visual Studio 2017](https://visualstudio.microsoft.com/zh-hans/vs/older-downloads/) x86版本 |
| php-x.x.x-nts-Win32-VC14-x86.zip | [Microsoft Visual C++ Redistributable for Visual Studio 2015](https://www.microsoft.com/zh-cn/download/details.aspx?id=48145) x86版本 |

例如，本文档中PHP版本为VS16 x64 Non Thread Safe，我们访问微软官网下载 [Microsoft Visual C++ Redistributable for Visual Studio 2022](https://visualstudio.microsoft.com/zh-hans/downloads/) ，在“其他工具、框架和可再发行组件”中，选择x64版本下载。

<img src="../../image/Best-Practice/WIMP/12.Visual C++ Redistributable 2022安装包.jpg" alt="12.Visual C++ Redistributable 2022安装包" style="width:70%;" />

#### 安装Visual C++ Redistributable

下载的文件为exe可执行文件`VC_redist.x64.exe`，双击安装即可。

<img src="../../image/Best-Practice/WIMP/13.安装Visual C++ Redistributable 2022.jpg" alt="13.安装Visual C++ Redistributable 2022" style="width:40%;" />

<img src="../../image/Best-Practice/WIMP/14.安装Visual C++ Redistributable完成.jpg" alt="14.安装Visual C++ Redistributable完成" style="width:40%;" />

#### 安装配置PHP

（1）将已下载的 PHP zip 安装包解压缩。例如，解压缩至 `C:\PHP` 目录下。

（2）复制 `C:\PHP` 目录下的 `php.ini-production` 文件，并将该文件的后缀修改为 `.ini`（即重命名为`php.ini`文件）。如下图所示：

<img src="../../image/Best-Practice/WIMP/15.配置php.ini文件.jpg" alt="15.配置php.ini文件" style="width:70%;" />

（3）在操作系统界面，打开服务器管理器。在服务器管理器的左侧导航栏中，单击 **IIS**。

在右侧 IIS 管理窗口中，右键单击**服务器**栏中的服务器名称，选择 **Internet Information Sevices (IIS)管理器**。如下图所示：

<img src="../../image/Best-Practice/WIMP/16.IIS管理器.jpg" alt="16.IIS管理器" style="width:70%;" />

（4）在打开的 “Internet Information Sevices (IIS)管理器” 窗口中，单击左侧导航栏的服务器名称，进入服务器的主页。如下图所示：

<img src="../../image/Best-Practice/WIMP/17.IIS管理器主页.jpg" alt="17.IIS管理器主页" style="width:70%;" />

（5）双击**处理程序映射**，进入 “处理程序映射” 管理界面。如下图所示：

<img src="../../image/Best-Practice/WIMP/18.IIS管理器处理程序映射.jpg" alt="18.IIS管理器处理程序映射" style="width:70%;" />

（6）在右侧的**操作**栏中，单击**添加模块映射**，打开 “添加模块映射” 窗口。在打开的 “添加模块映射” 窗口中，填写以下信息，并单击**确定**。如下图所示：

<img src="../../image/Best-Practice/WIMP/19.添加模块映射.jpg" alt="19.添加模块映射" style="width:40%;" />

主要的参数信息如下：

- 请求路径：填写 `*.php`。
- 模块：选择 “FastCgiModule”。
- 可执行文件：选择 PHP zip 安装包中的 php-cgi.exe 文件，即 `C:\PHP\php-cgi.exe`。
- 名称：自定义，例如输入 PHP-Fastcgi。

在弹出的提示框中，单击**是**。

<img src="../../image/Best-Practice/WIMP/20.添加模块映射完成.jpg" alt="20.添加模块映射完成" style="width:50%;" />

（7）回到服务器主页，双击**默认文档**，进入 “默认文档” 管理界面。如下图所示：

<img src="../../image/Best-Practice/WIMP/21.默认文档.jpg" alt="21.默认文档" style="width:70%;" />

在右侧的**操作**栏中，单击**添加**，打开 “添加默认文档” 窗口。

在打开的 “添加默认文档” 窗口中，将**名称**填写为 `index.php`，单击**确定**。如下图所示：

<img src="../../image/Best-Practice/WIMP/22.默认文档index.jpg" alt="22.默认文档index" style="width:40%;" />

（8）回到服务器主页，双击 **FastCGI 设置**，进入 “FastCGI 设置” 管理界面。如下图所示：

<img src="../../image/Best-Practice/WIMP/23.Fastcgi设置.jpg" alt="23.Fastcgi设置" style="width:70%;" />

在 “FastCGI 设置” 管理界面，选择 FastCGI 应用程序，单击**编辑**。如下图所示：

<img src="../../image/Best-Practice/WIMP/24.Fastcgi编辑.jpg" alt="24.Fastcgi编辑" style="width:70%;" />

在打开的 “编辑 FastCGI 应用程序” 窗口中，将**监视对文件所做的更改**设置为 `php.ini` 文件的路径。如下图所示：

<img src="../../image/Best-Practice/WIMP/25.Fastcgi监视对文件所做出的更改.jpg" alt="25.Fastcgi监视对文件所做出的更改" style="width:50%;" />

（9）在 `C:\inetpub\wwwroot` 目录下，创建一个 PHP 文件。例如创建一个 `index.php` 文件。

在新创建的 `index.php` 文件中，填写以下内容并保存。

```php
<?php
phpinfo();
?>
```

（10）在操作系统界面，打开浏览器并访问 `http://localhost/index.php`，查看环境配置是否成功。如果打开的页面如下显示，则表示配置成功：

<img src="../../image/Best-Practice/WIMP/26.PHPIndex测试页访问.jpg" alt="26.PHPIndex测试页访问" style="width:70%;" />

## 步骤3：安装Mysql数据库

### 操作场景

本文档以京东云官方镜像 Windows Server 2016 （数据中心版 64位 中文版） 操作系统为例，介绍搭建 MySQL 8.0.28.0 的具体步骤。

### 操作步骤

#### 下载Mysql安装包

在云服务器中打开浏览器，访问Mysql官网下载 MySQL 安装包 [MySQL Community Server 8.0.28](https://dev.mysql.com/downloads/windows/installer/8.0.html) 。

#### 安装Mysql基础环境

1. 双击打开 MySQL 安装包，并在 “Choosing a Setup Type” 安装界面，选择 **Developer Default**，单击 **Next**。如下图所示：

<img src="../../image/Best-Practice/WIMP/29.Mysql安装-配置类型.jpg" alt="29.Mysql安装-配置类型" style="width:50%;" />

2. 在 “Check Requirements” 安装界面，单击 **Execute**，并根据界面提示配置 MySQL 的基础环境。单击 **Next**。

3. 在 “Installation” 安装界面，单击 **Execute**，安装 MySQL 所需的安装包。

   <img src="../../image/Best-Practice/WIMP/30.Mysql安装-执行安装.jpg" alt="30.Mysql安装-执行安装" style="width:50%;" />

4. 待 MySQL 所需的安装包完成安装后，单击 **Next**，进入 “Product Configuration” 配置界面。

#### 配置Mysql

##### 配置Mysql服务

1. 在 “Product Configuration” 配置界面，单击 **Next**。
2. 在 “Type and Networking” 配置界面，保持默认配置，单击 **Next**。

<img src="../../image/Best-Practice/WIMP/31.类型和网络-默认配置.jpg" alt="31.类型和网络-默认配置" style="width:70%;" />

3. 在 “Authentication Method” 配置界面，选择 **Use Legacy Authentication Method(Retain MySQL 5.x Compatibility)**，并单击 **Next**。此配置与加密算法相关，您可按需选择。如下图所示：

   <img src="../../image/Best-Practice/WIMP/32.认证方法-使用旧加密方式.jpg" alt="32.认证方法-使用旧加密方式" style="width:70%;" />

4. 设置 root 密码，单击 **Next**。如下图所示：

   <img src="../../image/Best-Practice/WIMP/33.账号和角色-设置root密码.jpg" alt="33.账号和角色-设置root密码" style="width:70%;" />

5. 在 “Windows Service” 配置界面，保持默认配置，单击 **Next**。如下图所示：

   <img src="../../image/Best-Practice/WIMP/34.Windows角色-默认配置.jpg" alt="34.Windows角色-默认配置" style="width:70%;" />

5. 在 “Apply Configuration” 配置界面，单击 **Execute**。

   <img src="../../image/Best-Practice/WIMP/35.执行配置.jpg" alt="35.执行配置" style="width:70%;" />

6. 单击 **Finish**，完成 MySQL 服务配置。

<img src="../../image/Best-Practice/WIMP/36.Mysql安装完成-finish.jpg" alt="36.Mysql安装完成-finish" style="width:70%;" />



##### 配置Mysql路由器

1. 在 “Product Configuration” 配置界面，单击 **Next**。

2. 在 “MySQL Router Configuration” 界面，保持默认配置，单击 **Finish**。如下图所示：

   <img src="../../image/Best-Practice/WIMP/37.配置Mysql路由器.jpg" alt="37.配置Mysql路由器" style="width: 70%;" />

##### 配置Mysql示例

1. 在 “Product Configuration” 配置界面，单击 **Next**。
2. 在 “Connect To Server” 配置界面，输入 root 的密码，单击 **Check**。
3. 待 root 的密码验证成功后，单击 **Next**。如下图所示：

<img src="../../image/Best-Practice/WIMP/38.配置Mysql实例.jpg" alt="38.配置Mysql实例" style="width:70%;" />

4. 在 “Apply Configuration” 配置界面，单击 **Execute**。
5. 单击 **Finish**，完成 MySQL 示例配置。
6. 在 “Product Configuration” 配置界面，单击 **Next**。
7. 在 “Installation Complete” 界面，根据实际需求，勾选需启动的 MySQL 环境，单击 **Finish**

- 若成功打开如下图所示的 MySQL 工作台，即表示 MySQL 安装成功。

<img src="../../image/Best-Practice/WIMP/39.Mysql Workbench.jpg" alt="39.Mysql Workbench" style="width: 70%;" />

- 若成功打开如下图所示的 MySQL Shell，即表示 MySQL 安装成功。

  <img src="../../image/Best-Practice/WIMP/40.Mysql shell.jpg" alt="40.Mysql shell" style="width:70%;" />

#### 连接Mysql

##### 工作台本地连接Mysql服务

1. 使用工作台实现本地连接Mysql，双击本地实例后，输入root密码。

<img src="../../image/Best-Practice/WIMP/41.使用workbench登录mysql.jpg" alt="41.使用workbench登录mysql" style="width: 40%;" />

2. 使用Query测试SQL语句

<img src="../../image/Best-Practice/WIMP/42.workbench执行查询命令.jpg" alt="42.workbench执行查询命令" style="width:40%;" />

##### 命令行本地连接Mysql服务

1. 在开始菜单找到Mysql Command Line Client

<img src="../../image/Best-Practice/WIMP/43.开始菜单-Mysql Command line.jpg" alt="43.开始菜单-Mysql Command line" style="width:40%;" />

2. 输入root密码后即可实现本地访问Mysql服务

<img src="../../image/Best-Practice/WIMP/44.Mysql command line 执行命令.jpg" alt="44.Mysql command line 执行命令" style="width:70%;" />

##### 命令行远程连接Mysql服务

1. 首先在工作台增加root用户，使Limit to Hosts Matching支持远程服务器。

![45.Mysql新增远程连接用户](img src="../../image/Best-Practice/WIMP/45.Mysql新增远程连接用户.jpg" alt="45.Mysql新增远程连接用户" style="width:90%;")

2. 远程连接测试，Mysql服务所在Windows服务器内网地址为10.0.0.13，测试效果如下。

<img src="../../image/Best-Practice/WIMP/46.远程连接Mysql服务.jpg" alt="46.远程连接Mysql服务" style="width:70%;" />

至此，WIPM环境搭建完成。
