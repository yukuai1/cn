# deleteProtectedIp


## 描述
删除防护包防护 IP

## 请求方式
POST

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}:deleteProtectedIp

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id, DDoS 防护包目前支持华北-北京, 华东-宿迁, 华东-上海|
|**instanceId**|String|True| |防护包实例 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**protectedIpSpec**|[ProtectedIpSpec](deleteprotectedip#protectedipspec)|True| |删除防护包防护 IP 请求参数|

### <div id="protectedipspec">ProtectedIpSpec</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ip**|String[]|True| |被防护 IP 列表|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](deleteprotectedip#result)| |
|**requestId**|String| |
|**error**|[Error](deleteprotectedip#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](deleteprotectedip#err)| |
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
|**code**|Integer|删除防护 IP 结果, 0: 删除失败, 1: 删除成功|
|**message**|String|删除失败时给出具体原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
