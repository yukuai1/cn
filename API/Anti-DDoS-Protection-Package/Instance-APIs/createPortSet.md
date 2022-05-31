# createPortSet


## 描述
创建实例的端口库

## 请求方式
POST

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/portSets

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id, DDoS 防护包目前支持华北-北京, 华东-宿迁, 华东-上海|
|**instanceId**|String|True| |防护包实例 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**portSetSpec**|[PortSetSpec](createportset#portsetspec)|True| |创建实例的端口库请求参数|

### <div id="portsetspec">PortSetSpec</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |端口库名称|
|**port**|String[]|True| |端口或端口范围的数组|
|**remark**|String|True| |备注|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](createportset#result)| |
|**requestId**|String| |
|**error**|[Error](createportset#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](createportset#err)| |
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
|**portSetId**|String|创建的端口库 Id|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
