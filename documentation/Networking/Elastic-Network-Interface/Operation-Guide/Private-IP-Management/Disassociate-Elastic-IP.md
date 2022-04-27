# 解绑公网 IP

京东云弹性网卡（本文指辅助网卡）支持解绑已关联的弹性公网 IP（Elastic IP Address，简称 EIP）。解绑辅助网卡的 EIP 可从弹性网卡或[弹性公网 IP](https://docs.jdcloud.com/cn/elastic-ip/disassociate-elastic-ip)侧操作，解绑主网卡的 EIP 需从[主机侧解绑](https://docs.jdcloud.com/cn/virtual-machines/disassociate-elastic-ip)。本文将介绍如何在弹性网卡产品侧解绑辅助网卡的公网IP。

#### 前提条件及限制
- 确保您已经[注册京东云账号](https://user.jdcloud.com/register?returnUrl=https%3A%2F%2Fwww.jdcloud.com%2F)，并实现[实名认证](https://docs.jdcloud.com/cn/real-name-verification/introduction)；
- 确保您已有一个弹性网卡资源，且网卡已绑定 EIP。

#### 操作步骤
步骤1：登录京东云控制台，进入控制台导航页面。

步骤2：在控制台左侧导航栏，选择网络 -> 私有网络 -> 弹性网卡，进入弹性网卡列表页。

步骤3：定位到需要解绑弹性公网 IP 的弹性网卡，点击该弹性网卡 ID 进入弹性网卡详情页。

步骤4：选择内网IP管理标签，进入内网 IP管理页面。

> 在弹性网卡列表页，点击弹性网卡内网 IP 数量数字也可以进入内网 IP 管理页面

步骤5：定位到需要解绑公网IP的内网 IP，若内网IP已绑定弹性公网 IP，则显示解绑公网 IP 按键。

步骤6：点击解绑公网IP按键，进入解绑公网IP弹窗。

> 如弹性网卡已挂载到云主机上，EIP 绑定网卡的模式为 EIP 网卡可见模式，解绑后辅助网卡内网会断流，需重启网卡快速恢复内网通信或等待12小时后内网自动恢复通信。

步骤7：点击确定按键，完成解绑弹性公网IP操作。返回内网IP管理页面，查看弹性公网IP解绑情况。

