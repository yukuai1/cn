# createReplication


## 描述
创建一个TiCDC

## 请求方式
POST

## 请求地址
https://tidb.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/replications

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域代码|
|**instanceId**|String|True| |实例ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**replication**|[ReplicationSpec](#replicationspec)|True| |新建TiCDC复制任务|

### <div id="ReplicationSpec">ReplicationSpec</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**startTS**|String|False| |复制的起始时间戳|
|**replicationObjects**|String[]|False| |要复制的对象列表|
|**targetType**|String|False| |目标实例类型|
|**targetIP**|String|False| |目标实例IP|
|**targetPort**|String|False| |目标实例端口|
|**targetComment**|String|False| |目标实例备注说明|
|**targetUser**|String|False| |目标类型为TiDB或MySQL时，连接目标实例的用户名|
|**targetPassword**|String|False| |目标类型为TiDB或MySQL时，连接目标实例的密码|
|**kafkaTopic**|String|False| |Kafka的Topic|
|**kafkaVersion**|String|False| |Kafka的版本|
|**kafkaProtocol**|String|False| |消息的格式|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**replicationId**|String| |
|**requestId**|String|请求id|


## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
