# describePortSet


## 描述
查询实例的端口库

## 请求方式
GET

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/portSets/{portSetId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id, DDoS 防护包目前支持华北-北京, 华东-宿迁, 华东-上海|
|**instanceId**|String|True| |防护包实例 Id|
|**portSetId**|String|True| |端口库 Id|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](describeportset#result)| |
|**requestId**|String| |
|**error**|[Error](describeportset#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](describeportset#err)| |
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
|**data**|[PortSet](describeportset#portset)| |
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
