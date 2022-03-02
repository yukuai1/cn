## 服务管理
#### 1、服务信息

针对该实例使用的服务信息进行查看，包括主机信息、版本 Commit ID、leader 总数、分片分布和 leader 分布。

![1644737837130](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644737837130.png)

#### 2、分片信息

可以选择不同图空间，查看分片信息。参数说明如下。

| 参数           | 说明                                 |
| -------------- | ------------------------------------ |
| `Partition ID` | 分片序号。                           |
| `Leader`       | 分片的 leader 副本的 IP 地址和端口。 |
| `Peers`        | 分片所有副本的 IP 地址和端口。       |
| `Losts`        | 分片的故障副本的 IP 地址和端口。     |

![1644843102542](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644843102542.png)

#### 3、配置

显示存储和图服务配置的参数，包括服务配置项名称、类型、及对应配置的参数值。暂不支持在线修改配置。

![1644843211145](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644843211145.png)

#### 4、长时任务

显示运行时间超长的任务，包括任务的ID、执行的命令、状态、开始时间及停止时间。暂不支持在线修改配置。

![1644843401840](https://github.com/jdcloudcom/cn/blob/cn-joygraph/image/Elastic-Compute/Graph-Compute/1644843401840.png)