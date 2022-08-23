# describeAg


## 描述
根据 id 查询高可用组详情

## 请求方式
GET

## 请求地址
https://ag.jdcloud-api.com/v1/regions/{regionId}/availabilityGroups/{agId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域|
|**agId**|String|True| |高可用组 ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**ag**|AvailabilityGroup| |
### AvailabilityGroup
|名称|类型|描述|
|---|---|---|
|**id**|String|可用组id|
|**name**|String|可用组name|
|**description**|String|描述，length:0-256|
|**instanceTemplateId**|String|实例模板的Id|
|**azs**|String[]|可用区域|
|**agType**|String|可用组类型，支持vm|
|**createTime**|String|创建时间|
|**count**|Number|可用组中实例的数量|
|**autoScaling**|Boolean|是否开启自动伸缩|
|**configurationType**|String|高可用组配置类型|
|**placementType**|String|高可用组中资源的放置类型|
|**instancesQuotas**|[InstancesQuota[]](#instancesquota)|高可用组中实例数量的限制。仅placement为host或switch的高可用组有此限制|

### <div id="InstancesQuota">InstancesQuota</div>
|名称|类型|描述|
|---|---|---|
|**az**|String|可用区|
|**limit**|Integer|配额上限|
|**used**|Integer|已用配额|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
