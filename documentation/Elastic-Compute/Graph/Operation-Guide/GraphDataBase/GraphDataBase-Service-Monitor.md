## 服务监控
#### 1、概览

以折线图的形式，快速查看机器上全部服务的运行情况，包括图服务和内存服务。图服务包括查询量、慢查询量。存储服务包括顶点写入延迟和边写入延迟。针对每个图表，点击右上角 是否可视 按钮可进行显示/隐藏配置，可编辑配置图表的相关参数。

![1644737861895](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644737861895.png)

#### 2、版本

该模块显示了各类型服务在部署的服务器上的版本情况，包括图服务、存储服务、Meta服务、存储服务。

![1644843532876](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644843532876.png)

#### 3、Leader

该模块显示在各个服务器上，分片的详细情况。

![1644843849297](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644843849297.png)

#### 4、Partition

该模块显示各个图空间在部署服务器上的分片比例及个数。

![1644843965895](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644843965895.png)

#### 5、Graph

该页面可以折线图的方式实时查看该集群下，各时间段，图服务的调用情况，包括查询次数、慢查询次数、查询延时、慢查询延时、查询失败次数。

可自定义选择横轴的时间区间。

悬浮可查看该时间图服务的调用参数详情。

| 参数                    | 说明           |
| ----------------------- | -------------- |
| `num_queries`           | 查询数量       |
| `num_slow_queries`      | 慢查询数量     |
| `query_latency_us`      | 查询平均延迟   |
| `slow_query_latency_us` | 慢查询平均延迟 |
| `num_query_errors`      | 查询错误数量   |

![1644844004898](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644844004898.png)

#### 6、Meta

该页面可以折线图的方式实时查看该集群下，各时间段，meta服务的情况，包括心跳延时、心跳次数。

可自定义选择横轴的时间区间。

悬浮可查看该时间Meta服务参数详情。

| 参数                   | 说明     |
| ---------------------- | -------- |
| `heartbeat_latency_us` | 心跳延迟 |
| `num_heartbeats`       | 心跳次数 |

![1644844012619](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644844012619.png)

#### 7、Strorage

该页面可以折线图的方式实时查看该集群下，各时间段，存储服务的情况，包括新增、修改、删除顶点边的情况。

可自定义选择横轴的时间区间。

悬浮可查看该时间存储服务的参数详情。

| 参数                         | 说明             |
| ---------------------------- | ---------------- |
| `add_edges_latency_us`       | 添加边的平均延迟 |
| `add_vertices_latency_us`    | 添加点的平均延迟 |
| `delete_edges_latency_us`    | 删除边的平均延迟 |
| `delete_vertices_latency_us` | 删除点的平均延迟 |
| `forward_tranx_latency_us`   | 传输平均延迟     |
| `get_neighbors_latency_us`   | 查询邻居平均延迟 |

![1644844021370](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644844021370.png)






