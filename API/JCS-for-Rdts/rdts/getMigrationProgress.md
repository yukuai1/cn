# getMigrationProgress


## 描述
查询迁移进度及数据校验状态

## 请求方式
POST

## 请求地址
https://rdts.jdcloud-api.com/v2/regions/{regionId}/instance/{instanceId}:getMigrationProgress

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |迁移任务所在区域的Region ID。华北-北京(cn-north-1)，华东-上海(cn-east-2)，华南-广州(cn-south-1)|
|**instanceId**|String|True| |迁移任务的唯一标识|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](getmigrationprogress#result)|结果|
|**requestId**|String|本次请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**migrationProgress**|[MigrateProgress](getmigrationprogress#migrateprogress)|迁移进度|
### <div id="migrateprogress">MigrateProgress</div>
|名称|类型|描述|
|---|---|---|
|**sourceKeysCount**|Long|源端key数量，即key总数量|
|**targetKeysCount**|Long|目的端key数量，即已迁移的key数量|
|**percent**|Float|迁移key数量百分比|
|**checkPhase**|String|数据校验状态（CheckPhaseInit：初始化，CheckPhaseRunning：检验中，CheckPhaseFinished：验证完成）|
|**startTime**|String|迁移启动时间(ISO 8601标准的UTC时间，格式为：YYYY-MM-DDTHH:mm:ssZ)|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
