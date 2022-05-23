# describeMigration


## 描述
查询迁移任务详情

## 请求方式
GET

## 请求地址
https://rdts.jdcloud-api.com/v2/regions/{regionId}/instance/{instanceId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |迁移任务所在区域的Region ID。华北-北京(cn-north-1)，华东-上海(cn-east-2)，华南-广州(cn-south-1)|
|**instanceId**|String|True| |迁移任务的唯一标识|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](describemigration#result)|结果|
|**requestId**|String|本次请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**instance**|[Instance](describemigration#instance)|迁移任务详请|
### <div id="instance">Instance</div>
|名称|类型|描述|
|---|---|---|
|**instanceId**|String|迁移任务ID|
|**migrationName**|String|迁移任务名|
|**migrationStatus**|String|迁移状态（creating：创建中，validated：验证通过，invalid：验证失败，starting：启动中，waitMigrate：待迁移，migrating：迁移中，migrated：迁移成功，createFailed：创建失败，startFailed：启动失败，migrateFailed：迁移失败，error：异常错误，deleting：删除中，migrateTimeout：迁移超时)|
|**proxyDomain**|String|迁移代理域名|
|**proxyPassword**|String|迁移代理连接密码|
|**currentStep**|String|当前迁移步骤|
|**currentStepStatus**|String|当前迁移步骤状态（init：初始化，running：运行中，success：成功，fail：失败）|
|**failedReason**|String|迁移失败原因|
|**source**|[RedisConfig](describemigration#redisconfig)|源端redis实例配置信息|
|**target**|[RedisConfig](describemigration#redisconfig)|目的端redis实例配置信息|
|**region**|String|地域|
|**createdTime**|String|创建时间(ISO 8601标准的UTC时间，格式为：YYYY-MM-DDTHH:mm:ssZ)|
### <div id="redisconfig">RedisConfig</div>
|名称|类型|描述|
|---|---|---|
|**instanceType**|String|redis实例类型|
|**version**|String|redis引擎版本|
|**url**|String|redis实例访问地址|
|**instanceId**|String|redis实例ID，jimdb的instanceId为url|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
