## 应用管理

点击应用列表，即可查看我负责的，我参与的以及全部的应用列表

![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin5.png)

### 创建应用

在应用列表，点击右上角的新增应用，进入创建应用界面，并以应用基本信息，关联代码库，导入资源，域名和标签的引导方式进行处理
1，在新建页面—基本信息界面，填写应用基本信息

![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin6.png)

2，点击保存&下一步，将会存储应用基本信息，并进入下一步，若直接点击保存按钮，则直接创建应用并关闭新建页面进入应用详情页面
关联代码库

![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin7.png)

3，点击保存&下一步，进入导入资源界面，可以关联相应的集群信息；填写集群名称和集群授权码，即可将集群关联到该应用下。
关于集群授权码的获取，可联系集群负责人获取授权码

![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin8.png)

如需要添加集群，可以进入集群管理见面进行添加集群
3，点击下一步，添加标签和域名。

![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin9.png)

4,点击完成，跳转到应用列表

### 应用详情

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin10.png)

### 应用成员

在应用管理-应用成员菜单中，应用负责人可管理该应用的成员，包含成员的增删改查；其他角色的成员只可查看成员列表，无操作权限

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin11.png)

新增成员：输入成员名称，选择角色即可添加
 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin12.png)

### 分组管理

#### 创建分组

1，	新建应用后，可点击继续创建分组，进入创建分组界面，填写相应的配置信息，比如：

基本信息:分组名称，环境和关联的集群等信息

* 容器设置：填写该分组的镜像信息（镜像信息在发起部署时，可变更）；容器数量和规格参数，填写启动命令和参数

* 部署策略：用户可选择滚动部署，多批次部署两种部署方式

* 健康检查：用户可以使用健康检查，支持httpGet，Container Command，和TCP Socket三种方式

* 生命周期：启动前，启动后的httpget和command方式

* Gpu的配置：选择gpu类型和gpu个数

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin13.png)

2，	点击保存&下一步，即可配置负载均衡，如不需要，可点击跳过即可

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin14.png)

3，	在分组配置界面，可添加该分组的配置文件以及环境变量

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin15.png)

4，	点击完成，将会进入到分组列表界面

#### 分组列表

创建分组后，会默认跳转到分组列表界面，在分组列表界面，可进行如下操作：

* 新增分组：点击新增分组即可创建分组。

* 分组详情：点击分组名称即可进入分组配置界面，可以查看分组的基本配置和配置文件。

* 部署：点击部署，即可进入创建部署任务界面，将会在新建部署任务时进行详细说明。

* 运行信息：点击运行信息即可进入运行状态，查看该分组下pod的运行状态。

* Yaml文件：点击查看该分组yaml文件

* 编辑分支：编辑分组的基本信息

* 删除分组：将会删除该分组，建议将该分组下的服务停止后再进行删除

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin16.png)

### 制品列表

流水线关联应用后，将所构建出的制品，在制品列表中展示。

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin20.png)

### 发布历史

#### 新建发布任务

在发布历史页面，点击发布，即可创建部署任务。

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin21.png)

可查看本次部署任务要部署的信息，并进行确认，执行部署。点击部署后，即可进入部署详情页面。

#### 部署详情

点击发布历史菜单，默认查看最新发布的任务，也可查看全部的发布历史。

最新发布任务，默认展示每个分组的最后一次部署任务，如下图：

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin22.png)

点击查看即可查看本次任务的详细信息。在部署任务详情页面，可查看到本次部署任务的部署过程可观测的流程情况，主要实现的是cpu和内存的发布前后的版本流量监控信息，以及容器部署的状态。

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin23.png)

点击部署配置，可查看本次部署的部署配置

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin24.png)

点击pod中查看事件，即可查看该pod的事件和状态。

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin25.png)


### 运行状态

在运行状态界面，可查看到当前分组的运行信息，可切换其他分组，进行查看其他分组的运行状态；

在运行状态界面，可以重启该分组下所有pod的服务，以及调整该分组的副本信息。

#### 容器状态

进入到分组的运行状态，默认展示容器状态，在容器状态界面，可以查看该分组下所有pod的状态。展示出pod的名称，pod ip，宿主机IP，状态，以及该pod的监控信息（cpu和内存）。

点击pod右侧的操作图标，可以查看该pod状态和事件，yaml文件，实例监控以及驱逐该pod。

POD状态和事件

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin26.png)Yaml文件

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin27.png)

驱逐pod，将会把有问题的pod驱逐，并重新拉起新的pod。

打开pod后，更能清晰的看到pod下容器的信息，比如容器的名称，状态，重启次数以及端口信息.

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin28.png)

查看日志：点击容器右侧是日志操作，即可查看容器的日志信息。

在查看日志界面，可对日志进行日志的实时更新或手动更新，也可以下载日志。

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin29.png)

登录终端：点击容器右侧是终端操作，即可登录到容器内，进行相关操作

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin30.png)

#### 部署信息

部署信息页签，即可查看该次部署任务的部署信息，如下图：

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin31.png)

#### 部署历史

在部署历史页签，可以查看到该分组下部署的历史记录，点击详情可以查看到该部署任务的部署信息。

点后回滚到该版本，该分组下pod上的服务将回滚到该版本

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin32.png)

#### 监控信息

默认展示该分组下的监控信息

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin50.png)



### 配置管理

#### 应用配置

点击应用管理-配置文件，即可配置应用维度的配置文件。应用维度的配置文件，各分组默认使用应用配置文件。

在应用配置文件中，可以进行以下两种配置文件：

* 常规配置文件：按照正常的配置文件输入即可。

* 配置模板：若用户在配置文件中设置了占位符{{ }}，则系统将任务该配置文件为模板文件，在分组配置中需要对占位符进行赋值。比如：name={{key}},则在分组下需要将{{key}}占位符key赋值后，方可使用。

**配置文件列表**

应用下的配置文件，可进行查看该配置的详细信息，更新历史。编辑，删除该配置。

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin33.png)

**查看详情**

在查看详情页面，可点击编辑即可进入编辑页面，在编辑页面，只可编辑配置文件的内容。

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin34.png)

**新增配置文件**

点击+新增配置按钮，即可进入新增配置文件页面，填写配置文件名称，以及内容，点击保存，即可将配置文件保存在应用配置文件列表。
新增配置时，可以设置相对路径或绝对路径；

* 绝对路径：默认是“/”开头，设置的路径不会随高级配置中设置的部署路径变化。比如，/export/app/poc-test.properties

* 相对路径：在应用高级配置中的部署路径的基础上，再进行设置配置的路径。比如，高级配置中设置的部署路径为/sys/，则设置的配置文件为/sys/export/app/poc-test.properties

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin35.png)

#### 应用高级配置

在应用高级配置中，可以配置代码库，部署路径，域名，以及日志路径。

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin36.png)

**部署路径**

点击部署路径即可进入编辑状态;设置完部署路径后，应用配置文件或者分组配置文件中使用相对路径的配置随之变更路径。
路径必须以斜杠"/"开头、分割、结尾，中间不能出现连续的斜杠"/"

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin37.png)

#### 分组配置

在分组配置界面，可查看分组的基本配置，点击编辑即可更新分组的配置。

1、编辑分组基本配置

在基本配置界面，点击编辑即可变更分组的基本配置，需要说明的一点：

不可编辑的内容包含：分组环境和部署集群（在创建分组时已经设置，不可更改），容器副本（需要在运行状态，进行调整副本）

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin38.png)

2、分组配置文件的管理

在分组配置文件中，默认继承应用配置文件，同时可以添加分组配置文件。

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin39.png)

3、分组配置发生变化时，将会提示重新部署，并可查看对比变更

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin40.png)

4、点击部署即可创建部署任务，进行部署该分组。

### 负载均衡

支持负载均衡的增删改查功能，主要包含三种负载均衡：LB，NodePort ，ClusterIP；

**负载均衡列表**

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin41.png)

**新增负载**

新增负载时，需要填写负载名称，类型，以及端口信息，并关联分组。

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin42.png)

### 应用关联的集群信息

当前应用下，点击资源管理-k8s集群，可查看该应用关联的集群信息

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin43.png)

点击关联集群，填写集群名称，和授权码，即可将集群关联到该应用下。

 ![deploy](http://devops-minio.jdcloud.com/doc-image/All-Image/app.assets/jindowin44.png)

