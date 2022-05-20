# createMigration


## 描述
创建一个迁移任务，指定并校验迁移配置

## 请求方式
POST

## 请求地址
https://rdts.jdcloud-api.com/v2/regions/{regionId}/instance

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |迁移任务所在区域的Region ID。华北-北京(cn-north-1)，华东-上海(cn-east-2)，华南-广州(cn-south-1)|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**migrateConfig**|[MigrateConfig](createmigration#migrateconfig)|True| |迁移配置，创建成功后可修改|
|**azAndNetConfig**|[AzAndNetConfig](createmigration#azandnetconfig)|False| |可用区与网络配置，创建成功后不能修改|

### <div id="azandnetconfig">AzAndNetConfig</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**azId**|String|False| |可用区，可选目的端实例的主节点可用区、或目的端实例的从节点可用区，空表示使用目的端实例的主节点可用区|
|**vpcId**|String|False| |vpc ID，必须与目的端实例所在vpc保持一致，否则网络不通，空表示使用目的端实例vpc|
|**subnetId**|String|False| |subnet ID，可以与目的端实例所在子网保持一致，如果该子网IP不足可选其他相通的子网，空表示使用目的端实例子网|
### <div id="migrateconfig">MigrateConfig</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |迁移任务名|
|**srcType**|String|True| |源端类型，可选：jimdb表示jimdb；jcloud表示京东云redis；native_standalone表示原生redis standalone；native_cluster表示原生redis cluster|
|**srcUrl**|String|True| |源端统一访问地址，jimdb形如jim://234234234423/3423；京东云redis、原生redis形如host:port，port默认为6379|
|**srcVersion**|String|False| |源端版本，可选：2.8、3.0、3.2、4.0、5.0、6.0、6.2，目前只支持2.8、3.0、4.0|
|**srcTopo**|[Topo[]](createmigration#topo)|False| |源端拓扑，原生cluster必须输入，其他类型不需要|
|**srcPwd**|String|True| |源端连接密码|
|**tgtType**|String|True| |目的端类型，暂不支持jimdb，可选：jcloud，native_standalone|
|**tgtUrl**|String|True| |目的端统一访问地址，形如host:port，port默认为6379|
|**tgtPwd**|String|True| |目的端连接密码|
|**exExpTimeInMin**|Integer|False| |过期时间（单位分钟），可选，0表示默认值|
|**proxyNum**|Integer|False| |代理个数，可选，默认的1分片为2个，n分片为n个|
### <div id="topo">Topo</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**master**|[Node](createmigration#node)|True| |master节点|
|**slaves**|[Node[]](createmigration#node)|True| |slave节点列表|
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
|**result**|[Result](createmigration#result)|结果|
|**requestId**|String|本次请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**instanceId**|String|迁移任务ID|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
