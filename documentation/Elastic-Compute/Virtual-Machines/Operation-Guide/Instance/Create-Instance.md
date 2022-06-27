# 创建实例

创建实例时，需指定实例规格、镜像、私有网络、安全组及登录密码等信息。京东云为用户提供了多种创建实例的方法，包括：

* [自定义创建](Create-Instance#user-content-1)
* [在高可用组内创建](Create-Instance#user-content-2)
* [指定宿主机创建](Create-Instance#user-content-3)

<div id="user-content-1"></div>

## 前提条件及限制

* 第一代云主机不支持加密挂载加密云硬盘；
* 第一代云主机（GPU类型除外）不支持高可用组；
* 第一代存储优化大数据型s.d1及第二代存储优化大数据型s.d2不支持本地系统盘；
* 对于Windows Server系统实例，目前最高支持的vCPU为64核；
* NAT Instance当前仅支持Centos 7.2 系统。

## 自定义创建
自定义创建是指您需要根据业务场景自行选配地域、可用区、实例规格、镜像、私有网络、安全组及登录密码等信息。根据操作系统平台类型不同，详细创建步骤可参见  [创建Linux实例](http://docs.jdcloud.com/cn/virtual-machines/create-linux-instance) 及 [创建Windows实例](http://docs.jdcloud.com/cn/virtual-machines/create-windows-instance)。

## 在高可用组内创建
高可用组（Availability Group，AG）是京东云提供的云主机实例逻辑集合，高可用组内的实例分散部署在互相隔离的物理资源上，当出现硬件故障时只会影响到部分实例，您整体业务仍为可用状态，故障域间故障隔离，最大程度规避了局部故障对高可用应用整体的影响。高可用组详细内容请参见 [高可用组概述](http://docs.jdcloud.com/cn/availability-group/product-overview)。
当您选择在高可用组内部署云主机实例时，京东云将保证您的实例分散在多可用区的不同的物理故障域上（高可用组可跨可用区），故障域之间相互隔离，高可用组可保障当一个故障域内发生硬件故障时仅影响部署在该故障域上的实例，其他故障域上实例仍为可用，您业务仍可正常运行。
详细操作步骤如下，有两个操作入口：

* 云主机列表页/详情页

	1. 访问[云主机控制台](https://cns-console.jdcloud.com/host/compute/list)，点击**创建**，进入实例创建页面。
	2. 创建页面内创建方法选中在高可用组内创建，选择计费模式、地域，并选中对应高可用组，实例规格、镜像、私有网络、安全组信息、登录密码等将默认选中实例模板中已包含的配置，您可以在此基础上更改。此外您需要指定实例名称、hostname、描述、标签、资源组等信息。
	3. 点击**立即购买**则触发购买，若您选择创建包年包月计费实例，则需要进行费用支付。

* 实例模板列表页/详情页

	1. 访问[高可用组控制台](https://cns-console.jdcloud.com/host/availabilitygroup/list)，选择高可用组，点击【操作】-【新增实例】，进入创建实例页面。
	2. 创建页面内创建方法选中在高可用组内创建，选择计费模式、地域，并选中对应高可用组，实例规格、镜像、私有网络、安全组信息、登录密码等将默认选中实例模板中已包含的配置，您可以在此基础上更改。此外您需要指定实例名称、hostname、描述、标签、资源组等信息。
	3. 点击**立即购买**则触发购买，若您选择创建包年包月计费实例，则需要进行费用支付。
		
	> 请注意：<br>* 若高可用组所关联实例模板中包含的配置资源已被删除，则无法在该高可用组内创建实例，即实例模板不可用，此时您可以选择更换高可用组实例模板。<br>* 选择在高可用组内新建实例无需您指定可用区，系统将根据实例在可用区分布情况，在尽量保证均匀分布情况下，选择高可用组所配置的可用区内选择可用区来创建实例。

## 指定宿主机创建
专有宿主机（Dedicated Host，简称DH）是京东云提供的用户独享的宿主机资源，用以满足安全合规、性能稳定及部署管理等要求。专有资源池（Dedicated Pool，简称DP）是跨机架的专有宿主机资源池，基于资源独享及故障隔离实现业务安全及高可用部署。
专有宿主机支持包年包月及按配置两种计费方式，在专有宿主机上创建的云主机不收取实例费用，仅收取相关资源如弹性公网IP、云硬盘等的费用。专有资源池服务免费。
指定专有宿主机创建云主机需要您提前创建专有宿主机或专有资源池。详细创建步骤可参见[在专有资源池或专有宿主机上新建云主机](https://docs.jdcloud.com/cn/dedicated-host/add-instance-in-dh-or-dp)

## 相关参考

[创建Linux实例](https://docs.jdcloud.com/cn/virtual-machines/create-linux-instance)

[创建Windows实例](http://docs.jdcloud.com/cn/virtual-machines/create-windows-instance)

[实例模板概述](http://docs.jdcloud.com/cn/virtual-machines/instance-template-overview)

[高可用组概述](http://docs.jdcloud.com/cn/availability-group/product-overview)

[专有宿主机概述](https://docs.jdcloud.com/cn/dedicated-host/product-overview)
