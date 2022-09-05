## 查询文档

### 前提条件
1. 已创建云搜索 Elasticsearch 集群，可参考 [创建集群](../Getting-Started/Create-ES.md)。</br>

### 登录 Kibana
1. 登录 [云搜索Elasticsearch控制台](https://es-console.jdcloud.com/clusters)，进入集群管理页面。</br>
2. 点击集群列表中目标集群右侧的【**操作-kibana**】 按钮进入 kibana 可视化界面，通过导航栏的【Dev Tools】进入开发者工具。</br>

### 查询单个文档

- 7.0以下版本
```
GET product_info/product/ivAJ2YIBDm18sYJYw3uK
```

- 7.0及以上版本
```
GET product_info/_doc/ivAJ2YIBDm18sYJYw3uK
```

> 说明：查询单个文档的API格式为 GET <_index>/<_type>/<_id>，其中<_index>为索引名称；<_type>为类型名称，7.0及以上版本时类型名称为_doc；<_id>为文档id。

</br>

查询成功后，返回结果如下：

```
{
  "_index" : "product_info",
  "_type" : "_doc",
  "_id" : "ivAJ2YIBDm18sYJYw3uK",
  "_version" : 1,
  "_seq_no" : 0,
  "_primary_term" : 1,
  "found" : true,
  "_source" : {
    "productName" : "产品A",
    "productType" : "自营",
    "describe" : "自营类产品A"
  }
}

```


### 批量查询文档

- 7.0以下版本
```
GET product_info/product/_search
```

- 7.0及以上版本
```
GET product_info/_doc/_search
```
</br>

查询成功后，返回结果如下：
```
{
  "took" : 815,
  "timed_out" : false,
  "_shards" : {
    "total" : 5,
    "successful" : 5,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 5,
      "relation" : "eq"
    },
    "max_score" : 1.0,
    "hits" : [
      {
        "_index" : "product_info",
        "_type" : "_doc",
        "_id" : "ivAJ2YIBDm18sYJYw3uK",
        "_score" : 1.0,
        "_source" : {
          "productName" : "产品A",
          "productType" : "自营",
          "describe" : "自营类产品A"
        }
      },
      {
        "_index" : "product_info",
        "_type" : "_doc",
        "_id" : "Z4IP2YIBTzT-TSjL5KvV",
        "_score" : 1.0,
        "_source" : {
          "productName" : "产品C",
          "productType" : "第三方",
          "describe" : "第三方类产品C"
        }
      },
      {
        "_index" : "product_info",
        "_type" : "_doc",
        "_id" : "aIIP2YIBTzT-TSjL5KvV",
        "_score" : 1.0,
        "_source" : {
          "productName" : "产品D",
          "productType" : "第三方",
          "describe" : "第三方类产品D"
        }
      },
      {
        "_index" : "product_info",
        "_type" : "_doc",
        "_id" : "ZYIP2YIBTzT-TSjL5KvV",
        "_score" : 1.0,
        "_source" : {
          "productName" : "产品A",
          "productType" : "自营",
          "describe" : "自营类产品A"
        }
      },
      {
        "_index" : "product_info",
        "_type" : "_doc",
        "_id" : "ZoIP2YIBTzT-TSjL5KvV",
        "_score" : 1.0,
        "_source" : {
          "productName" : "产品B",
          "productType" : "自营",
          "describe" : "自营类产品B"
        }
      }
    ]
  }
}

```
