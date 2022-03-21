# enableCloudDiskCapacity


## 描述
开启数据库的云盘扩容功能

## 请求方式
POST

## 请求地址
https://clickhouse.jdcloud-api.com/v1/regions/{regionId}/cloudDiskCapacity:enableCloudDiskCapacity

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域代码|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pin**|String|True| |pin|
|**instanceId**|String|False| |instanceId|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求id|


## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
