# checkTagResources


## 描述
校验资源是否可以打标

## 请求方式
POST

## 请求地址
https://edcps.jdcloud-api.com/v1/regions/{regionId}/instances:checkTagResources

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeEdCPSRegions）获取分布式云物理服务器支持的地域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**resourceIds**|String[]|False| | |


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|String| |

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**success**|String[]|可以打标的资源id列表|
|**failed**|String[]|不可以打标的资源id列表|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
