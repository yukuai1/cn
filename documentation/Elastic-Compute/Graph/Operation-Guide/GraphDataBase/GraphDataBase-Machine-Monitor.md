## 机器监控
#### 1、概览

以折线图或柱状图的形式，快速查看机器的整体运行情况，包括CPU、内存、负载、磁盘、流量的各时间段的使用情况。可帮助用户快速关注到机器使用的波动情况。针对每个图表，点击右上角 是否可视 按钮可进行显示/隐藏配置，可编辑配置图表的相关参数。

![1644737875353](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644737875353.png)

#### 2、CPU

该页面可以折线图的方式实时查看该集群下，各时间段，全部服务器的CPU使用情况。

可自定义选择横轴的时间区间。

通过图表右上方下拉框，筛选查看的服务器及CPU详细参数。

| 参数              | 说明                                                  |
| ----------------- | ----------------------------------------------------- |
| `cpu_utilization` | CPU 已使用百分比                                      |
| `cpu_idle`        | CPU 空闲百分比                                        |
| `cpu_wait`        | 等待 IO 操作的 CPU 百分比                             |
| `cpu_user`        | 用户空间（非 Nebula Graph 图空间）占用的 CPU 百分比   |
| `cpu_system`      | 内核空间（非 Nebula Graph 内核空间）占用的 CPU 百分比 |

![1644833868621](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644833868621.png)

#### 3、内存

该页面可以折线图的方式实时查看该集群下，各时间段，全部服务器的内存使用情况。

可自定义选择横轴的时间区间。

通过图表右上方下拉框，筛选查看的服务器及内存详细参数。

悬浮可查看该时间该内存参数的详情。

| 参数                 | 说明                       |
| -------------------- | -------------------------- |
| `memory_utilization` | 内存已使用百分比           |
| `memory_used`        | 已使用内存（包括缓存）     |
| `memory_actual_used` | 实际使用内存（不包括缓存） |
| `memory_free`        | 空闲内存                   |

![1644834345764](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644834345764.png)

#### 4、负载

该页面可以折线图的方式实时查看该集群下，各时间段，全部服务器的负载情况。

可自定义选择横轴的时间区间。

通过图表右上方下拉框，筛选查看的服务器及内存详细参数。

悬浮可查看该时间负载参数的详情。

| 参数       | 说明                     |
| ---------- | ------------------------ |
| `load_1m`  | 最近 1 分钟系统平均负载  |
| `load_5m`  | 最近 5 分钟系统平均负载  |
| `load_15m` | 最近 15 分钟系统平均负载 |

![1644841585796](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644841585796.png)

#### 5、磁盘

该页面可以折线图的方式实时查看该集群下，各时间段，全部磁盘的使用情况。

可自定义选择横轴的时间区间。

通过图表右上方下拉框，筛选查看的服务器及内存详细参数。

悬浮可查看该时间磁盘参数的详情。

| 参数                | 说明                 |
| ------------------- | -------------------- |
| `disk_used`         | 磁盘已使用存储空间   |
| `disk_free`         | 磁盘剩余存储空间     |
| `disk_readbytes`    | 磁盘每秒读取的字节数 |
| `disk_writebytes`   | 磁盘每秒写入的字节数 |
| `disk_readiops`     | 磁盘每秒的读请求数量 |
| `disk_writeiops`    | 磁盘每秒的写请求数量 |
| `inode_utilization` | inode 已使用百分比   |

![1644841656531](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644841656531.png)

#### 6、流量

该页面可以折线图的方式实时查看该集群下，各时间段，全部流量的情况。

可自定义选择横轴的时间区间。

通过图表右上方下拉框，筛选查看的服务器及内存详细参数。

悬浮可查看该时间的流量详情。

| 参数                  | 说明                     |
| --------------------- | ------------------------ |
| `network_in_rate`     | 网卡每秒接收的字节数     |
| `network_out_rate`    | 网卡每秒发送的字节数     |
| `network_in_errs`     | 网卡每秒接收错误的字节数 |
| `network_out_errs`    | 网卡每秒发送错误的字节数 |
| `network_in_packets`  | 网卡每秒接收的数据包数量 |
| `network_out_packets` | 网卡每秒发送的数据包数量 |

![1644842863793](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644842863793.png)




