# verifyUserQuota


## 描述
校验配额

## 请求方式
POST

## 请求地址
https://quota.jdcloud-api.com/v2/regions/{regionId}/userQuota:verify

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pin**|String|True| |用户pin|
|**serviceCode**|String|True| |资源产品线|
|**region**|String|True| |地域|
|**parentResourceId**|String|False| |父层资源id（针对有两层结构的服务）|
|**quotaAmount**|Integer|True| |配额数量|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**success**|Boolean| |
|**code**|Integer| |
|**message**|String| |
|**data**|[UserQuotaResVo](#userquotaresvo)| |
|**requestId**|String| |
### <div id="UserQuotaResVo">UserQuotaResVo</div>
|名称|类型|描述|
|---|---|---|
|**pin**|String|用户pin|
|**serviceCode**|String|产品线|
|**region**|String|地域|
|**verifyResult**|Boolean|校验结果,[已使用配额，大于等于配额总量，false]，[已使用配额，小于配额总量，返回true]|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
