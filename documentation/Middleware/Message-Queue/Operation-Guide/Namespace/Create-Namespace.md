# 创建Namespace
  在Namespace管理页面可以进行Namespace的创建

## 前提条件
- 已注册京东云账号，并完成实名认证，且保证账户处于正常状态，没有在黑名单中。如果还没有账号请 [注册](https://accounts.jdcloud.com/p/regPage?source=jdcloud%26ReturnUrl=%2f%2fuc.jdcloud.com%2fpassport%2fcomplete%3freturnUrl%3dhttp%3A%2F%2Fuc.jdcloud.com%2Fredirect%2FloginRouter%3FreturnUrl%3Dhttps%253A%252F%252Fwww.jdcloud.com%252Fhelp%252Fdetail%252F734%252FisCatalog%252F1)，并 [实名认证](https://uc.jdcloud.com/account/certify)。
- 因为产品的计费类型为按用量计费，请确认您的账户不能处于欠费状态。

## 注意事项
- 用户默认在一个region最多只能创建10个Namespace，如有需要可以提工单增加。
- 在region：公网（华北）中消息队列 JCQ服务仅可用于测试（公网可直接访问），在生产环境请勿使用，不承诺产品的服务等级协议。
- Namespace创建后，其地域和网络属性与物理资源紧密结合，无法变更。如需变更实例的地域或网络属性，请释放实例，并重新购买。



## 操作步骤
### 1.Namespace管理页面点击“新建”按钮

从控制台左侧菜单中，找到互联网中间件-消息队列 JCQ-Namespace管理页面，点击新建
 ![创建 Namespace 步骤1](/documentation/Middleware/Message-Queue/image/namespace创建-01.jpg)

### 2.填写完Namespace信息，点击“创建”按钮

页面刷新，完成新Namespace的创建
 ![创建Namespace步骤2](/documentation/Middleware/Message-Queue/image/namespace创建-02.jpg)  

1. namespace名称不允许重复。namespace名称长度 3-32 个字符，支持字母、数字、连字符(-)、下划线(_)。


