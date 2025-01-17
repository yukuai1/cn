# 解绑密钥

对于通过京东云平台绑定的SSH密钥，如不再使用或需要更换密钥，可参照本文操作解绑密钥。


## 前提条件及限制
* 实例已通过京东云绑定密钥，且实例须处于 **运行中** 或 **已停止** 状态。

>请注意：
>* 解绑密钥后，须启动（停止状态绑定）或重启（运行状态绑定）实例才可生效；
>* 如在绑定密钥时禁用了SSH密码登录，解绑密钥不会更改该配置，如期望启用SSH密码登录，可通过[重置密码](https://docs.jdcloud.com/virtual-machines/reset-password)功能设置密码后自动启用。

## 操作步骤
1、访问[云主机控制台](https://cns-console.jdcloud.com/host/compute/list)，即进入实例列表页面。或访问[京东云控制台](https://console.jdcloud.com)点击左侧顶部导航 **弹性计算-云主机** 进入实例列表页。<br>
2、选择地域后在实例列表中选择需要解绑SSH密钥的实例，点击 **操作-更多-解绑密钥** 按钮。<br>
3、在弹窗中进行确认，点击 **确定** 后完成解绑。

## 相关参考

[重置密码](https://docs.jdcloud.com/virtual-machines/reset-password)
