# 京东云DDoS防护包相关接口


## 简介
京东云DDoS防护包相关接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**addProtectedIp**|POST|添加防护包防护 IP. <br>- 防护包仅能防护防护包实例所在区域的公网 IP, 且该公网 IP 未被其他防护包防护, 如果已经被其他防护包防护, 请先调用删除防护包防护 IP 接口删除防护 IP<br>- 防护包可添加的防护 IP 个数小于等于防护包的可防护 IP 数量减去已防护的 IP 数量<br>- 使用 <a href='http://docs.jdcloud.com/anti-ddos-protection-package/api/describeelasticipresources'>describeElasticIpResources</a> 接口查询防护包可防护的弹性公网 IP<br>- 使用 <a href='http://docs.jdcloud.com/anti-ddos-protection-package/api/describecpsipresources'>describeCpsIpResources</a> 接口查询防护包可防护的云物理服务器公网 IP<br>- 使用 <a href='http://docs.jdcloud.com/anti-ddos-protection-package/api/describewafipresources'>describeWafIpResources</a> 接口查询防护包可防护的Web应用防火墙公网 IP<br>- 使用 <a href='http://docs.jdcloud.com/anti-ddos-protection-package/api/describeccsipresources'>describeCcsIpResources</a> 接口查询防护包可防护的托管区公网 IP|
|**checkInstanceName**|GET|检测实例名称是否可用, 防护包实例名称不可重复|
|**createAcl**|POST|创建访问控制规则|
|**createInstance**|POST|创建防护包实例|
|**createIpSet**|POST|创建实例的 IP 库|
|**createPortSet**|POST|创建实例的端口库|
|**deleteAcl**|DELETE|删除实例的访问控制规则. 支持批量操作, 批量操作时 aclId个, 以 ',' 分隔|
|**deleteIpSet**|DELETE|删除实例的 IP 库. 支持批量操作, 批量操作时 ipSetId 传多个, 以 ',' 分隔. IP 黑白名单规则被引用时不允许删除|
|**deletePortSet**|DELETE|删除实例的端口库. 支持批量操作, 批量操作时 ipSetId 传多个, 以 ',' 分隔. IP 黑白名单规则被引用时不允许删除|
|**deleteProtectedIp**|POST|删除防护包防护 IP|
|**describeAcls**|GET|查询防护包实例的访问控制列表|
|**describeAttackLogs**|GET|查询攻击记录, 参数 ip 优先级大于 instanceId. <br>- 指定 ip 参数时, 忽略 instanceId 参数, 查询 ip 相关攻击记录. <br>- 未指定 ip 时, 查询 instanceId 指定实例相关攻击记录. <br>- ip 和 instanceId 均未指定时, 查询用户所有公网 IP 攻击记录|
|**describeAttackSource**|GET|查询攻击来源|
|**describeAttackStatistics**|GET|攻击记录统计, 参数 ip 优先级大于 instanceId. <br>- 指定 ip 参数时, 忽略 instanceId 参数, 统计 ip 的攻击情况. <br>- 未指定 ip 时, 统计 instanceId 指定实例相关攻击情况. <br>- ip 和 instanceId 均未指定时, 查询用户所有公网 IP 攻击情况|
|**describeAttackTypeCount**|GET|查询各类型攻击次数, 参数 ip 优先级大于 instanceId. <br>- 指定 ip 参数时, 忽略 instanceId 参数, 查询 ip 相关攻击记录的各类型攻击次数<br>- 未指定 ip 时, 查询 instanceId 指定实例相关攻击记录的各类型攻击次数<br>- ip 和 instanceId 均未指定时, 查询用户所有公网 IP 攻击记录的各类型攻击次数|
|**describeCcsIpResources**|GET|查询 DDoS 防护包可防护的托管区公网 IP|
|**describeCpsIpResources**|GET|查询 DDoS 防护包可防护的云物理服务器公网 IP(包括云物理服务器弹性公网 IP 及云物理服务器基础网络实例的公网 IP)|
|**describeElasticIpResources**|GET|查询 DDoS 防护包可防护的私有网络弹性公网 IP(不包括运营商级 NAT 保留地址和 IPv6)|
|**describeGeoAreas**|GET|查询防护规则 Geo 拦截可设置区域|
|**describeInstance**|GET|查询防护包实例|
|**describeInstanceAclCnt**|POST|查询已添加的访问控制规则数量|
|**describeInstanceAclEnable**|GET|查询实例的访问控制规则总开关状态|
|**describeInstances**|GET|查询防护包实例列表|
|**describeIpMonitorFlow**|GET|查询公网 IP 的监控流量|
|**describeIpSet**|GET|查询实例的 IP 库|
|**describeIpSets**|GET|查询实例的 IP 库列表|
|**describeOperationRecords**|GET|查询操作日志|
|**describePortSet**|GET|查询实例的端口库|
|**describePortSets**|GET|查询实例的端口库列表|
|**describeProtectedIpList**|GET|查询已防护 IP 列表|
|**describeProtectionOutline**|GET|防护包防护信息概要|
|**describeProtectionRule**|GET|获取防护包实例或 IP 的防护规则|
|**describeWafIpResources**|GET|查询 DDoS 防护包可防护的Web应用防护墙 IP|
|**disableAcl**|POST|关闭实例的访问控制规则. 支持批量操作, 批量操作时 aclId 传多个, 以 ',' 分隔|
|**disableInstanceAcl**|POST|关闭实例的访问控制规则总开关|
|**enableAcl**|POST|打开实例的访问控制规则. 支持批量操作, 批量操作时 aclId 传多个, 以 ',' 分隔|
|**enableInstanceAcl**|POST|打开实例的访问控制规则总开关|
|**modifyAcl**|PATCH|修改访问控制规则|
|**modifyAclPriority**|PATCH|修改访问控制规则优先级|
|**modifyInstance**|PATCH|升级防护包实例|
|**modifyInstanceName**|PATCH|修改防护包实例名称|
|**modifyIpSet**|PATCH|修改实例的 IP 库|
|**modifyPortSet**|PATCH|修改实例的端口库|
|**modifyProtectionRule**|POST|修改防护包实例或 IP 的防护规则|
