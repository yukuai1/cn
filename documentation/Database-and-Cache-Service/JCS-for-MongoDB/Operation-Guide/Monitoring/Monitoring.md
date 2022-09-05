# 查看监控信息

MongoDB控制台提供了丰富的性能监控数据，您可以随时查看实例的运行状态。对于MongoDB的分片集群和副本集群，京东云提供不同的监控维度。



## 操作步骤

1. 登录[MongoDB控制台](https://mongodb-console.jdcloud.com/mongodb)；

2. 在**实例列表**页面筛选目标实例，点击实例名称进入**实例详情**页面；

3. 在上方标签中点击**监控**即可查看监控信息。

   

## 副本集监控项说明

| 监控项              | 说明                                                         |
| ------------------- | ------------------------------------------------------------ |
| CPU使用率           | 实例的CPU利用率。                                            |
| 内存利用率          | 实例的内存利用率。                                           |
| 磁盘使用率          | 实例总使用空间与规格最大可使用空间的比值。                   |
| 主从延迟            | 主从同步延迟                                                 |
| IOPS使用率          | 实例使用IOPS大小与最大可用IOPS的比值                         |
| 连接数使用率        | 目前实例连接数占最大连接数的比率                             |
| connections         | 实例的连接数                                                 |
| network_numRequests | 每秒响应数量                                                 |
| opcounters          | 实例的操作QPS数，包括：<br />insert操作数<br />query操作数<br />delete操作数<br />update操作数<br />getmore操作数<br />command操作数 |
| network             | 实例的网络流量，包括：<br />进口流量<br />出口流量<br />处理的请求数 |
| cursors             | 实例使用的cursor数，包括：<br />当前cursor打开数量<br />cursor超时数量 |
| globalLock          | 实例当前等待全局锁的队列长度，包括：<br />全局读锁的等待队列长度<br />全局写锁的等待队列长度<br />所有全局锁的等待队列长度 |
| wiredTiger          | 实例wiredTiger引擎cache层指标，包括：<br />读入cache的数据量大小<br />从cache写的磁盘大小 |



## 分片集群监控项说明

| 监控项                      | 说明                                                         |
| --------------------------- | ------------------------------------------------------------ |
| CPU使用率                   | 实例的CPU利用率。                                            |
| 内存利用率                  | 实例的内存利用率。                                           |
| 磁盘使用率                  | 实例总使用空间与规格最大可使用空间的比值。                   |
| 主从延迟                    | 主从同步延迟                                                 |
| IOPS使用率                  | 实例使用IOPS大小与最大可用IOPS的比值                         |
| 连接数使用率                | 已用连接数占总连接数的比率                                   |
| connections                 | 实例的连接数                                                 |
| available_connections       | 剩余可用连接数                                               |
| network_bytesIn             | 网络流量流入速率                                             |
| network_bytesOut            | 网络流量流出速率                                             |
| network_numRequests         | 处理的请求数                                                 |
| op_command                  | Command操作数                                                |
| op_delete                   | 删除操作                                                     |
| op_getmore                  | getmore操作速率                                              |
| op_insert                   | 插入操作速率                                                 |
| op_query                    | 查询操作速率                                                 |
| op_update                   | 更新操作速率                                                 |
| op_qps                      | 事务处理速率                                                 |
| cursor_timeout              | 超时cursor个数                                               |
| cursor_totalOpen            | 总共打开的cursor对象个数                                     |
| globalLock_cq_total         | 全局锁的等待队列长度                                         |
| globalLock_cq_readers       | 全局读锁的等待队列长度                                       |
| globalLock_cq_writers       | 全局写锁的等待队列长度                                       |
| wt_bytes_read_into_cache    | 读入cache的数据量大小                                        |
| wt_bytes_written_from_cache | 从cache写入磁盘的数据量大小                                  |
| wt_max_bytes_config         | 配置最大可用的硬盘大小                                       |
| opcounters                  | 实例的操作QPS数，包括：<br />insert操作数<br />query操作数<br />delete操作数<br />update操作数<br />getmore操作数<br />command操作数 |
| network                     | 实例的网络流量，包括：<br />进口流量<br />出口流量 <br />处理的请求数 |
| cursors                     | 实例使用的cursor数，包括：<br />当前cursor打开数量<br />cursor超时数量 |
| globalLock                  | 实例当前等待全局锁的队列长度，包括：<br />全局读锁的等待队列长度<br />全局写锁的等待队列长度<br />所有全局锁的等待队列长度 |
| wiredTiger                  | 实例wiredTiger引擎cache层指标，包括：<br />读入cache的数据量大小<br />从cache写的磁盘大小 |