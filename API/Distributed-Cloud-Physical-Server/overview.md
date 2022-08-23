# 分布式云物理服务器


## 简介
分布式云物理服务器相关接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**addBandwidthPackageIp**|PUT|添加共享带宽IP<br>|
|**addServers**|PUT|添加后端服务器|
|**applyBandwidthPackages**|PUT|申请共享带宽<br>|
|**applyElasticIps**|PUT|申请弹性公网IP<br>|
|**assignIpv6Address**|POST|申请IPv6地址|
|**assignIpv6Cidr**|POST|申请IPv6网段<br>|
|**assignVpcIpv6Address**|POST|申请开通IPv6网关<br>|
|**associateElasticIp**|PUT|绑定弹性公网IP<br>|
|**associateLoadBalancerEip**|PUT|绑定弹性公网IP|
|**checkLoadBalancesTagResources**|POST|校验资源是否可以打标|
|**checkSubnet**|GET|前端检查子网的cidr/ipv6 cidr等相关信息正确性|
|**checkTagResources**|POST|校验资源是否可以打标|
|**createAliasIp**|PUT|添加别名IP|
|**createInstances**|PUT|创建一台或多台指定配置的分布式云物理服务器<br/><br>- 地域与可用区<br/><br>  \- 调用接口（queryEdCPSRegions）获取分布式云物理服务器支持的地域与可用区<br/><br>- 实例类型<br/><br>  \- 调用接口（describeDeviceTypes）获取物理实例类型列表<br/><br>  \- 不能使用已下线、或已售馨的实例类型<br/><br>- 操作系统<br/><br>  \- 可调用接口（describeOS）获取分布式云物理服务器支持的操作系统列表<br/><br>- 存储<br/><br>  \- 数据盘多种RAID可选，可调用接口（describeDeviceRaids）获取服务器支持的RAID列表<br/><br>- 网络<br/><br>  \- 网络类型目前支持vpc<br/><br>  \- 线路目前支持联通un、电信ct、移动cm<br/><br>  \- 支持不启用外网，如果启用外网，带宽范围[1,200] 单位Mbps<br/><br>- 其他<br/><br>  \- 购买时长，可按年或月购买：月取值范围[1,9], 年取值范围[1,3]<br/><br>  \- 密码设置参考公共参数规范<br/><br>|
|**createKeypairs**|PUT|创建密钥对|
|**createListener**|PUT|创建监听器|
|**createLoadBalancer**|PUT|创建负载均衡实例|
|**createSecondaryCidr**|PUT|添加次要CIDR|
|**createServerGroup**|PUT|创建虚拟服务器组|
|**createSubnet**|PUT|创建子网|
|**createVpc**|PUT|创建私有网络|
|**deleteAliasIp**|DELETE|删除别名IP|
|**deleteBandwidthPackage**|DELETE|删除共享带宽<br>|
|**deleteInstance**|DELETE|删除单台云物理物理服务器，只能删除运行running、停止stopped、错误error状态的服务器<br/><br>不能删除没有计费信息的服务器<br/><br>|
|**deleteKeypairs**|DELETE|删除密钥对|
|**deleteListener**|DELETE|删除监听器|
|**deleteLoadBalancer**|DELETE|删除负载均衡实例|
|**deleteSecondaryCidr**|DELETE|删除次要CIDR|
|**deleteServerGroup**|DELETE|删除虚拟服务器组|
|**deleteSubnet**|DELETE|删除子网|
|**deleteVpc**|DELETE|删除私有网络<br>|
|**deleteelasticIp**|DELETE|删除弹性公网IP<br>|
|**describeAliasIps**|GET|查询别名IP列表|
|**describeAvailablePrivateIp**|GET|查询可用的私有IP列表|
|**describeBandwidthPackage**|GET|查询共享带宽详情|
|**describeBandwidthPackageStock**|GET|查询共享带宽库存|
|**describeBandwidthPackages**|GET|查询弹性公网IP列表<br/><br>支持分页查询，默认每页20条<br/><br>|
|**describeBmClazzList**|GET|查询BmClazz List|
|**describeCheckAliasIps**|POST|添加别名IP范围-校验合法性|
|**describeConfigTypePin**|GET|查询config_type_pin的黑白名单信息|
|**describeConfigTypePinList**|GET|获取当前用户pin下合法的device类型列表|
|**describeDeviceRaids**|GET|查询某种实例类型的分布式云物理服务器支持的RAID类型，可查询系统盘RAID类型和数据盘RAID类型|
|**describeDeviceStock**|GET|查询分布式云物理服务器库存|
|**describeDeviceTypes**|GET|查询分布式云物理服务器实例类型|
|**describeEdCPSRegions**|GET|查询分布式分布式云物理服务器地域列表|
|**describeElasticIp**|GET|查询弹性公网IP详情|
|**describeElasticIpQuota**|GET|查询弹性公网IP配额|
|**describeElasticIpStock**|GET|查询弹性公网IP库存|
|**describeElasticIpStockEnough**|GET|物理机创建页-验证deviceType库存是否充足|
|**describeElasticIps**|GET|查询弹性公网IP列表<br/><br>支持分页查询，默认每页20条<br/><br>|
|**describeEventLogs**|GET|查询云物理服务器监控报警日志信息|
|**describeInstance**|GET|查询单台分布式云物理服务器详细信息|
|**describeInstanceName**|GET|查询分布式云物理服务器名称|
|**describeInstanceQuota**|GET|查询分布式云物理服务器配额|
|**describeInstanceRaid**|GET|查询单个分布式云物理服务器已安装的RAID信息，包括系统盘RAID信息和数据盘RAID信息|
|**describeInstanceStatus**|GET|查询单个分布式云物理服务器硬件监控信息|
|**describeInstances**|GET|批量查询分布式云物理服务器详细信息<br/><br>支持分页查询，默认每页20条<br/><br>|
|**describeIpv6AddressIsBindAliasIps**|GET|检查Ipv6地址是否已经绑定别名IP；返回true则代表绑定了。|
|**describeKeypair**|GET|查询密钥对详情|
|**describeKeypairs**|GET|查询密钥对列表|
|**describeLineTypes**|GET|查询链路类型|
|**describeListener**|GET|查询监听器详情|
|**describeListeners**|GET|查询监听器列表|
|**describeLoadBalanceName**|GET|查询LB名称|
|**describeLoadBalancer**|GET|查询负载均衡实例详情|
|**describeLoadBalancerQuota**|GET|查询负载均衡配额|
|**describeLoadBalancers**|GET|查询负载均衡实例列表|
|**describeOS**|GET|查询分布式云物理服务器支持的操作系统|
|**describeRegionConfigList**|GET|根据region返回region config表记录|
|**describeRenewalResourceList**|GET|查询资源名称和资源绑定关系|
|**describeRouteTable**|GET|查询路由表详情|
|**describeRouteTables**|GET|查询路由表列表|
|**describeSecondaryCidrs**|GET|查询次要CIDR列表|
|**describeServer**|GET|查询后端服务器详情|
|**describeServerGroup**|GET|查询虚拟服务器组|
|**describeServerGroups**|GET|查询虚拟服务器组列表|
|**describeServers**|GET|查询后端服务器列表|
|**describeSubnet**|GET|查询子网详情|
|**describeSubnets**|GET|查询子网列表|
|**describeVpc**|GET|查询私有网络详情|
|**describeVpcs**|GET|查询私有网络列表|
|**disassociateElasticIp**|PUT|解绑弹性公网IP<br>|
|**disassociateLoadBalancerEip**|PUT|解绑弹性公网IP|
|**importKeypairs**|PUT|导入密钥对|
|**modifyBandwidthPackage**|POST|修改共享带宽<br>|
|**modifyBandwidthPackageBandwidth**|PUT|修改共享带宽的带宽<br>|
|**modifyElasticIpBandwidth**|PUT|修改弹性公网IP带宽<br>|
|**modifyInstance**|POST|修改分布式云物理服务器部分信息，包括名称、描述|
|**modifyListener**|POST|修改监听器|
|**modifyLoadBalancer**|POST|修改负载均衡实例|
|**modifyServer**|POST|修改后端服务器|
|**modifyServerGroup**|POST|修改虚拟服务器组|
|**modifySubnet**|POST|修改子网|
|**modifyVpc**|POST|修改私有网络<br>|
|**reinstallInstance**|PUT|重装分布式云物理服务器，只能重装stopped状态的服务器<br/><br>- 可调用接口（describeOS）获取分布式云物理服务器支持的操作系统列表<br>敏感操作，可开启<a href="https://docs.jdcloud.com/cn/security-operation-protection/operation-protection">MFA操作保护</a>|
|**removeBandwidthPackageIp**|PUT|移除共享带宽IP<br>|
|**removeServer**|DELETE|移除后端服务器|
|**removeSr**|DELETE|支持运营平台移除边缘设备|
|**resetPassword**|PUT|重置分布式云物理服务器密码<br>|
|**restartInstance**|PUT|重启单台分布式云物理服务器，只能重启running状态的服务器<br>敏感操作，可开启<a href="https://docs.jdcloud.com/cn/security-operation-protection/operation-protection">MFA操作保护</a>|
|**startInstance**|PUT|对单台分布式云物理服务器执行开机操作，只能启动stopped状态的服务器|
|**startListener**|PUT|开启监听器|
|**startLoadBalancer**|PUT|开启负载均衡实例|
|**stopInstance**|PUT|对单台分布式云物理服务器执行关机操作，只能停止running状态的服务器<br>敏感操作，可开启<a href="https://docs.jdcloud.com/cn/security-operation-protection/operation-protection">MFA操作保护</a>|
|**stopListener**|PUT|关闭监听器|
|**stopLoadBalancer**|PUT|关闭负载均衡实例|
