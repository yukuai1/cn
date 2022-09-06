# modifyReplication


## 描述
修改复制任务

## 请求方式
POST

## 请求地址
https://tidb.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/replications/{taskId}:modifyReplication

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域代码|
|**instanceId**|String|True| |实例ID|
|**taskId**|String|True| |复制任务ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**taskId**|String|True| |复制任务ID|
|**targetComment**|String|False| |目标实例备注说明|
|**targetUser**|String|False| |目标类型为TiDB或MySQL时，连接目标实例的用户名|
|**targetPassword**|String|False| |目标类型为TiDB或MySQL时，连接目标实例的密码|
|**kafkaTopic**|String|False| |Kafka的Topic|
|**kafkaVersion**|String|False| |Kafka的版本|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求id|


## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
