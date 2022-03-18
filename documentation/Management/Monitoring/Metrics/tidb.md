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
|~~每秒查询数~~|~~QPS~~|~~tidb.result_OK.server_query_total~~|~~时刻~~|~~avg~~|~~avg~~|~~Y~~|~~result(OK):Y~~|60s|个|个|1|Y|N|无|
|每秒查询数|QPS|tidb.tidb_executor_statement_total|累计|mimmax|sum|N||60s|个|个|1|Y|Y|无|

## 资源指标

| metric中文展示名称             | metric英文展示名称             | metric名字                                             | 值类型 | 单位转换公式(convertFrom/convertTo) | 是否可用于创建告警规则 | 创建报警规则的特殊需求 | downsample-aggregator | grouping-aggregator | 变化率展示 | tags(必须/不必须)      | 上报时间间隔 | 上报   | monitor展示 | 前端是否展示 | 漏报检查(每小时)预期/阈值 |
| ------------------------------ | ------------------------------ | ------------------------------------------------------ | ------ | ----------------------------------- | ---------------------- | ---------------------- | --------------------- | ------------------- | ---------- | ---------------------- | ------------ | ------ | ----------- | ------------ | ------------------------- |
| CPU使用率                      | CPU Usage                      | tidb_pod_cpu_util                                      | 时刻   |                                     | y                      |                        | avg                   | avg                 | n          | pod                    | 60s          | %      | %           | y            | 60/55                     |
| 内存使用率                     | Memory Usage                   | tidb_pod_memory_usage                                  | 时刻   |                                     | y                      |                        | avg                   | avg                 | n          | pod                    | 60s          | %      | %           | y            | 60/55                     |
| 磁盘使用率                     | Disk Usage                     | tidb_pod_pv_usage                                      | 时刻   |                                     | y                      |                        | avg                   | avg                 | n          | pod                    | 60s          | %      | %           | y            | 60/55                     |
| 磁盘使用量                     | Disk Used                      | tidb_kubelet_volume_stats_used_bytes                   | 时刻   |       1/1024/1024/1024              | y                      |                        | avg                   | avg                 | n          | pod                    | 60s          | Bytes  | GB          | y            | 60/55                     |
| ~~磁盘读吞吐量~~                   | ~~Disk Read Throughput~~           | ~~tidb_volume_bytes_read~~                                 | 时刻   |       1/1024/1024                   | n                      |                        | avg                   | avg                 | n          | pod                    | 60s          | Bps    | MBps        | n            | 60/55                     |
| ~~磁盘写吞吐量~~                   | ~~Disk Write Throughput~~          | ~~tidb_volume_bytes_write~~                                | 时刻   |       1/1024/1024                   | n                      |                        | avg                   | avg                 | n          | pod                    | 60s          | Bps    | MBps        | n            | 60/55                     |
| ~~磁盘读取IOPS~~                   | ~~Disk Read IOPS~~                 | ~~tidb_volume_io_read~~                                    | 时刻   |                                     | n                      |                        | avg                   | avg                 | n          | pod                    | 60s          | 个/s   | 个/s        | n            | 60/55                     |
| ~~磁盘写入IOPS~~                   | ~~Disk Write IOPS~~               | ~~tidb_volume_io_write~~                                   | 时刻   |                                     | n                      |                        | avg                   | avg                 | n          | pod                    | 60s          | 个/s   | 个/s        | n            | 60/55                     |
| 网络出速率                     | Network Outbound Rate          | tidb_container_network_transmit_bytes_total            | 累计   |        8/1024                       | y                      |                        | avg                   | avg                 | y          | pod                    | 60s          | Bytes  | Kbps        | y            | 60/55                     |
| 网络进速率                     | Network Inbound Rate           | tidb_container_network_receive_bytes_total             | 累计   |        8/1024                       | y                      |                        | avg                   | avg                 | y          | pod                    | 60s          | Bytes  | Kbps        | y            | 60/55                     |
| 网络出包量                     | Network Outbound Packets       | tidb_container_network_transmit_packets_total          | 累计   |                                     | y                      |                        | avg                   | avg                 | y          | pod                    | 60s          | 个     | 个/s        | y            | 60/55                     |
| 网络进包量                     | Network Inbound Packets        | tidb_container_network_receive_packets_total           | 累计   |                                     | y                      |                        | avg                   | avg                 | y          | pod                    | 60s          | 个     | 个/s        | y            | 60/55                     |

## 二、多指标同一图展示（没有此需求的可以不填写）

| 监控图展示名称中文 | 监控图展示名称英文 | 监控图展示单位中文（需和metric单位一致） | 监控图展示单位英文（需和metric单位一致） | 监控图包含的metric |
| ------------------ | ------------------ | ---------------------------------------- | ---------------------------------------- | ------------------ |
|   SQL执行数量     |      Statement OPS |            Count/s                   |             Count/s                 |    tidb.insert.tidb_executor_statement_total, tidb.delete.tidb_executor_statement_total, tidb.update.tidb_executor_statement_total, tidb.select.tidb_executor_statement_total|
|磁盘读/写吞吐量|Disk Read/Write Throughput|Bps|Bps|tidb_volume_bytes_read、tidb_volume_bytes_write|
|磁盘读/写IOPS|Disk Read/Write Requests|个/s|Count/s|tidb_volume_io_read、tidb_volume_io_write|
|网络进/出速率|Network Inbound/Outbound Rate|bps|bps|tidb_container_network_transmit_bytes_total、tidb_container_network_receive_bytes_total|
|网络进/出数据包|Network Inbound/Outbound Data Packets|个/s|Count/s|tidb_container_network_transmit_packets_total、tidb_container_network_receive_packets_total|

## 三、metric分组情况（没有此需求的可以不填写）

1.metric分组层级信息（主要描述分组之间的层级关系，**groupCode**是一个metric分组的标识，不能重复。）

| 分组groupCode（一级） | 分组groupCode（二级，若存在） | 包含的metric                                   | 查询所需tag                      |
| --------------------- | ------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| tidb-instance                 | -                       | tidb.tidb_executor_statement_total | 无 |
| tidb-tidb | - | tidb.tidb_server_connections | kubernetes_pod_name |
|tidb-node|-|-|pod|



