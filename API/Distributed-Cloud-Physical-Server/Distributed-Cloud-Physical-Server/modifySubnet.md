# modifySubnet


## 描述
修改子网

## 请求方式
POST

## 请求地址
https://edcps.jdcloud-api.com/v1/regions/{regionId}/subnets/{subnetId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeEdCPSRegions）获取分布式云物理服务器支持的地域|
|**subnetId**|String|True| |子网ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |名称|
|**description**|String|False| |描述|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|String| |

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**subnet**|[Subnet](#subnet)|子网详细信息|
### <div id="Subnet">Subnet</div>
|名称|类型|描述|
|---|---|---|
|**region**|String|地域代码, 如cn-east-tz1|
|**az**|String|可用区, 如cn-east-tz1a|
|**subnetId**|String|子网ID|
|**name**|String|子网名称|
|**cidr**|String|子网CIDR|
|**secondaryCidrName**|String|子网次要CIDR名称|
|**secondaryCidr**|String|子网次要CIDR|
|**secondaryCidrId**|String|子网次要CIDR ID|
|**vpcId**|String|私有网络Id|
|**vpcName**|String|私有网络名称|
|**vpcCidr**|String|私有网络IPv4 CIDR|
|**availableIpCount**|Integer|可用ip数量|
|**totalIpCount**|Integer|总ip数量|
|**usedIpv6IpCount**|Integer|已用IPv6地址数量|
|**totalIpv6IpCount**|String|总IPv6地址数量|
|**networkType**|String|网络类型|
|**ipv6Cidr**|String|私有网络IPv6 CIDR|
|**isIpv6Open**|Integer|是否开启Ipv6，1：开启，0：未开启|
|**description**|String|描述|
|**createTime**|String|创建时间|
|**vpcIpv6Cidr**|String|私有网络IPv6 CIDR|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
