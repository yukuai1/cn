# getDisableCommands


## 描述
获取禁用命令列表

## 请求方式
GET

## 请求地址
https://redis.jdcloud-api.com/v1/regions/{regionId}/cacheInstance/{cacheInstanceId}/disableCommands

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |缓存Redis实例所在区域的Region ID。目前有华北-北京、华南-广州、华东-上海三个区域，Region ID分别为cn-north-1、cn-south-1、cn-east-2|
|**cacheInstanceId**|String|True| |缓存Redis实例ID，是访问实例的唯一标识|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](getdisablecommands#result)|结果|
|**requestId**|String|本次请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**disableCommandLists**|[DisableCommandsInfo[]](getdisablecommands#disablecommandsinfo)|禁用命令列表|
### <div id="disablecommandsinfo">DisableCommandsInfo</div>
|名称|类型|描述|
|---|---|---|
|**commandName**|String|命令名称|
|**disableTime**|String|命令禁用时间|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
