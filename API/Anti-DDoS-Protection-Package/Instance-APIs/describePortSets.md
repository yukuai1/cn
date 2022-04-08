# describePortSets


## 描述
查询实例的端口库列表

## 请求方式
GET

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/portSets

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
|**result**|[Result](describeportsets#result)| |
|**requestId**|String| |
|**error**|[Error](describeportsets#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](describeportsets#err)| |
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
|**dataList**|[PortSet[]](describeportsets#portset)| |
|**currentCount**|Integer|当前页数量|
|**totalCount**|Integer|实例总数|
|**totalPage**|Integer|总页数|
### <div id="portset">PortSet</div>
|名称|类型|描述|
|---|---|---|
|**id**|String|端口库 Id|
|**name**|String|端口库名称|
|**port**|String[]|端口或端口范围的数组|
|**remark**|String|备注|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
