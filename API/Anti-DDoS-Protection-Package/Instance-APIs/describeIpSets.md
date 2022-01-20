# describeIpSets


## 描述
查询实例的 IP 库列表

## 请求方式
GET

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/ipSets

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id, DDoS 防护包目前支持华北-北京, 华东-宿迁, 华东-上海|
|**instanceId**|String|True| |防护包实例 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码|
|**pageSize**|Integer|False|10|分页大小|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](describeipsets#result)| |
|**requestId**|String| |
|**error**|[Error](describeipsets#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](describeipsets#err)| |
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
|**dataList**|[IpSet[]](describeipsets#ipset)| |
|**currentCount**|Integer|当前页数量|
|**totalCount**|Integer|实例总数|
|**totalPage**|Integer|总页数|
### <div id="ipset">IpSet</div>
|名称|类型|描述|
|---|---|---|
|**id**|String|IP 库 Id|
|**name**|String|IP 库的名称|
|**ip**|String[]|IP 或 IP 段的数组|
|**remark**|String|备注|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
