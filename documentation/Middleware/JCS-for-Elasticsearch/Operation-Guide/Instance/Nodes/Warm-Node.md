# 冷热数据分离

ELasticsearch主要用于海量数据的存储和检索，若将所有的数据都放在SSD硬盘上，成本会比较高。如果您的数据具有以下特点，可以通过冷热数据分离，冷热集群可以在一个集群内包含冷、热两种属性的节点，从而兼顾性能和容量之间的矛盾</br>
| 节点类型 | 数据存储要求 | 读写性能要求 | 规格要求 | 存储要求 |
| :------ |  :------ | :------ | :------ | :------ |
| 热节点（hot） | 近期数据，例如最近2天的日志数据。| 高 | 高，例如16核64GB | 建议使用性能型SSD云盘存储数据，存储空间大小需根据数据大小进行设置。|
| 冷节点（warm）| 历史数据，例如2天之前的日志数据。| 低 | 低，例如8核32GB | 建议使用容量型HDD云盘或通用型SSD云盘存储数据，存储空间大小需根据数据大小进行设置。|

京东云搜索Elasticsearch提供了快速配置构建冷热集群的能力，您可以在控制台启用冷数据节点，快速建立一个冷热分离架构的ES集群。</br>

## 创建冷热集群</br>
### 新建集群时直接创建</br>
1. 访问 [云搜索Elasticsearch 控制台](https://es-console.jdcloud.com/clusters)，或者访问 [京东云控制台](https://console.jdcloud.com/) 选择【云服务】-【互联网中间件】-【云搜索Elasticsearch】进入实例列表页 。</br>
2. 参考 [创建集群](../../../Getting-Started/Create-ES.md)，在页面中选择所需创建集群的相关信息。</br>
3. 在规格部分选择**启用冷数据节点**，并选择冷数据节点规格。</br>
4. 进一步设置集群的其他参数，确认创建冷热集群。</br>

![Warm_Node_create](../../../../../../image/Elasticsearch/Nodes/Warm_Node_create.png)


### 将现有集群变更配置为冷热集群</br>
> 注意：现有集群变更配置为冷热集群时，集群将会滚动重启。请确保在变更配置前，集群的 **状态为正常（绿色）、索引至少包含1个副本、资源使用率不是很高**。
> - 查看索引副本：登录对应实例的 Kibana 控制台，执行 GET _cat/indices?v 命令，在返回结果中查看对应索引的 rep 值，≥1表示该索引至少包含一个副本。
> - 查看资源使用率：在集群监控页面查看，例如节点 CPU 使用率为80%左右，节点 HeapMemory 使用率为50%左右，节点负载低于当前数据节点的 CPU 核数。
1. 访问 [云搜索Elasticsearch 控制台](https://es-console.jdcloud.com/clusters)，或者访问 [京东云控制台](https://console.jdcloud.com/) 选择【云服务】-【互联网中间件】-【云搜索Elasticsearch】进入实例列表页。</br>
2. 在实例列表页，选择目标集群右侧的【操作-更多-变更配置】。</br>
3. 在变更配置页，选择**启用冷数据节点**，并选择冷数据节点规格。</br>
4. 点击变更并确认，等待集群配置变更完成。</br>

</br>

![Warm_Node_create_2](../../../../../../image/Elasticsearch/Nodes/Warm_Node_create_2.png)

> 当您启用了冷数据节点并购买后，系统会在节点启动参数中加入-Enode.attr.box_type参数。
> - 热数据节点：-Enode.attr.box_type=hot
> - 冷数据节点：-Enode.attr.box_type=warm

## 使用冷热集群
登陆目标集群的Kibana控制台，在左侧导航栏，单击 **Dev Tools**。
### 节点角色查看
可以通过以下命令验证节点的冷热属性。
```
GET _cat/nodeattrs?v&h=node,attr,value&s=attr:desc

node            attr           value
node-0          box_type       hot
node-1          box_type       hot
node-2          box_type       hot
warmnode-0      box_type       warm
warmnode-1      box_type       warm
warmnode-2      box_type       warm
...
```

### 指定索引冷热属性
您可以根据实际情况决定索引的冷热属性。
- 对于热数据，设置索引配置如下：
```
PUT hot_data_index/_settings
{
        "index.routing.allocation.require.box_type": "hot"
}
```
- 对于冷数据，设置索引配置如下：
```
PUT warm_data_index/_settings
{
        "index.routing.allocation.require.box_type": "warm"
}
```
- 也可以去掉冷热数据配置，不受冷热数据标签影响：
```
PUT myindex/_settings
{
        "index.routing.allocation.require.box_type": null
}
```

### 通过索引模板创建冷热索引
通过设置template，可以通过索引模板将相应的索引存储到指定的冷热数据节点。如下所示，可以在Kibana中，通过模板在创建的时候把 warm_data_index* 的索引，存储在冷数据节点上。
- **5.x版本**，可使用以下命令创建索引模板：
```
PUT _template/test
{
    "order": 1,
    "template": "warm_data_index*",
    "settings": {
        "index": {
            "refresh_interval": "30s",
            "number_of_shards": "3",
            "number_of_replicas": "1",
            "routing.allocation.require.box_type": "warm"
        }
    }
}
```

- **6.x及以上版本**，可使用以下命令创建索引模板：
```
PUT _template/test
{
    "order": 1,
    "index_patterns": "warm_data_index*",
    "settings": {
        "index": {
            "refresh_interval": "30s",
            "number_of_shards": "3",
            "number_of_replicas": "1",
            "routing.allocation.require.box_type": "warm"
        }
    }
}
```

### 验证设置的索引
1. 创建测试索引
```
PUT hot_warm_test_index
{
    "settings": {
        "number_of_replicas": 1,
        "number_of_shards": 3
    }
}
```
2. 查看分片分配，可以看到分片均匀分配在热节点上。
```
GET _cat/shards/hot_warm_test_index?v&h=index,shard,prirep,node&s=node

index               shard prirep node
hot_warm_test_index 2     p      node-0
hot_warm_test_index 1     r      node-0
hot_warm_test_index 2     r      node-1
hot_warm_test_index 0     p      node-1
hot_warm_test_index 1     p      node-2
hot_warm_test_index 0     r      node-2
```
3. 设置测试索引为冷索引。
```
PUT hot_warm_test_index/_settings
{
    "index.routing.allocation.require.box_type": "warm"
}
```
查看分片分配，分片均分配到冷节点上。</br>
```
GET _cat/shards/hot_warm_test_index?v&h=index,shard,prirep,node&s=node

index               shard prirep   node
hot_warm_test_index   1     p      warmnode-0
hot_warm_test_index   0     r      warmnode-0
hot_warm_test_index   2     r      warmnode-1
hot_warm_test_index   0     p      warmnode-1
hot_warm_test_index   2     p      warmnode-2
hot_warm_test_index   1     r      warmnode-2
```
