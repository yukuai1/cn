# modifyAclPriority


## 描述
修改访问控制规则优先级

## 请求方式
PATCH

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/acl/{aclId}:modifyAclPriority

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id, DDoS 防护包目前支持华北-北京, 华东-宿迁, 华东-上海|
|**instanceId**|String|True| |防护包实例 Id|
|**aclId**|String|True| |访问控制规则 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**modifyAclPrioritySpec**|[ModifyAclPrioritySpec](modifyaclpriority#modifyaclpriorityspec)|True| |修改访问控制规则请求参数|

### <div id="modifyaclpriorityspec">ModifyAclPrioritySpec</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**priority**|Integer|True| |规则优先级|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |
|**error**|[Error](modifyaclpriority#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](modifyaclpriority#err)| |
### <div id="err">Err</div>
|名称|类型|描述|
|---|---|---|
|**code**|Long|同http code|
|**details**|Object| |
|**message**|String| |
|**status**|String|具体错误|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
