# describeStatusGraph


## 描述
高防返回客户端状态码报表

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/charts:statusGraph

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 ID, 高防不区分区域, 传 cn-north-1 即可|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**startTime**|String|True| |开始时间, 只能查询最近 7 天以内的数据, UTC 时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|
|**endTime**|String|False|当前时间|查询的结束时间, UTC 时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|
|**instanceId**|String[]|False| |高防实例 Id 列表|
|**subDomain**|String[]|False| |规则域名列表|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](describestatusgraph#result)| |
|**requestId**|String| |
|**error**|[Error](describestatusgraph#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](describestatusgraph#err)| |
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
|**status500**|Long[]|状态码500|
|**status502**|Long[]|状态码502|
|**status504**|Long[]|状态码504|
|**status590**|Long[]|状态码590|
|**status592**|Long[]|状态码592|
|**status594**|Long[]|状态码594|
|**status5xx**|Long[]|除以上状态码以外, 其他5xx的状态码|
|**time**|String[]|时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
