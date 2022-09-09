# generalCreateFunction


## 描述
生产创建函数过程SQL语句，支持Mysql

## 请求方式
POST

## 请求地址
https://dms.jdcloud-api.com/v1/regions/{regionId}/function:generalCreate

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域代码，取值范围参见[《各地域及可用区对照表》](../Enum-Definitions/Regions-AZ.md)|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**dataSourceId**|Integer|True| |数据源id。|
|**dbName**|String|True| |数据库名称。|
|**functionName**|String|True| |函数名称。|
|**functionSecurity**|String|True| |安全性，DEFAULT("DEFAULT", 1),DEFINER("DEFINER", 2), INVOKER("INVOKER", 3);|
|**dataAccess**|String|True| |数据访问，DEFAULT("DEFAULT", 1),NO_SQL("NO_SQL", 2), CONTAINS_SQL("CONTAINS_SQL", 3), READS_SQL_DATA("READS_SQL_DATA", 4), MODIFIES_SQL_DATA("MODIFIES_SQL_DATA", 5);|
|**deterministic**|Boolean|True| |确定性。|
|**definitionSql**|String|True| |函数定义SQL。|
|**parameters**|[Parameter[]](#parameter)|False| |参数列表。|
|**definer**|String|False| |定义者。|
|**comment**|String|False| |注释。|
|**returnType**|String|True| |返回值类型，TINYINT("TINYINT", 0), SMALLINT("SMALLINT", 1), MEDIUMINT("MEDIUMINT", 2), INT("INT", 3), BIGINT("BIGINT", 4), INTEGER("INTEGER", 5), FLOAT("FLOAT", 6), DOUBLE("DOUBLE", 7), REAL("REAL", 8), DECIMAL("DECIMAL", 9), CHAR("CHAR", 10), VARCHAR("VARCHAR", 11), TINYTEXT("TINYTEXT", 12), TEXT("TEXT", 13), MEDIUMTEXT("MEDIUMTEXT", 14), LONGTEXT("LONGTEXT", 15), DATE("DATE", 16), DATETIME("DATETIME", 17), TIMESTAMP("TIMESTAMP", 18), TIME("TIME", 19), YEAR("YEAR", 19), BINARY("BINARY", 20), VARBINARY("VARBINARY", 21), TINYBLOB("TINYBLOB", 22), BLOB("BLOB", 23), MEDIUMBLOB("MEDIUMBLOB", 24), LONGBLOB("LONGBLOB", 25);|
|**returnLength**|Integer|True| |返回值长度。|

### <div id="Parameter">Parameter</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |参数名称。|
|**columnTypeEnum**|String|True| |列类型，TINYINT("TINYINT", 0), SMALLINT("SMALLINT", 1), MEDIUMINT("MEDIUMINT", 2), INT("INT", 3), BIGINT("BIGINT", 4), INTEGER("INTEGER", 5), FLOAT("FLOAT", 6), DOUBLE("DOUBLE", 7), REAL("REAL", 8), DECIMAL("DECIMAL", 9), CHAR("CHAR", 10), VARCHAR("VARCHAR", 11), TINYTEXT("TINYTEXT", 12), TEXT("TEXT", 13), MEDIUMTEXT("MEDIUMTEXT", 14), LONGTEXT("LONGTEXT", 15), DATE("DATE", 16), DATETIME("DATETIME", 17), TIMESTAMP("TIMESTAMP", 18), TIME("TIME", 19), YEAR("YEAR", 19), BINARY("BINARY", 20), VARBINARY("VARBINARY", 21), TINYBLOB("TINYBLOB", 22), BLOB("BLOB", 23), MEDIUMBLOB("MEDIUMBLOB", 24), LONGBLOB("LONGBLOB", 25);|
|**parameterModeEnum**|String|True| |参数模式，IN("IN", 0), OUT("OUT", 1), INOUT("INOUT", 2);|
|**value**|String|True| |函数调用时传入值;|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|[String](#result)|请求id|

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**dmsSqls**|[DmsSql[]](#dmssql)|查询结果。|
### <div id="DmsSql">DmsSql</div>
|名称|类型|描述|
|---|---|---|
|**sql**|String|SQL语句。|
|**sqlTypeEnum**|String|SQL类型：CREATE_VIEW，DROP_VIEW， ALTER_VIEW，CREATE_PROCEDURE，DROP_PROCEDURE， ALTER_PROCEDURE，CREATE_FUNCTION，DROP_FUNCTION， ALTER_FUNCTION，CREATE_TRIGGER，ALTER_TRIGGER，DROP_TRIGGER，CREATE_EVENT，ALTER_EVENT，DROP_EVENT。|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
