# describeBigKeyDetail


## 描述
查询大key分析详情

## 请求方式
GET

## 请求地址
https://redis.jdcloud-api.com/v1/regions/{regionId}/cacheInstance/{cacheInstanceId}/bigKeyDetail

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
|**result**|[Result](describebigkeydetail#result)|结果|
|**requestId**|String|本次请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**startTime**|String|任务开始时间, rfc3339格式|
|**finishTime**|String|任务结束时间, rfc3339格式|
|**analysisType**|Integer|任务类型，0:自动分析，1:手动分析|
|**stringBigKeys**|[RedisBigKey[]](describebigkeydetail#redisbigkey)|string类型的大key的降序数组|
|**hashBigKeys**|[RedisBigKey[]](describebigkeydetail#redisbigkey)|hash类型的大key的降序数组|
|**listBigKeys**|[RedisBigKey[]](describebigkeydetail#redisbigkey)|list类型的大key的降序数组|
|**zsetBigKeys**|[RedisBigKey[]](describebigkeydetail#redisbigkey)|zset类型的大key的降序数组|
|**setBigKeys**|[RedisBigKey[]](describebigkeydetail#redisbigkey)|set类型的大key的降序数组|
### <div id="redisbigkey">RedisBigKey</div>
|名称|类型|描述|
|---|---|---|
|**name**|String|key名称|
|**db**|Integer|key所在的db号|
|**size**|Integer|key占用的内存，单位：字节|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
