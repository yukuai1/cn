# describeAvailablePrivateIp


## 描述
查询可用的私有IP列表

## 请求方式
GET

## 请求地址
https://edcps.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/availablePrivateIps

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeEdCPSRegions）获取分布式云物理服务器支持的地域|
|**instanceId**|String|True| |分布式云物理服务器ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**subnetId**|String|True| |主网口或者辅网口的子网id|
|**channel**|String|True| |查询可用目标内网IP地址的渠道；eip：绑定EIP时调此接口；vmsg：添加虚拟服务组时调此接口|
|**ipType**|String|True| |ipv4 or ipv6|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|String| |

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**availablePrivateIps**|String[]|可用私有IP集合|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
