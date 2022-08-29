# startClearData


## 描述
创建数据清理任务

## 请求方式
POST

## 请求地址
https://redis.jdcloud-api.com/v1/regions/{regionId}/cacheInstance/{cacheInstanceId}/startClearData

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |缓存Redis实例所在区域的Region ID。目前有华北-北京、华南-广州、华东-上海三个区域，Region ID分别为cn-north-1、cn-south-1、cn-east-2|
|**cacheInstanceId**|String|True| |缓存Redis实例ID，是访问实例的唯一标识|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**clearType**|String|True| |数据清理任务类型|
|**keyPattern**|String|False| |匹配模式, 如: test*、*test、ab*cc*, 当节点为AllData、ExpiredData时可以忽略此参数|
|**keyFilter**|[KeyFilter[]](startcleardata#keyfilter)|False| |key的过滤条件, 当节点为AllData、ExpiredData时可以忽略此参数|
|**qpsLimit**|Integer|False| |数据遍历的速率|

### <div id="keyfilter">KeyFilter</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**filterType**|String|True| |按过期时间过滤(ttl)、按空闲时间过滤(idle)|
|**operator**|String|True| |操作符(eq、gt、lt)|
|**value**|Integer|True| |操作值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|本次请求的ID|


## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
