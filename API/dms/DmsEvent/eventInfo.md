# eventInfo


## 描述
获取事件详情，支持Mysql

## 请求方式
POST

## 请求地址
https://dms.jdcloud-api.com/v1/regions/{regionId}/event:info

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域代码，取值范围参见[《各地域及可用区对照表》](../Enum-Definitions/Regions-AZ.md)|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**dataSourceId**|Integer|True| |数据源id|
|**dbName**|String|True| |数据库名称。|
|**eventName**|String|True| |事件名称。|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|[String](#result)|请求id|

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**dbName**|String|数据库名称。|
|**eventName**|String|事件名称。|
|**eventComment**|String|注释。|
|**eventStatus**|String|状态，ENABLED,DISABLED, SLAVESIDE_DISABLED。|
|**isPreserve**|Boolean|完成后是否保存。|
|**eventDefinition**|String|事件定义。|
|**eventType**|String|调度方式，ONE_TIME,RECURRING。|
|**executeAt**|String|执行一次的时间。|
|**intervalValue**|String|循环执行时间隔时间的值。|
|**intervalField**|String|循环执行时间隔时间的单位，YEAR,QUARTER,MONTH,WEEK,DAY,HOUR,MINUTE,SECOND,YEAR_MONTH,DAY_HOUR,DAY_MINUTE,DAY_SECOND,HOUR_MINUTE,HOUR_SECOND,MINUTE_SECOND。|
|**starts**|String|循环执行开始时间。|
|**ends**|String|循环执行结束时间。|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
