
## 创建索引

### 前提条件
1. 已创建云搜索 Elasticsearch 集群，可参考 [创建集群](../Getting-Started/Create-ES.md)。</br>

### 登录 Kibana
1. 登录 [云搜索Elasticsearch控制台](https://es-console.jdcloud.com/clusters)，进入集群管理页面。</br>
2. 点击集群列表中目标集群右侧的【**操作-kibana**】 按钮进入 kibana 可视化界面，通过导航栏的【Dev Tools】进入开发者工具。</br>

### 创建索引
自动创建索引功能未开启的状态下，需要首先创建一个索引。
- 7.0以下版本
```
PUT /product_info
{
  "settings": {
    "number_of_shards": 5,
    "number_of_replicas": 1
  },
  "mappings": {
    "products": {
      "properties": {
        "productName": {
          "type": "text",
          "analyzer": "ik_smart"
        },
        "productType":{
          "type":"keyword"
        },
        "describe": {
         "type": "text",
         "analyzer": "ik_smart"
        }
      }
    }
  }
}
```

- 7.0及以上版本
```
PUT /product_info
{
  "settings": {
    "number_of_shards": 5,
    "number_of_replicas": 1
  },
  "mappings": {
      "properties": {
        "productName": {
          "type": "text",
          "analyzer": "ik_smart"
        },
        "productType":{
          "type":"keyword"
        },
        "describe": {
          "type": "text",
          "analyzer": "ik_smart"
        }
    }
  }
}
```

> 注意：官方Elasticsearch 7.0及以上版本将移除映射中的type类型定义，之前版本会继续支持。如果在7.0及以上版本中使用了type，会出现"type": "mapper_parsing_exception"的错误提示。详细信息及解决方案，请参见 [Removal of mapping types](https://www.elastic.co/guide/en/elasticsearch/reference/7.3/removal-of-types.html?spm=a2c4g.11186623.0.0.60a75d78iF1OeF#_what_are_mapping_types)。
</br>
响应如下时，代表索引创建成功：

```
{
  "acknowledged" : true,
  "shards_acknowledged" : true,
  "index" : "product_info"
}
```

