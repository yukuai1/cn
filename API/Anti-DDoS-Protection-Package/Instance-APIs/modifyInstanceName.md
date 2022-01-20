# modifyInstanceName


## 描述
修改防护包实例名称

## 请求方式
PATCH

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}:modifyInstanceName

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id, DDoS 防护包目前支持华北-北京, 华东-宿迁, 华东-上海|
|**instanceId**|String|True| |防护包实例 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**modifyInstanceNameSpec**|[ModifyInstanceNameSpec](modifyinstancename#modifyinstancenamespec)|True| |修改防护包实例名称请求参数|

### <div id="modifyinstancenamespec">ModifyInstanceNameSpec</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |新的实例名称, 长度限制为 1-80 个字符, 只允许包含中文, 字母, 数字, -, ., /, _|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](modifyinstancename#result)| |
|**requestId**|String| |
|**error**|[Error](modifyinstancename#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](modifyinstancename#err)| |
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
|**code**|Integer|修改结果, 0: 修改失败, 1: 修改成功|
|**message**|String|修改失败时给出具体原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
