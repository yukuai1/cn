# describeInstances


## 描述
查询防护包实例列表

## 请求方式
GET

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id, DDoS 防护包目前支持华北-北京, 华东-宿迁, 华东-上海|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码|
|**pageSize**|Integer|False|10|分页大小|
|**name**|String|False| |防护包名称, 支持模糊匹配|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](describeinstances#result)| |
|**requestId**|String| |
|**error**|[Error](describeinstances#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](describeinstances#err)| |
### <div id="err">Err</div>
|名称|类型|描述|
|---|---|---|
|**code**|Long|同http code|
|**details**|Object| |
|**message**|String| |
|**status**|String|具体错误|
### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**dataList**|[Instance[]](describeinstances#instance)| |
|**currentCount**|Integer|当前页数量|
|**totalCount**|Integer|实例总数|
|**totalPage**|Integer|总页数|
### <div id="instance">Instance</div>
|名称|类型|描述|
|---|---|---|
|**id**|String|防护包实例 Id|
|**name**|String|防护包实例名称|
|**region**|String|防护包实例地域|
|**type**|Integer|套餐类型. <br>- 1: 独享 IP<br>- 2: 共享 IP|
|**ipCount**|Integer|可防护 IP 个数|
|**aclLimit**|Integer|可添加的访问控制规则数量|
|**basicBandwidth**|Integer|保底带宽, 单位 Gbps|
|**elasticBandwidth**|Integer|弹性带宽, 单位 Gbps|
|**expireTime**|String|实例过期时间|
|**createTime**|String|实例创建时间|
|**protectedObjects**|[ProtectedObject[]](describeinstances#protectedobject)|防护对象|
|**onTrial**|Boolean|是否为试用防护包|
|**resourceId**|String|资源 Id|
|**tags**|[Tag[]](describeinstances#tag)|Tag信息|
### <div id="tag">Tag</div>
|名称|类型|描述|
|---|---|---|
|**key**|String|Tag键|
|**value**|String|Tag值|
### <div id="protectedobject">ProtectedObject</div>
|名称|类型|描述|
|---|---|---|
|**type**|String|防护对象类型: eip: 弹性公网 IP, cps: 云物理服务器公网 IP, waf: Web应用防护墙 IP, ccs: 托管区公网 IP|
|**count**|Integer|已防护 IP 个数|
|**ipList**|[ProtectedIp[]](describeinstances#protectedip)|防护 IP 列表|
### <div id="protectedip">ProtectedIp</div>
|名称|类型|描述|
|---|---|---|
|**ip**|String|被防护 IP|
|**safeStatus**|Integer|安全状态. <br>- 0: 安全<br>- 1: 清洗<br>- 2: 黑洞|
|**resourceType**|Integer|公网 IP 类型或绑定资源类型. <br><br>- 0: 未知类型<br><br>- 1: 弹性公网 IP(IP 为弹性公网 IP, 绑定资源类型未知)<br><br>- 10: 弹性公网 IP(IP 为弹性公网 IP, 但未绑定资源)<br><br>- 11: 云主机<br><br>- 12: 负载均衡<br><br>- 13: 原生容器实例<br><br>- 14: 原生容器 Pod<br><br>- 2: 云物理服务器公网 IP<br><br>- 3: Web应用防火墙 IP<br><br>- 4: 托管区公网 IP<br>|
|**protectionRuleType**|Integer|防护规则类型. <br>- 0: 默认(防护包的防护规则)<br>- 1: IP 自定义规则|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
