# modifyAnalysisThreshold


## 描述
设置缓存分析阈值

## 请求方式
POST

## 请求地址
https://redis.jdcloud-api.com/v1/regions/{regionId}/cacheInstance/{cacheInstanceId}/cacheAnalysisThreshold

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |缓存Redis实例所在区域的Region ID。目前有华北-北京、华南-广州、华东-上海三个区域，Region ID分别为cn-north-1、cn-south-1、cn-east-2|
|**cacheInstanceId**|String|True| |缓存Redis实例ID，是访问实例的唯一标识|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**stringSize**|Integer|False|1024|String类型阈值|
|**listSize**|Integer|False|10240|List类型阈值|
|**hashSize**|Integer|False|10240|Hash类型阈值|
|**setSize**|Integer|False|10240|Set类型阈值|
|**zsetSize**|Integer|False|10240|Zset类型阈值|
|**top**|Integer|False|10|top值，范围10~1000|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|本次请求的ID|


## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
