## 分析集群

### 前提条件
1. 已创建云搜索 Elasticsearch 集群，可参考 [创建集群](../Getting-Started/Create-ES.md)。</br>

### 登录 Kibana
1. 登录 [云搜索Elasticsearch控制台](https://es-console.jdcloud.com/clusters)，进入集群管理页面。</br>
2. 点击集群列表中目标集群右侧的【**操作-kibana**】 按钮进入 kibana 可视化界面，通过导航栏的【Dev Tools】进入开发者工具。</br>

### 集群状态查看
```
GET _cluster/health
```

</br>

获取集群状态成功，返回结果如下：
```
{
  "cluster_name" : "ES_Demo_Instance_Wushan",
  "status" : "green",
  "timed_out" : false,
  "number_of_nodes" : 6,
  "number_of_data_nodes" : 6,
  "active_primary_shards" : 64,
  "active_shards" : 128,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 0,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0,
  "task_max_waiting_in_queue_millis" : 0,
  "active_shards_percent_as_number" : 100.0
}

```
### 节点状态查看
```
GET _cat/nodes
```

</br>

响应如下时表示访问成功：
```
172.16.0.48 5 79 0 0.20 0.32 0.32 mdi * node-1
172.16.0.46 7 61 0 0.26 0.24 0.22 mdi - node-0
172.16.0.47 4 65 0 1.65 1.38 1.24 i   - coordinating-1
172.16.0.50 8 89 3 3.43 3.31 3.35 mdi - node-2
172.16.0.49 3 17 1 1.20 1.27 1.19 i   - coordinating-0
```

### 索引状态查看

```
GET _cat/indices?v
```

</br>

响应如下时表示访问成功：
```
health status index      uuid                   pri rep docs.count docs.deleted store.size pri.store.size
green  open   .kibana_1  ZcZjajoZTiWPCQajEHqWbQ   1   1          1            0      7.4kb          3.7kb
green  open   blog_index vicsOsZITQe-euiuoQGH6A   5   1          6            0     43.4kb         21.7kb
green  open   index1     Spc2nVIaS32ImKyieUYb5w   5   1          2            0     13.8kb          6.9kb
```
### 分片状态查看
```
GET _cat/shards
```

</br>

响应如下时表示访问成功：
```
.kibana_1  0 p STARTED 1 3.7kb 172.16.0.50 node-2
.kibana_1  0 r STARTED 1 3.7kb 172.16.0.48 node-1
index1     1 p STARTED 0  261b 172.16.0.50 node-2
index1     1 r STARTED 0  261b 172.16.0.46 node-0
index1     4 p STARTED 0  261b 172.16.0.50 node-2
index1     4 r STARTED 0  261b 172.16.0.48 node-1
index1     3 r STARTED 1 3.5kb 172.16.0.50 node-2
index1     3 p STARTED 1 3.5kb 172.16.0.46 node-0
index1     2 p STARTED 0  261b 172.16.0.48 node-1
index1     2 r STARTED 0  261b 172.16.0.46 node-0
index1     0 r STARTED 1 2.6kb 172.16.0.48 node-1
index1     0 p STARTED 1 2.6kb 172.16.0.46 node-0
blog_index 1 r STARTED 2 8.3kb 172.16.0.50 node-2
blog_index 1 p STARTED 2 8.3kb 172.16.0.48 node-1
blog_index 4 p STARTED 1 4.3kb 172.16.0.48 node-1
blog_index 4 r STARTED 1 4.3kb 172.16.0.46 node-0
blog_index 3 p STARTED 0  261b 172.16.0.50 node-2
blog_index 3 r STARTED 0  261b 172.16.0.46 node-0
blog_index 2 r STARTED 0  261b 172.16.0.50 node-2
blog_index 2 p STARTED 0  261b 172.16.0.46 node-0
blog_index 0 p STARTED 3 8.5kb 172.16.0.48 node-1
blog_index 0 r STARTED 3 8.5kb 172.16.0.46 node-0

```
