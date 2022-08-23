# checkSubnet


## 描述
前端检查子网的cidr/ipv6 cidr等相关信息正确性

## 请求方式
GET

## 请求地址
https://edcps.jdcloud-api.com/v1/regions/{regionId}/checkSubnet

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeEdCPSRegions）获取分布式云物理服务器支持的地域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**az**|String|False| |可用区，精确匹配|
|**vpcId**|String|False| |私有网络ID，精确匹配|
|**cidr**|String|False| |ipv4 cidr|
|**ipv6Cidr**|String|False| |ipv6 cidr|
|**secondaryCidr**|String|False| |secondary cidr|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|String| |

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**success**|Boolean|删除操作是否成功|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
