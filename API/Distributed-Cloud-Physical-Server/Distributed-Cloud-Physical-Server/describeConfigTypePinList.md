# describeConfigTypePinList


## 描述
获取当前用户pin下合法的device类型列表

## 请求方式
GET

## 请求地址
https://edcps.jdcloud-api.com/v1/regions/{regionId}/describeConfigTypePinList

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeRegiones）获取云物理服务器支持的地域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**type**|String|False| |区分类型|
|**uuid**|String|False| |具体类型|
|**status**|String|False| |黑白状态：black/white|
|**filters**|[Filter[]](#filter)|False| |pin，精确匹配，支持多个|

### <div id="Filter">Filter</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤条件的名称|
|**operator**|String|False| |过滤条件的操作符，默认eq|
|**values**|String[]|True| |过滤条件的值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|String| |

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**list**|[ConfigTypePin[]](#configtypepin)| |
### <div id="ConfigTypePin">ConfigTypePin</div>
|名称|类型|描述|
|---|---|---|
|**region**|String|地域代码, 如 cn-north-1|
|**typeId**|String|一级类型|
|**uuid**|String|二级类型|
|**pin**|String|用户pin|
|**status**|String|黑白状态：black/white|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
