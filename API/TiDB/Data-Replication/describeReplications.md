# describeReplications


## 描述
查看TiCDC复制任务列表

## 请求方式
GET

## 请求地址
https://tidb.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/replications

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域代码|
|**instanceId**|String|True| |实例ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|[String](#result)|请求id|

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**totalCount**|Integer|总记录数|
|**replications**|[ReplicationTask[]](#replicationtask)| |
### <div id="ReplicationTask">ReplicationTask</div>
|名称|类型|描述|
|---|---|---|
|**taskId**|String|复制任务ID|
|**targetType**|String|目标实例类型|
|**replicationObjects**|String|复制的对象，格式为"库名.表名”，支持?* 通配符，例如 db1.* 、 db2.tab? ，*.* 表示复制整个实例|
|**targetIP**|String|目标实例IP|
|**targetPort**|String|目标实例端口|
|**targetUser**|String|目标类型为TiDB或MySQL时，连接目标实例的用户名|
|**kafkaTopic**|String|Kafka的Topic|
|**kafkaVersion**|String|Kafka的版本|
|**targetComment**|String|目标实例备注说明|
|**taskStatus**|String|任务状态|
|**startTime**|String|复制的起始时间|
|**checkpointTime**|String|Checkpoint时间|
|**createTime**|String|任务创建时间|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
