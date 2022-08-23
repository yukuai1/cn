# describeElasticIpStock


## 描述
查询弹性公网IP库存

## 请求方式
GET

## 请求地址
https://edcps.jdcloud-api.com/v1/regions/{regionId}/elasticIpStock

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeEdCPSRegions）获取分布式云物理服务器支持的地域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**lineType**|String|False| |BGP|UN联通|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|String| |

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**region**|String|地域|
|**az**|String|az|
|**deviceType**|String|device type|
|**available**|Integer|可用弹性公网IP库存|
|**availableBandwidth**|Integer|可用带宽库存|
|**availableExtraUplinkBandwidth**|Integer|可用额外上行带宽库存|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
