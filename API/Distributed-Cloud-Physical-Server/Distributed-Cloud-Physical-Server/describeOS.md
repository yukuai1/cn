# describeOS


## 描述
查询分布式云物理服务器支持的操作系统

## 请求方式
GET

## 请求地址
https://edcps.jdcloud-api.com/v1/regions/{regionId}/os

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeEdCPSRegions）获取分布式云物理服务器支持的地域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**deviceType**|String|True| |实例类型，可调用接口（describeDeviceTypes）获取指定地域的实例类型，例如：edcps.c.normal1|
|**osType**|String|False| |操作系统类型，取值范围：CentOS、Ubuntu|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|String| |

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**oss**|[Os[]](#os)| |
### <div id="Os">Os</div>
|名称|类型|描述|
|---|---|---|
|**osTypeId**|String|操作系统系统类型ID|
|**osName**|String|操作系统系统名称, 如 Ubuntu 16.04(x86_64)|
|**osType**|String|操作系统类型, 如 ubuntu/centos|
|**osVersion**|String|操作系统版本, 如 14.04/16.04|
|**deviceType**|String|实例类型, 如 cps.c.normal|
|**format**|String|镜像类型, 如 qcow2/tar|
|**source**|String|common,customize|
|**sourceName**|String|通用镜像,定制镜像|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
