# enableInternetAccess


## 描述
开启TiDB服务的公网访问域名

## 请求方式
POST

## 请求地址
https://tidb.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}:enableInternetAccess

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域代码|
|**instanceId**|String|True| |实例ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**serviceType**|String|True| |按照service type (database pd monitor)开启公网域名|


## 返回参数
无


## 返回码
|返回码|描述|
|---|---|
|**202**|OK|
