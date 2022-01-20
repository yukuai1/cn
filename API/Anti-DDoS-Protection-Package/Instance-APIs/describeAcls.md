# describeAcls


## 描述
查询防护包实例的访问控制列表

## 请求方式
GET

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/acl

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id, DDoS 防护包目前支持华北-北京, 华东-宿迁, 华东-上海|
|**instanceId**|String|True| |防护包实例 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码|
|**pageSize**|Integer|False|10|分页大小|
|**filters**|[Filter[]](describeacls#filter)|False| |sip - 按照源 IP, 源 IP 范围或者 IP 地址库名称匹配, 仅支持 like 操作符，支持单个<br>dip - 按照目的 IP, 目的 IP 范围或者 IP 地址库名称匹配, 仅支持 like 操作符，支持单个<br>|

### <div id="filter">Filter</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤条件的名称|
|**operator**|String|False| |过滤条件的操作符，默认eq|
|**values**|String[]|True| |过滤条件的值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](describeacls#result)| |
|**requestId**|String| |
|**error**|[Error](describeacls#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](describeacls#err)| |
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
|**dataList**|[Acl[]](describeacls#acl)| |
|**currentCount**|Integer|当前页数量|
|**totalCount**|Integer|实例总数|
|**totalPage**|Integer|总页数|
### <div id="acl">Acl</div>
|名称|类型|描述|
|---|---|---|
|**id**|String|访问控制规则 Id|
|**priority**|Integer|规则优先级|
|**sipType**|Integer|源IP类型: 0: IP, 1: IP地址库|
|**sip**|String|源IP, sipType 为 0 时有效, 否则为空|
|**sipIpSetId**|String|IP地址库 Id, sipType 为 1 时有效, 否则为空。<br>'-1' IP高防回源地址<br>'-2' Web应用防火墙回源地址|
|**sipIpSetName**|String|IP地址库名称|
|**dipType**|Integer|目的IP类型: 0: IP, 1: IP地址库|
|**dip**|String|目的IP, dipType 为 0 时有效, 否则为空|
|**dipIpSetId**|String|IP地址库 Id, dipType 为 1 时有效, 否则为空。<br>'-1' IP高防回源地址<br>'-2' Web应用防火墙回源地址|
|**dipIpSetName**|String|IP地址库名称|
|**protocol**|String|协议类型: 支持 All Traffic, TCP, UDP, ICMP|
|**portType**|Integer|端口类型: 0: IP, 1: 端口库|
|**port**|String|端口或端口范围, portType 为 0 时有效，否则为空|
|**portSetId**|String|端口库Id, portType 为 1 时有效，否则为空|
|**portSetName**|String|端口库名称|
|**action**|Integer|动作: 0: 放行, 1: 阻断|
|**enable**|Integer|规则状态: 0: 关闭, 1: 打开|
|**remark**|String|备注|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
