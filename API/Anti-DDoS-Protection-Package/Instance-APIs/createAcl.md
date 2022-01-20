# createAcl


## 描述
创建访问控制规则

## 请求方式
POST

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/acl

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id, DDoS 防护包目前支持华北-北京, 华东-宿迁, 华东-上海|
|**instanceId**|String|True| |防护包实例 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**createAclSpec**|[CreateAclSpec](createacl#createaclspec)|True| |创建防护包实例请求参数|

### <div id="createaclspec">CreateAclSpec</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**priority**|Integer|True| |规则优先级|
|**sipType**|Integer|True| |源IP类型: 0: IP, 1: IP地址库|
|**sip**|String|False| |源IP, sipType 为 0 时有效, 否则为空|
|**sipIpSetId**|String|False| |IP地址库 Id, sipType 为 1 时必传, 可以使用自定义地址库或以下地址库。<br>'-1' IP高防回源地址<br>'-2' Web应用防火墙回源地址|
|**dipType**|Integer|True| |目的IP类型: 0: IP, 1: IP地址库|
|**dip**|String|False| |目的IP, dipType 为 0 时有效, 否则为空|
|**dipIpSetId**|String|False| |IP地址库 Id, dipType 为 1 时必传, 可以使用自定义地址库或以下地址库。<br>'-1' IP高防回源地址<br>'-2' Web应用防火墙回源地址|
|**protocol**|String|True| |协议类型: 支持 All Traffic, TCP, UDP, ICMP|
|**portType**|Integer|False| |端口类型: 0: 端口或端口范围, 1: 端口库|
|**port**|String|False| |端口或端口范围, portType 为 0 时有效，否则为空|
|**portSetId**|String|False| |端口库Id, portType 为 1 时必传|
|**action**|Integer|True| |动作: 0: 放行, 1: 阻断. 阻断动作对ICMP协议所有端口生效, 所以动作为阻断, 且协议类型为 ICMP 时, 阻断动作端口类型, 端口或端口范围, 端口Id三个字段无效, 可不传|
|**remark**|String|True| |备注|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](createacl#result)| |
|**requestId**|String| |
|**error**|[Error](createacl#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](createacl#err)| |
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
|**aclId**|String|创建的访问控制规则 Id|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
