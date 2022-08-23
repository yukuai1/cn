# 创建索引模板

您可以通过 【命令行工具】 或 【Kibana - Dev Tools】创建索引模板。


## 命令行工具创建索引模板实例
可参考如下示例通过命令行工具创建索引模板
</br>
- **5.x版本**

``` 
curl -XPUT localhost:9200/_template/template05 \
-H"Content-Type:application/json" \
-d '{
  "template": "template05_*",  
  "settings": {
    "number_of_shards": 2
  },
  "mappings": {
    "_source": {
      "enabled": false
    },
    "properties": {
      "name": {
        "type": "keyword"
      },
      "created_at": {
        "type": "date",
        "format": "EEE MMM dd HH:mm:ss Z YYYY"
      }
    }
  }
}'
```

- **6.x及以上版本**
``` 
curl -XPUT localhost:9200/_template/template05 \
-H"Content-Type:application/json" \
-d '{
  "index_patterns": ["template05_*"], 
  "settings": {
    "number_of_shards": 2
  },
  "mappings": {
    "_source": {
      "enabled": false
    },
    "properties": {
      "name": {
        "type": "keyword"
      },
      "created_at": {
        "type": "date",
        "format": "EEE MMM dd HH:mm:ss Z YYYY"
      }
    }
  }
}'
```

## Kibana - Dev Tools创建索引模板实例
可参考如下示例通过命令行工具创建索引模板</br>
- **5.x版本**
``` 
PUT /_template/my_logs 
{
  "template": "template05_*",  
  "order": 1, 
  "settings": {
    "number_of_shards": 1 
  },
  "mappings": {
    "_source": {
      "enabled": false
    },
    "properties": {
      "name": {
        "type": "keyword"
      },
      "created_at": {
        "type": "date",
        "format": "EEE MMM dd HH:mm:ss Z YYYY"
      }
    }
  },
  "aliases": {
    "last_3_months": {} 
  }
}
```

- **6.x及以上版本**
``` 
PUT /_template/my_logs 
{
  "index_patterns": ["template05_*"],
  "order": 1, 
  "settings": {
    "number_of_shards": 1 
  },
  "mappings": {
    "_source": {
      "enabled": false
    },
    "properties": {
      "name": {
        "type": "keyword"
      },
      "created_at": {
        "type": "date",
        "format": "EEE MMM dd HH:mm:ss Z YYYY"
      }
    }
  },
  "aliases": {
    "last_3_months": {} 
  }
}
```

