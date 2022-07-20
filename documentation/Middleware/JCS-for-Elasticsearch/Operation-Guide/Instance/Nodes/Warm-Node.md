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


### 将现有集群变更配置为冷热集群</br>
1. 访问 [云搜索Elasticsearch 控制台](https://es-console.jdcloud.com/clusters)，或者访问 [京东云控制台](https://console.jdcloud.com/) 选择【云服务】-【互联网中间件】-【云搜索Elasticsearch】进入实例列表页。</br>
2. 在实例列表页，选择目标集群右侧的【操作-更多-变更配置】。</br>
3. 在变更配置页，选择**启用冷数据节点**，并选择冷数据节点规格。</br>
4. 点击变更并确认，等待集群配置变更完成。</br>
</br>

> 当您启用了冷数据节点并购买后，系统会在节点启动参数中加入-Enode.attr.box_type参数。
> - 热数据节点：-Enode.attr.box_type=hot
> - 冷数据节点：-Enode.attr.box_type=warm

## 使用冷热集群
登陆目标集群的Kibana控制台，在左侧导航栏，单击 **Dev Tools**。
### 节点角色查看
可以通过以下命令验证节点的冷热属性。
```
GET _cat/nodeattrs?v&h=node,attr,value&s=attr:desc

node        attr        value
node1     box_type       hot
node2     box_type       hot
node3     box_type       warm
node4     box_type       hot
node5     box_type       warm
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

#### 验证设置的索引
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

index               shard prirep   node
hot_warm_test_index   1     p      node1
hot_warm_test_index   0     r      node1
hot_warm_test_index   0     p      node2
hot_warm_test_index   2     r      node2
hot_warm_test_index   2     p      node4
hot_warm_test_index   1     r      node4
```
3. 设置测试索引为冷索引。
```
PUT hot_warm_test_index/_settings
{
        "index.routing.allocation.require.temperature": "warm"
}
```
查看分片分配，分片均分配到冷节点上。</br>
```
GET _cat/shards/hot_warm_test_index?v&h=index,shard,prirep,node&s=node

index               shard prirep   node
hot_warm_test_index   1     p      node3
hot_warm_test_index   0     r      node3
hot_warm_test_index   2     r      node3
hot_warm_test_index   0     p      node5
hot_warm_test_index   2     p      node5
hot_warm_test_index   1     r      node5
```
