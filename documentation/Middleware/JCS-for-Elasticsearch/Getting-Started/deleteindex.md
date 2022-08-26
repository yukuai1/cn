## 删除数据

### 前提条件
1. 已创建云搜索 Elasticsearch 集群，可参考 [创建集群](../Getting-Started/Create-ES.md)。</br>
2. 已经创建了索引和文档数据，可参考 [创建索引](../Getting-Started/addindex.md)、[创建文档](../Getting-Started/adddoc.md)。

### 登录 Kibana
1. 登录 [云搜索Elasticsearch控制台](https://es-console.jdcloud.com/clusters)，进入集群管理页面。</br>
2. 点击集群列表中目标集群右侧的【**操作-kibana**】 按钮进入 kibana 可视化界面，通过导航栏的【Dev Tools】进入开发者工具。</br>


### 删除整个索引
```
DELETE product_info
```

索引删除成功后，返回结果如下：
```
{
  "acknowledged" : true
}
```

### 删除一条记录
- 7.0以下版本
```
DELETE product_info/product/ivAJ2YIBDm18sYJYw3uK
```

- 7.0及以上版本
```
DELETE product_info/_doc/ivAJ2YIBDm18sYJYw3uK
```

</br>

删除成功后，返回结果如下：
```
{
  "_index" : "product_info",
  "_type" : "_doc",
  "_id" : "ivAJ2YIBDm18sYJYw3uK",
  "_version" : 2,
  "result" : "deleted",
  "_shards" : {
    "total" : 2,
    "successful" : 2,
    "failed" : 0
  },
  "_seq_no" : 1,
  "_primary_term" : 1
}
```
