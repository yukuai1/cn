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
GET _cat/nodes?v&s=name
```

</br>

响应如下时表示访问成功：
```
ip           heap.percent ram.percent cpu load_1m load_5m load_15m node.role master name
10.123.32.22           23          61   2    1.99    1.49     1.64 dim       *      node-0
10.123.32.23           30          66   2    3.53    3.62     3.74 dim       -      node-1
10.123.32.24           35          83   6    3.87    3.54     3.24 dim       -      node-2
```

### 索引状态查看

```
GET _cat/indices?v&s=index
```

</br>

响应如下时表示访问成功：
```
health status index                        uuid                   pri rep docs.count docs.deleted store.size pri.store.size
green  open   .kibana_1                    8394P6u9QomPS6LuuAhFww   1   1        117            1    221.6kb        110.8kb
green  open   hot_warm_test_index          ncx-1sPFROaGAcYzfJuosA   3   1          0            0      1.2kb           624b
green  open   kibana_sample_data_ecommerce sSmZu2rCQQGTvyexmOlxrA   1   1       4675            0      9.6mb          4.8mb
green  open   logs-20220824                fUT4ZByjRX-g7vmjZj2Ymw   4   1          0            0      1.6kb           832b
green  open   logs-20220825                qTSdlGKYQ5eRS7HueKmCGw   4   1          0            0      1.6kb           832b
green  open   logs-20220826                YJWGd5jiRdOsNsYR0YQHQA   4   1          0            0      1.6kb           832b
green  open   product_info                 zcqtEHY6TH2ba3XNNasjBQ   5   1          5            0     33.5kb         16.7kb
green  open   sample_index                 Neu6FIS3Rf-5gZGp6x_xiA   1   1          2            0     15.1kb          7.5kb
green  open   template_05_20220717         eby-U1MUQzy3BPGzG0L1oA   1   1          0            0       416b           208b
green  open   template_05_20220819         d-L1fBOgTRiaVwzZ1ea11w   1   1          0            0       416b           208b
green  open   template_05_20220820         x-nkb1s7RnaIOCZ-aPKz4A   1   1          0            0       416b           208b
```

### 分片状态查看
```
GET _cat/shards
```

</br>

响应如下时表示访问成功：
```
index                        shard prirep state   docs  store ip           node
.kibana_1                    0     p      STARTED  117 88.2kb 10.123.32.23 node-1
.kibana_1                    0     r      STARTED  117 88.2kb 10.123.32.24 node-2
kibana_sample_data_ecommerce 0     p      STARTED 4675  4.8mb 10.123.32.23 node-1
kibana_sample_data_ecommerce 0     r      STARTED 4675  4.8mb 10.123.32.24 node-2
logs-20220711                1     r      STARTED    0   208b 10.123.32.24 node-2
logs-20220711                1     p      STARTED    0   208b 10.123.32.22 node-0
logs-20220711                3     r      STARTED    0   208b 10.123.32.23 node-1
logs-20220711                3     p      STARTED    0   208b 10.123.32.24 node-2
logs-20220711                2     p      STARTED    0   208b 10.123.32.24 node-2
logs-20220711                2     r      STARTED    0   208b 10.123.32.22 node-0
logs-20220711                0     r      STARTED    0   208b 10.123.32.23 node-1
template_05_20220717         0     r      STARTED    0   208b 10.123.32.23 node-1
template_05_20220717         0     p      STARTED    0   208b 10.123.32.24 node-2
template_05_20220819         0     r      STARTED    0   208b 10.123.32.24 node-2
template_05_20220819         0     p      STARTED    0   208b 10.123.32.22 node-0
```
