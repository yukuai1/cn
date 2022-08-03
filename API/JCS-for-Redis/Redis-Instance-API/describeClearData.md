# describeClearData


## 描述
查询数据清理任务进度

## 请求方式
GET

## 请求地址
https://redis.jdcloud-api.com/v1/regions/{regionId}/cacheInstance/{cacheInstanceId}/describeClearData

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |缓存Redis实例所在区域的Region ID。目前有华北-北京、华南-广州、华东-上海三个区域，Region ID分别为cn-north-1、cn-south-1、cn-east-2|
|**cacheInstanceId**|String|True| |缓存Redis实例ID，是访问实例的唯一标识|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](describecleardata#result)|进度详情|
|**requestId**|String|本次请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**clearType**|String|数据清理任务类型|
|**keyPattern**|String|匹配模式, 如: test*、*test、ab*cc*, 当节点为AllData、ExpiredData时可以忽略此参数|
|**keyFilter**|[KeyFilter[]](describecleardata#keyfilter)|key的过滤条件, 当节点为AllData、ExpiredData时可以忽略此参数|
|**qpsLimit**|Integer|数据遍历的速率|
|**progress**|Integer|本次清理任务的完成进度|
|**effectKeys**|Integer|本次清理任务已成功清理的key数量|
|**status**|String|本次清理任务的状态:running、success、failed|
|**message**|String|本次清理任务失败的原因|
|**lastTransitionTime**|String|最近一次status转换的时间|
### <div id="keyfilter">KeyFilter</div>
|名称|类型|描述|
|---|---|---|
|**filterType**|String|按过期时间过滤(ttl)、按空闲时间过滤(idle)|
|**operator**|String|操作符(eq、gt、lt)|
|**value**|Integer|操作值|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
