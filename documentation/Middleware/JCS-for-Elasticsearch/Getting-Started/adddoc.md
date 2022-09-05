## 创建文档

## 前提条件
1. 已创建云搜索 Elasticsearch 集群，可参考 [创建集群](../Getting-Started/Create-ES.md)。</br>

### 登录 Kibana
1. 登录 [云搜索Elasticsearch控制台](https://es-console.jdcloud.com/clusters)，进入集群管理页面。</br>
2. 点击集群列表中目标集群右侧的【**操作-kibana**】 按钮进入 kibana 可视化界面，通过导航栏的【Dev Tools】进入开发者工具。</br>

### 创建单个文档
- 7.0以下版本
```
POST product_info/product
{
  "productName": "产品A",
  "productType": "自营",
  "describe": "自营类产品A"
}
```

- 7.0及以上版本
```
POST product_info/_doc/
{
  "productName": "产品A",
  "productType": "自营",
  "describe": "自营类产品A"
}
```

</br>

创建成功后，返回结果如下。
```
{
  "_index" : "product_info",
  "_type" : "_doc",
  "_id" : "ivAJ2YIBDm18sYJYw3uK",
  "_version" : 1,
  "result" : "created",
  "_shards" : {
    "total" : 2,
    "successful" : 2,
    "failed" : 0
  },
  "_seq_no" : 0,
  "_primary_term" : 1
}

```

### 创建多个文档
- 7.0以下版本
```
POST product_info/product/_bulk
{"index":{}}
{"productName": "产品A","productType": "自营","describe": "自营类产品A"}
{"index":{}}
{"productName": "产品B","productType": "自营","describe": "自营类产品B"}
{"index":{}}
{"productName": "产品C","productType": "第三方","describe": "第三方类产品C"}
{"index":{}}
{"productName": "产品D","productType": "第三方","describe": "第三方类产品D"}
```

- 7.0及以上版本
```
POST product_info/_doc/_bulk
{"index":{}}
{"productName": "产品A","productType": "自营","describe": "自营类产品A"}
{"index":{}}
{"productName": "产品B","productType": "自营","describe": "自营类产品B"}
{"index":{}}
{"productName": "产品C","productType": "第三方","describe": "第三方类产品C"}
{"index":{}}
{"productName": "产品D","productType": "第三方","describe": "第三方类产品D"}
```

</br>

创建成功后，返回结果如下。
```
{
  "took" : 27,
  "errors" : false,
  "items" : [
    {
      "index" : {
        "_index" : "product_info",
        "_type" : "_doc",
        "_id" : "ZYIP2YIBTzT-TSjL5KvV",
        "_version" : 1,
        "result" : "created",
        "_shards" : {
          "total" : 2,
          "successful" : 2,
          "failed" : 0
        },
        "_seq_no" : 0,
        "_primary_term" : 1,
        "status" : 201
      }
    },
    {
      "index" : {
        "_index" : "product_info",
        "_type" : "_doc",
        "_id" : "ZoIP2YIBTzT-TSjL5KvV",
        "_version" : 1,
        "result" : "created",
        "_shards" : {
          "total" : 2,
          "successful" : 2,
          "failed" : 0
        },
        "_seq_no" : 1,
        "_primary_term" : 1,
        "status" : 201
      }
    },
    {
      "index" : {
        "_index" : "product_info",
        "_type" : "_doc",
        "_id" : "Z4IP2YIBTzT-TSjL5KvV",
        "_version" : 1,
        "result" : "created",
        "_shards" : {
          "total" : 2,
          "successful" : 2,
          "failed" : 0
        },
        "_seq_no" : 0,
        "_primary_term" : 1,
        "status" : 201
      }
    },
    {
      "index" : {
        "_index" : "product_info",
        "_type" : "_doc",
        "_id" : "aIIP2YIBTzT-TSjL5KvV",
        "_version" : 1,
        "result" : "created",
        "_shards" : {
          "total" : 2,
          "successful" : 2,
          "failed" : 0
        },
        "_seq_no" : 0,
        "_primary_term" : 1,
        "status" : 201
      }
    }
  ]
}

```
