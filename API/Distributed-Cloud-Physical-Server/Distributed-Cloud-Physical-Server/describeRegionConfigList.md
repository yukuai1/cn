# describeRegionConfigList


## 描述
根据region返回region config表记录

## 请求方式
GET

## 请求地址
https://edcps.jdcloud-api.com/v1/regions/{regionId}/describeRegionConfigList

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeRegiones）获取云物理服务器支持的地域|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|String| |

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**regions**|[RegionConfig[]](#regionconfig)| |
### <div id="RegionConfig">RegionConfig</div>
|名称|类型|描述|
|---|---|---|
|**region**|String|地域代码, 如 cn-north-1|
|**configType**|String|类型|
|**configKey**|String|key|
|**configValue**|String|value|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
