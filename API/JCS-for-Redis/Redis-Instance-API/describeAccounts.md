# describeAccounts


## 描述
查询账号信息

## 请求方式
GET

## 请求地址
https://redis.jdcloud-api.com/v1/regions/{regionId}/cacheInstance/{cacheInstanceId}/account

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |缓存Redis实例所在区域的Region ID。目前有华北-北京、华南-广州、华东-上海三个区域，Region ID分别为cn-north-1、cn-south-1、cn-east-2|
|**cacheInstanceId**|String|True| |缓存Redis实例ID，是访问实例的唯一标识|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](describeaccounts#result)|结果|
|**requestId**|String|本次请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**isSupport**|Boolean|是否支持账号管理功能|
|**accountLists**|[Accounts[]](describeaccounts#accounts)|账号信息列表|
### <div id="accounts">Accounts</div>
|名称|类型|描述|
|---|---|---|
|**accountName**|String|账号名称|
|**accountType**|String|账号类型。如果为default则为默认账号；如果为normal则为普通账号|
|**accountPrivilege**|String|账号权限|
|**accountDescription**|String|账号描述|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
