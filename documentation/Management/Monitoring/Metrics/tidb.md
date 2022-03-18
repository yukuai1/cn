# 分布式数据库 TiDB

该产品线监控数据的servicecode：tidb ，其提供的监控指标如下：

## 一、前端展示指标
|metric中文展示名称|metric英文展示名称|code|type|downsample-aggregator|grouping-aggregator|变化率展示|tags(必须/不必须)|间隔|上报单位|monitor展示单位|单位转换公式(convertFrom/convertTo)|是否前端展示|是否可用于创建告警规则|创建报警规则的特殊需求|
|-|:--|:-:|:-:|:-:|:-:|:-|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|已用存储空间大小|Current storage size|tidb.type_storage_size.pd_cluster_status|时刻|avg|none|N|type(storage_size):Y|60s|GB|GB|1|Y|Y|无|
|存储空间大小|Current storage capacity|tidb.type_storage_capacity.pd_cluster_status|时刻|avg|none|N|type(storage_capacity):Y|60s|GB|GB|1|Y|N|无|
|每个TiDB连接数|Connection Count|tidb.component_tidb.server_connections|时刻|avg|avg|N|component(tidb):Y;podname:Y(groupBy=true)|60s|个|个|1|Y|N|无|
|每秒事务执行数量|Transaction OPS|tidb.session_transaction_duration_seconds_count|时刻|avg|avg|Y||60s|个|个|1|Y|N|无|
|SQL执行数量(插入)|Statement OPS(insert)|tidb.type_Insert.executor_statement_total|时刻|avg|avg|Y|type(Insert):Y|60s|个|个|1|Y|N|无|
|SQL执行数量(删除)|Statement OPS(delete)|tidb.type_Delete.executor_statement_total|时刻|avg|avg|Y|type(Delete):Y|60s|个|个|1|Y|N|无|
|SQL执行数量(更新)|Statement OPS(update)|tidb.type_Update.executor_statement_total|时刻|avg|avg|Y|type(Update):Y|60s|个|个|1|Y|N|无|
|SQL执行数量(查询)|Statement OPS(select)|tidb.type_Select.executor_statement_total|时刻|avg|avg|Y|type(Select):Y|60s|个|个|1|Y|N|无|
|每秒查询数|QPS|tidb.tidb_executor_statement_total|累计|mimmax|sum|N||60s|个|个|1|Y|Y|无|

## 资源指标

| metric中文展示名称             | metric英文展示名称             | metric名字                                             | 值类型 | 单位转换公式(convertFrom/convertTo) | 是否可用于创建告警规则 | 创建报警规则的特殊需求 | downsample-aggregator | grouping-aggregator | 变化率展示 | tags(必须/不必须)      | 上报时间间隔 | 上报   | monitor展示 | 前端是否展示 | 漏报检查(每小时)预期/阈值 |
| ------------------------------ | ------------------------------ | ------------------------------------------------------ | ------ | ----------------------------------- | ---------------------- | ---------------------- | --------------------- | ------------------- | ---------- | ---------------------- | ------------ | ------ | ----------- | ------------ | ------------------------- |
| CPU使用率                      | CPU Usage                      | tidb_pod_cpu_util                                      | 时刻   |                                     | y                      |                        | avg                   | avg                 | n          | pod                    | 60s          | %      | %           | y            | 60/55                     |
| 内存使用率                     | Memory Usage                   | tidb_pod_memory_usage                                  | 时刻   |                                     | y                      |                        | avg                   | avg                 | n          | pod                    | 60s          | %      | %           | y            | 60/55                     |
| 磁盘使用率                     | Disk Usage                     | tidb_pod_pv_usage                                      | 时刻   |                                     | y                      |                        | avg                   | avg                 | n          | pod                    | 60s          | %      | %           | y            | 60/55                     |
| 磁盘使用量                     | Disk Used                      | tidb_kubelet_volume_stats_used_bytes                   | 时刻   |       1/1024/1024/1024              | y                      |                        | avg                   | avg                 | n          | pod                    | 60s          | Bytes  | GB          | y            | 60/55                     |
| 网络出速率                     | Network Outbound Rate          | tidb_container_network_transmit_bytes_total            | 累计   |        8/1024                       | y                      |                        | avg                   | avg                 | y          | pod                    | 60s          | Bytes  | Kbps        | y            | 60/55                     |
| 网络进速率                     | Network Inbound Rate           | tidb_container_network_receive_bytes_total             | 累计   |        8/1024                       | y                      |                        | avg                   | avg                 | y          | pod                    | 60s          | Bytes  | Kbps        | y            | 60/55                     |
| 网络出包量                     | Network Outbound Packets       | tidb_container_network_transmit_packets_total          | 累计   |                                     | y                      |                        | avg                   | avg                 | y          | pod                    | 60s          | 个     | 个/s        | y            | 60/55                     |
| 网络进包量                     | Network Inbound Packets        | tidb_container_network_receive_packets_total           | 累计   |                                     | y                      |                        | avg                   | avg                 | y          | pod                    | 60s          | 个     | 个/s        | y            | 60/55                     |

