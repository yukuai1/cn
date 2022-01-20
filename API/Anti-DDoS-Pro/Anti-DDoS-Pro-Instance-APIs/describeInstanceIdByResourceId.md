# describeInstanceIdByResourceId


## 描述
根据高防计费资源ID查询对应的实例Id, 调用 <a href='http://docs.jdcloud.com/anti-ddos-pro/api/createInstance'>createInstance</a> 接口成功后，跟据message字段返回的计费资源Id查询对应的高防实例ID, 需要高防实例实际创建成功以后才可查询得到

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/describeInstanceIdByResourceId

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 ID, 高防不区分区域, 传 cn-north-1 即可|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**resourceId**|String|True| |高防实例计费资源ID|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](describeinstanceidbyresourceid#result)| |
|**requestId**|String| |
|**error**|[Error](describeinstanceidbyresourceid#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](describeinstanceidbyresourceid#err)| |
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
|**data**|[InstanceIdVo](describeinstanceidbyresourceid#instanceidvo)| |
### <div id="instanceidvo">InstanceIdVo</div>
|名称|类型|描述|
|---|---|---|
|**resourceId**|String|高防实例计费资源ID|
|**instanceId**|String|高防实例ID|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
