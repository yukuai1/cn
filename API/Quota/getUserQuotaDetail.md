## 描述
查询用户配额 

## 请求方式
POST

## 请求地址
https://quota.jdcloud-api.com/v2/regions/{regionId}/userQuota:getDetail

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
|**id**|Long| |
|**pin**|String|用户pin|
|**appCode**|String|业务线|
|**serviceCode**|String|产品线|
|**serviceName**|String|产品线名称|
|**region**|String|地域|
|**regionName**|String|地域名称|
|**userQuota**|Integer|用户该地域该资源下的配额值|
|**maxUserQuota**|Integer|用户该地域该资源下的最大可用配额值|
|**expireTime**|String|配额到期时间|
|**availableQuota**|Integer|可用配额|
|**preOccupyAmount**|Integer|预占配额|
|**createdTime**|String|创建时间|
|**updatedTime**|String|更新时间|
|**resourceId**|String|资源id|
|**parentResourceId**|String|父资源id|
|**productName**|String|产品名称|
|**siteType**|Integer|站点类型|
|**quotaAmount**|Integer|已用配额|
|**quotaBeyondFlag**|Boolean|配额超出标识,[已使用配额，大于等于配额总量，false]，[已使用配额，小于配额总量，返回true]|
|**isSubResource**|String|是否资资源|
|**failReason**|String|失败原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
