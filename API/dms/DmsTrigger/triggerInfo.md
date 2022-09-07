# triggerInfo


## 描述
获取触发器详情，支持Mysql

## 请求方式
POST

## 请求地址
https://dms.jdcloud-api.com/v1/regions/{regionId}/trigger:info

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域代码，取值范围参见[《各地域及可用区对照表》](../Enum-Definitions/Regions-AZ.md)|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**dataSourceId**|Integer|True| |数据源id|
|**dbName**|String|True| |数据库名称。|
|**triggerName**|String|True| |触发器名称。|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|[String](#result)|请求id|

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**dbName**|String|数据库名称。|
|**triggerName**|String|存储过程名称。|
|**triggerTiming**|String|触发时机，BEFORE("BEFORE", 1),AFTER("AFTER", 2)。|
|**triggerEvent**|String|激活触发器的事件，INSERT("INSERT", 1),UPDATE("UPDATE", 2), DELETE("DELETE", 3)。|
|**triggerTable**|String|触发表|
|**triggerStatement**|String|触发器定义。|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
