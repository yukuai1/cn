# describeIpv6AddressIsBindAliasIps


## 描述
检查Ipv6地址是否已经绑定别名IP；返回true则代表绑定了。

## 请求方式
GET

## 请求地址
https://edcps.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}:describeIpv6AddressIsBindAliasIps

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeEdCPSRegions）获取分布式云物理服务器支持的地域|
|**instanceId**|String|True| |分布式云物理服务器ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ipv6Address**|String|True| |ipv6 address|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|String| |

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**success**|Boolean|结果|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
