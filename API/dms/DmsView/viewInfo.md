# viewInfo


## 描述
获取视图详情

## 请求方式
POST

## 请求地址
https://dms.jdcloud-api.com/v1/regions/{regionId}/view:info

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域代码，取值范围参见[《各地域及可用区对照表》](../Enum-Definitions/Regions-AZ.md)|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**dataSourceId**|Integer|True| |数据源id|
|**dbName**|String|True| |数据库名称。|
|**viewName**|String|True| |视图名称。|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](viewinfo#result)| |
|**requestId**|[String](viewinfo#result)|请求id|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**dbName**|String|数据库名称。|
|**viewName**|String|视图名称。|
|**definer**|String|定义者。|
|**viewAlgorithm**|String|算法。|
|**viewCheckOption**|String|检查选项。|
|**viewSecurity**|String|安全性。|
|**definitionSql**|String|视图定义。|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
