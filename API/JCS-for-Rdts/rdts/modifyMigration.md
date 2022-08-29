# modifyMigration


## 描述
修改并验证迁移配置

## 请求方式
PATCH

## 请求地址
https://rdts.jdcloud-api.com/v2/regions/{regionId}/instance/{instanceId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |迁移任务所在区域的Region ID。华北-北京(cn-north-1)，华东-上海(cn-east-2)，华南-广州(cn-south-1)|
|**instanceId**|String|True| |迁移任务的唯一标识|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**migrateConfig**|[MigrateConfig](modifymigration#migrateconfig)|False| |迁移配置参数|

### <div id="migrateconfig">MigrateConfig</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |迁移任务名|
|**srcType**|String|True| |源端类型，可选：jimdb表示jimdb；jcloud表示京东云redis；native_standalone表示原生redis standalone；native_cluster表示原生redis cluster|
|**srcUrl**|String|True| |源端统一访问地址，jimdb形如jim://234234234423/3423；京东云redis、原生redis形如host:port，port默认为6379|
|**srcVersion**|String|False| |源端版本，可选：2.8、3.0、3.2、4.0、5.0、6.0、6.2，目前只支持2.8、3.0、4.0|
|**srcTopo**|[Topo[]](modifymigration#topo)|False| |源端拓扑，原生cluster必须输入，其他类型不需要|
|**srcPwd**|String|True| |源端连接密码|
|**tgtType**|String|True| |目的端类型，暂不支持jimdb，可选：jcloud，native_standalone|
|**tgtUrl**|String|True| |目的端统一访问地址，形如host:port，port默认为6379|
|**tgtPwd**|String|True| |目的端连接密码|
|**exExpTimeInMin**|Integer|False| |过期时间（单位分钟），可选，0表示默认值|
|**proxyNum**|Integer|False| |代理个数，可选，默认的1分片为2个，n分片为n个|
### <div id="topo">Topo</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**master**|[Node](modifymigration#node)|True| |master节点|
|**slaves**|[Node[]](modifymigration#node)|True| |slave节点列表|
|**slotsFrom**|Integer|False| |槽范围起始|
|**slotsTo**|Integer|False| |槽范围终止|
### <div id="node">Node</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**host**|String|True| |host，可以是ip或域名|
|**port**|Integer|True| |端口|
|**password**|String|True| |访问密码|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|本次请求的ID|


## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
