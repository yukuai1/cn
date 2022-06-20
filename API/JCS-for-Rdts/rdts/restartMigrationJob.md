# restartMigrationJob


## 描述
如果迁移超时、迁移失败，可重新迁移

## 请求方式
POST

## 请求地址
https://rdts.jdcloud-api.com/v2/regions/{regionId}/instance/{instanceId}:remigrate

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |迁移任务所在区域的Region ID。华北-北京(cn-north-1)，华东-上海(cn-east-2)，华南-广州(cn-south-1)|
|**instanceId**|String|True| |迁移任务的唯一标识|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|本次请求ID|


## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
