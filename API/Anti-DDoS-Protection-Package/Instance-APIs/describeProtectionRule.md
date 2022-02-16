# describeProtectionRule


## 描述
获取防护包实例或 IP 的防护规则

## 请求方式
GET

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}:describeProtectionRule

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id, DDoS 防护包目前支持华北-北京, 华东-宿迁, 华东-上海|
|**instanceId**|String|True| |防护包实例 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ip**|String|False| |被防护 IP, 缺省时获取防护包实例的防护规则|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](describeprotectionrule#result)| |
|**requestId**|String| |
|**error**|[Error](describeprotectionrule#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](describeprotectionrule#err)| |
### <div id="err">Err</div>
|名称|类型|描述|
|---|---|---|
|**code**|Long|同http code|
|**details**|Object| |
|**message**|String| |
|**status**|String|具体错误|
### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**data**|[ProtectionRule](describeprotectionrule#protectionrule)| |
### <div id="protectionrule">ProtectionRule</div>
|名称|类型|描述|
|---|---|---|
|**type**|Integer|防护规则类型. <br>- 0: 默认防护包规则<br>- 1: IP 自定义规则|
|**cleanThresholdBps**|Long|清洗触发值 bps|
|**cleanThresholdPps**|Long|清洗触发值 pps|
|**spoofIpEnable**|Integer|虚假源开启|
|**srcNewConnLimitEnable**|Integer|源新建连接限速开启|
|**srcNewConnLimitValue**|Long|源新建连接速率|
|**dstNewConnLimitEnable**|Integer|目的新建连接开启|
|**dstNewConnLimitValue**|Long|目的新建连接速率|
|**datagramRangeMin**|Long|报文最小长度|
|**datagramRangeMax**|Long|报文最大长度|
|**geoBlackList**|[GeoBlack[]](describeprotectionrule#geoblack)|geo 拦截地域列表|
|**ipBlackList**|String[]|IP 黑名单列表|
|**ipWhiteList**|String[]|IP 白名单列表|
### <div id="geoblack">GeoBlack</div>
|名称|类型|描述|
|---|---|---|
|**label**|String|geo 拦截地域|
|**value**|String|geo 拦截地域编码|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
