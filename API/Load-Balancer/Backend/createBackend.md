# createBackend


## 描述
创建一个后端服务

## 请求方式
POST

## 请求地址
https://lb.jdcloud-api.com/v1/regions/{regionId}/backends/

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**backendName**|String|True| |后端服务名字,只允许输入中文、数字、大小写字母、英文下划线“_”及中划线“-”，不允许为空且不超过32字符|
|**loadBalancerId**|String|True| |后端服务所属负载均衡的Id|
|**protocol**|String|True| |后端服务的协议 <br>【alb】取值范围：Http、Tcp、Udp <br>【nlb】取值范围：Tcp、Udp <br>【dnlb】取值范围：Tcp、Udp|
|**port**|Integer|True| |后端服务的端口，取值范围为[1, 65535]，如指定了TargetSpec中的port，实际按照target指定的port进行转发|
|**healthCheckSpec**|[HealthCheckSpec](createbackend#healthcheckspec)|True| |健康检查信息|
|**algorithm**|String|False| |调度算法 <br>【alb,nlb】取值范围为[IpHash, RoundRobin, LeastConn]（取值范围的含义：加权源Ip哈希，加权轮询和加权最小连接），alb和nlb默认为加权轮询 <br>【dnlb】取值范围为[IpHash, QuintupleHash]（取值范围的含义分别为：加权源Ip哈希和加权五元组哈希），dnlb默认为加权源Ip哈希|
|**targetGroupIds**|String[]|False| |虚拟服务器组的Id列表，目前只支持一个，且与agIds不能同时存在|
|**agIds**|String[]|False| |高可用组的Id列表，目前只支持一个，且与targetGroupIds不能同时存在|
|**proxyProtocol**|Boolean|False| |【alb Tcp、Udp协议】获取真实ip, 取值为False(不获取)或者True(获取,支持Proxy Protocol v1版本)，默认为False|
|**description**|String|False| |描述,允许输入UTF-8编码下的全部字符，不超过256字符|
|**sessionStickiness**|Boolean|False| |会话保持, 取值为false(不开启)或者true(开启)，默认为false <br>【alb Http协议，RoundRobin算法】支持基于cookie的会话保持 <br>【nlb】支持基于报文源目的IP的会话保持|
|**sessionStickyTimeout**|Integer|False| |【nlb】会话保持超时时间，sessionStickiness开启时生效，默认300s, 取值范围[1-3600]|
|**connectionDrainingSeconds**|Integer|False| |【nlb】连接耗尽超时。移除target前，连接的最大保持时间，默认300s，取值范围[0-3600]|
|**httpCookieExpireSeconds**|Integer|False| |【alb Http协议】cookie的过期时间,sessionStickiness开启时生效，取值范围为[0-86400], 默认为0（表示cookie与浏览器同生命周期）|
|**httpForwardedProtocol**|Boolean|False| |【alb Http协议】获取负载均衡的协议, 取值为False(不获取)或True(获取), 默认为False|
|**httpForwardedPort**|Boolean|False| |【alb Http协议】获取负载均衡的端口, 取值为False(不获取)或True(获取), 默认为False|
|**httpForwardedHost**|Boolean|False| |【alb Http协议】获取负载均衡的host信息, 取值为False(不获取)或True(获取), 默认为False|
|**httpForwardedVip**|Boolean|False| |【alb Http协议】获取负载均衡的vip, 取值为False(不获取)或True(获取), 默认为False|
|**httpForwardedClientPort**|Boolean|False| |【alb Http协议】获取请求端使用的端口, 取值为False(不获取)或True(获取), 默认为False|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](createbackend#result)|返回结果|
|**requestId**|String|请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**backendId**|String|后端服务id|

## 返回码
|返回码|描述|
|---|---|
|**200**|Successful operation|
|**409**|backend.inuse.name:backend name 'xxx' is already exist|
|**404**|Resource not found|
|**429**|Quota limit backend exceeded.|
|**400**|Request parameter x.y.z is 'xxx', expected one of [yyy,zzz]|
