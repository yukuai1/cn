# describeElasticIpStockEnough


## 描述
物理机创建页-验证deviceType库存是否充足

## 请求方式
GET

## 请求地址
https://edcps.jdcloud-api.com/v1/regions/{regionId}/describeElasticIpStockEnough

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeEdCPSRegions）获取分布式云物理服务器支持的地域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**az**|String|False| |az|
|**deviceType**|String|False| |device type|


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
|**available**|Integer|可用弹性公网IP库存|
|**availableBandwidth**|Integer|可用带宽库存|
|**availableExtraUplinkBandwidth**|Integer|可用额外上行带宽库存|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
