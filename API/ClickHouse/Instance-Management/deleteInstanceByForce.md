# deleteInstanceByForce


## 描述
强行删除DRDS实例，包括包年包月未过期实例

## 请求方式
POST

## 请求地址
https://clickhouse.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}:deleteInstanceByForce

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域代码|
|**instanceId**|String|True| |实例ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**requestUser**|String|True| |发出请求的运营后台的ERP账号|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求id|


## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
