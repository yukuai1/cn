# generalAlterView


## 描述
生成修改视图sql语句

## 请求方式
POST

## 请求地址
https://dms.jdcloud-api.com/v1/regions/{regionId}/view:generalAlter

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域代码，取值范围参见[《各地域及可用区对照表》](../Enum-Definitions/Regions-AZ.md)|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**dataSourceId**|Integer|True| |数据源id|
|**dbName**|String|True| |数据库名称。|
|**viewName**|String|True| |视图名称。|
|**originViewName**|String|True| |原始视图名称。|
|**viewAlgorithm**|String|True| |视图算法，DEFAULT("DEFAULT", 1),UNDEFINED("UNDEFINED", 2), MERGE("MERGE", 3), TEMPTABLE("TEMPTABLE", 4);|
|**definer**|String|False| |定义者。|
|**viewSecurity**|String|True| |安全性，DEFAULT("DEFAULT", 1),DEFINER("DEFINER", 2), INVOKER("INVOKER", 3);|
|**viewCheckOption**|String|True| |检查选项，DEFAULT("DEFAULT", 1),LOCAL("LOCAL", 2), CASCADED("CASCADED", 3);;|
|**definitionSql**|String|True| |视图定义。|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](generalalterview#result)| |
|**requestId**|[String](generalalterview#result)|请求id|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**dmsSqls**|[DmsSql[]](generalalterview#dmssql)|生成sql。|
### <div id="dmssql">DmsSql</div>
|名称|类型|描述|
|---|---|---|
|**sql**|String|SQL语句。|
|**sqlTypeEnum**|String|SQL类型：CREATE_VIEW，DROP_VIEW， ALTER_VIEW，CREATE_PROCEDURE，DROP_PROCEDURE， ALTER_PROCEDURE，CREATE_FUNCTION，DROP_FUNCTION， ALTER_FUNCTION，CREATE_TRIGGER，ALTER_TRIGGER，DROP_TRIGGER，CREATE_EVENT，ALTER_EVENT，DROP_EVENT。|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
