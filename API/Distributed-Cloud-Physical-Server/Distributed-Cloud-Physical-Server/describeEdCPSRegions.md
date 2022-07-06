# describeEdCPSRegions


## 描述
查询分布式分布式云物理服务器地域列表

## 请求方式
GET

## 请求地址
https://edcps.jdcloud-api.com/v1/edgeRegions


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**networkType**|String|False| |网络类型basic（基础网络）、vpc（私有网络）、retail（零售中台网络）和custom, 默认basic|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|String| |

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**regions**|[Region[]](#region)| |
### <div id="Region">Region</div>
|名称|类型|描述|
|---|---|---|
|**region**|String|地域代码, 如 cn-east-tz1|
|**regionName**|String|地域名称，如 华东-台州|
|**azs**|[Az[]](#az)|可用区列表|
### <div id="Az">Az</div>
|名称|类型|描述|
|---|---|---|
|**region**|String|地域代码，如 cn-east-tz1|
|**az**|String|可用区代码，如 cn-east-tz1a|
|**azName**|String|可用区名称|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
