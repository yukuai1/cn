# describeConnStatGraph


## 描述
新建与并发连接数统计报表        
参数 serviceIp 优先级大于 instanceId.
- 指定 serviceIp 参数时, 忽略 instanceId 参数, 查询 ip 相关报表
- 未指定 serviceIp 时, 查询 instanceId 指定实例相关报表
- serviceIp 和 instanceId 均未指定时, 查询用户所有实例报表


## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/charts:connStatGraph

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 ID, 高防不区分区域, 传 cn-north-1 即可|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**startTime**|String|True| |开始时间, 只能查询最近 90 天以内的数据, UTC 时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|
|**endTime**|String|False|当前时间|查询的结束时间, UTC 时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|
|**instanceId**|String[]|False| |高防实例 Id 列表|
|**serviceIp**|String[]|False| |高防IP列表. <br>- 使用 <a href='http://docs.jdcloud.com/anti-ddos-pro/api/describeServiceIpList'>describeServiceIpList</a> 接口查询实例的高防 IP|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](describeconnstatgraph#result)| |
|**requestId**|String| |
|**error**|[Error](describeconnstatgraph#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](describeconnstatgraph#err)| |
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
|**newConn**|Long[]|新建连接数|
|**activeConn**|Long[]|并发活跃连接数|
|**inactiveConn**|Long[]|并发非活跃连接数|
|**time**|String[]|时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
