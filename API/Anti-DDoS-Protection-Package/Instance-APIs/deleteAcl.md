# deleteAcl


## 描述
删除实例的访问控制规则. 支持批量操作, 批量操作时 aclId个, 以 ',' 分隔

## 请求方式
DELETE

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/acl/{aclId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id, DDoS 防护包目前支持华北-北京, 华东-宿迁, 华东-上海|
|**instanceId**|String|True| |防护包实例 Id|
|**aclId**|String|True| |访问控制规则 Id|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](deleteacl#result)| |
|**requestId**|String| |
|**error**|[Error](deleteacl#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](deleteacl#err)| |
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
|**data**|[BatchResultDetail](deleteacl#batchresultdetail)| |
### <div id="batchresultdetail">BatchResultDetail</div>
|名称|类型|描述|
|---|---|---|
|**successCount**|Integer|操作成功的资源个数|
|**failed**|[ErrorItem[]](deleteacl#erroritem)|操作失败的资源及原因|
### <div id="erroritem">ErrorItem</div>
|名称|类型|描述|
|---|---|---|
|**id**|String|出错资源ID|
|**code**|Long|错误码，同标准code|
|**details**|Object| |
|**message**|String| |
|**status**|String|具体错误，同标准status|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
