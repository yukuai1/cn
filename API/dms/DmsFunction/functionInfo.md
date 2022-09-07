# functionInfo


## 描述
获取函数详情，支持Mysql

## 请求方式
POST

## 请求地址
https://dms.jdcloud-api.com/v1/regions/{regionId}/function:info

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域代码，取值范围参见[《各地域及可用区对照表》](../Enum-Definitions/Regions-AZ.md)|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**dataSourceId**|Integer|True| |数据源id|
|**dbName**|String|True| |数据库名称。|
|**functionName**|String|True| |函数名称。|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|[String](#result)|请求id|

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**dbName**|String|数据库名称。|
|**functionName**|String|函数名称。|
|**functionSecurity**|String|安全性，DEFAULT("DEFAULT", 1),DEFINER("DEFINER", 2), INVOKER("INVOKER", 3);|
|**dataAccess**|String|数据访问，DEFAULT("DEFAULT", 1),NO_SQL("NO_SQL", 2), CONTAINS_SQL("CONTAINS_SQL", 3), READS_SQL_DATA("READS_SQL_DATA", 4), MODIFIES_SQL_DATA("MODIFIES_SQL_DATA", 5);|
|**deterministic**|Boolean|确定性。|
|**definitionSql**|String|函数定义SQL。|
|**completeSql**|String|创建存储过程定义完整SQL。|
|**parameters**|[Parameter[]](#parameter)|查询条件。|
|**definer**|String|定义者。|
|**comment**|String|注释。|
|**returnType**|String|返回值类型，TINYINT("TINYINT", 0), SMALLINT("SMALLINT", 1), MEDIUMINT("MEDIUMINT", 2), INT("INT", 3), BIGINT("BIGINT", 4), INTEGER("INTEGER", 5), FLOAT("FLOAT", 6), DOUBLE("DOUBLE", 7), REAL("REAL", 8), DECIMAL("DECIMAL", 9), CHAR("CHAR", 10), VARCHAR("VARCHAR", 11), TINYTEXT("TINYTEXT", 12), TEXT("TEXT", 13), MEDIUMTEXT("MEDIUMTEXT", 14), LONGTEXT("LONGTEXT", 15), DATE("DATE", 16), DATETIME("DATETIME", 17), TIMESTAMP("TIMESTAMP", 18), TIME("TIME", 19), YEAR("YEAR", 19), BINARY("BINARY", 20), VARBINARY("VARBINARY", 21), TINYBLOB("TINYBLOB", 22), BLOB("BLOB", 23), MEDIUMBLOB("MEDIUMBLOB", 24), LONGBLOB("LONGBLOB", 25);|
|**returnLength**|Integer|返回值长度。|
|**returnDecimal**|Integer|返回值精度。|
### <div id="Parameter">Parameter</div>
|名称|类型|描述|
|---|---|---|
|**name**|String|参数名称。|
|**columnTypeEnum**|String|列类型，TINYINT("TINYINT", 0), SMALLINT("SMALLINT", 1), MEDIUMINT("MEDIUMINT", 2), INT("INT", 3), BIGINT("BIGINT", 4), INTEGER("INTEGER", 5), FLOAT("FLOAT", 6), DOUBLE("DOUBLE", 7), REAL("REAL", 8), DECIMAL("DECIMAL", 9), CHAR("CHAR", 10), VARCHAR("VARCHAR", 11), TINYTEXT("TINYTEXT", 12), TEXT("TEXT", 13), MEDIUMTEXT("MEDIUMTEXT", 14), LONGTEXT("LONGTEXT", 15), DATE("DATE", 16), DATETIME("DATETIME", 17), TIMESTAMP("TIMESTAMP", 18), TIME("TIME", 19), YEAR("YEAR", 19), BINARY("BINARY", 20), VARBINARY("VARBINARY", 21), TINYBLOB("TINYBLOB", 22), BLOB("BLOB", 23), MEDIUMBLOB("MEDIUMBLOB", 24), LONGBLOB("LONGBLOB", 25);|
|**parameterModeEnum**|String|参数模式，IN("IN", 0), OUT("OUT", 1), INOUT("INOUT", 2);|
|**value**|String|函数调用时传入值;|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
