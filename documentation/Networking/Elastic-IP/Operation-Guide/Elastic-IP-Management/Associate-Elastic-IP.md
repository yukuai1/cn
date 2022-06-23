# 绑定弹性公网 IP

京东云支持将独立创建的弹性公网 IP（Elastic IP Address，简称 EIP）与云资源进行绑定，如云主机、负载均衡、容器、弹性网卡等，本文将介绍云资源如何与 EIP 进行绑定关联。

- [EIP 绑定云主机、容器、Pod或负载均衡](Associate-Elastic-IP#user-content-1)
- [EIP 绑定弹性网卡](Associate-Elastic-IP#user-content-2)

### 操作场景

云主机、负载均衡或容器等云资源需访问公网或支持被公网访问。


<div id="user-content-1"> </div>

### EIP 绑定云主机、容器、Pod或负载均衡

#### 前提条件及限制

- 确保您已经[注册京东云账号](https://user.jdcloud.com/register?returnUrl=https%3A%2F%2Fwww.jdcloud.com%2F)，并实现[实名认证](https://docs.jdcloud.com/cn/real-name-verification/introduction)；
- 确保您已经创建一个 EIP，且未绑定云资源；
- 确保您已经创建一个云资源（云主机、负载均衡等），且未绑定 EIP；
- 一个 EIP 同时只能绑定一个云资源。

#### 操作步骤

步骤1：登录京东云控制台，进入控制台导航页面。

步骤2：在控制台左侧导航栏，选择网络-【私有网络】-【弹性公网IP】，进入 EIP 列表页。

步骤3：在 EIP 列表页，选择处于未绑定状态下待绑定的 EIP。

步骤4：点击【绑定资源】按钮，进入弹性公网IP绑定资源弹窗。


> 1. 标准公网IP支持绑定云主机、负载均衡、容器、弹性网卡等资源；
> 2. 边缘公网IP目前仅支持绑定所在可用区的云主机；
> 3. 弹性公网IP详情页右上角快捷操作菜单同时提供绑定资源按键，功能与列表页按键保持一致。
	
步骤5：在绑定资源弹窗，选择弹性公网IP需要绑定的资源类型，包括云主机、负载均衡、弹性网卡、容器、pod。

步骤6：选中需要绑定公网IP的资源，点击【确定】按键，完成绑定弹性公网IP操作。

步骤7：返回弹性公网IP列表页，查看弹性公网IP绑定情况。


<div id="user-content-2"> </div>

### EIP 绑定弹性网卡

弹性公网IP（Elastic IP Address，简称EIP）与弹性网卡绑定支持标模式和 EIP 网卡可见模式两种绑定模式:
> EIP 网卡可见模式仅支持中心地域的全可用区，该功能仅在华南-广州地域支持，如需使用请[提交工单](https://ticket.jdcloud.com/applyorder/form?cateId=1135&questionId=1155)申请。

|绑定模式|功能|限制|
|:-----|----|------|
| 标准模式 | 普通的绑定模式，EIP 绑定网卡后，网卡挂到云主机上，在操作系统中仅可见网卡的私网 IP，公网 IP为绑定的弹性网卡提供公网访问或被公网访问的能力。| 如查看标准模式下弹性网卡绑定的EIP，请通过控制台查看弹性网卡的详情页->内网IP或通过[查询网卡详情](https://docs.jdcloud.com/cn/virtual-private-cloud/api/describenetworkinterface)openAPI查看|
|EIP 网卡可见模式|EIP 绑定网卡后，网卡挂到云主机上，在操作系统内部的弹性网卡上可见|- 该模式仅支持 EIP 与弹性网卡的主 IP 绑定</br> - 仅支持中心地域全可用区，边缘可用区资源不支持</br> - 若网卡已与云主机绑定后，EIP 再以该模式绑定网卡，绑定后该网卡的内网公网流量均不通，需重启网卡立即生效或等待12小时自动生效</br> - 可见模式下，EIP 与网卡解绑后，该网卡的内网公网流量均不通，需重启网卡立即生效或等待12小时自动生效|


#### 操作步骤
步骤1：登录京东云控制台，进入控制台导航页面。

步骤2：在控制台左侧导航栏，选择网络-【私有网络】-【弹性公网IP】，进入弹性公网IP列表页。

步骤3：在弹性公网IP列表页，选择处于未绑定状态下待绑定的 EIP，点击【绑定资源】按钮，进入 EIP 绑定资源弹窗。

步骤4：在绑定资源弹窗，选择弹性公网IP需要绑定的资源类型：弹性网卡。
	
步骤5：选择绑定模式：标准模式和EIP网卡可见模式。

步骤6：选中需要绑定公网IP的资源，点击【确定】按键，完成绑定弹性公网IP操作。

步骤7：返回弹性公网IP列表页，查看弹性公网IP绑定情况。


## 相关参考

- [使用限制](../../Introduction/Restrictions.md)
- [常见问题](https://docs.jdcloud.com/cn/elastic-ip/faq)
- [解绑公网IP](https://docs.jdcloud.com/cn/elastic-ip/associate-elastic-ip)
- [创建云主机](https://docs.jdcloud.com/cn/virtual-machines/create-instance)
