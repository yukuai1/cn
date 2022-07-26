# describeAnalysisThreshold


## 描述
查询缓存分析阈值

## 请求方式
GET

## 请求地址
https://redis.jdcloud-api.com/v1/regions/{regionId}/cacheInstance/{cacheInstanceId}/cacheAnalysisThreshold

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |缓存Redis实例所在区域的Region ID。目前有华北-北京、华南-广州、华东-上海三个区域，Region ID分别为cn-north-1、cn-south-1、cn-east-2|
|**cacheInstanceId**|String|True| |缓存Redis实例ID，是访问实例的唯一标识|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**taskId**|String|True| |任务id|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](describeanalysisthreshold#result)|结果|
|**requestId**|String|本次请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**stringSize**|Integer|String类型的阈值|
|**listSize**|Integer|List类型的阈值|
|**hashSize**|Integer|Hash类型的阈值|
|**setSize**|Integer|Set类型的阈值|
|**zsetSize**|Integer|Zset类型的阈值|
|**topSize**|Integer|top值|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
