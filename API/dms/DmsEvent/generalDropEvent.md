# generalDropEvent


## 描述
生成删除事件sql语句，支持Mysql

## 请求方式
POST

## 请求地址
https://dms.jdcloud-api.com/v1/regions/{regionId}/event:generalDrop

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
|**dmsSqls**|[DmsSql[]](#dmssql)|生成sql。|
### <div id="DmsSql">DmsSql</div>
|名称|类型|描述|
|---|---|---|
|**sql**|String|SQL语句。|
|**sqlTypeEnum**|String|SQL类型：CREATE_VIEW，DROP_VIEW， ALTER_VIEW，CREATE_PROCEDURE，DROP_PROCEDURE， ALTER_PROCEDURE，CREATE_FUNCTION，DROP_FUNCTION， ALTER_FUNCTION，CREATE_TRIGGER，ALTER_TRIGGER，DROP_TRIGGER，CREATE_EVENT，ALTER_EVENT，DROP_EVENT。|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
