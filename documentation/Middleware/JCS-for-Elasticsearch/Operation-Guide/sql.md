## SQL支持
 京东智联云Elasticsearch 支持使用 SQL 代替 DSL 查询语言。对于从事产品运营、数据分析等工作以及初次接触 ES 的人，使用 SQL 语言进行查询，将会降低他们使用 ES 的学习成本。</br>

### 通过Kibana使用SQL API查询
- 7.5.2及以上版本
```
POST /_nlpcn/sql
{
  "sql": "select * from {index_name}"
}
```
- 其他版本
```
POST /_sql
{
  "sql": "select * from {index_name}"
}
```

### 通过Curl使用SQL API查询
- 7.5.2及以上版本
```
curl -u {username}:{password} -H "Content-Type: application/json" -XPOST 'http://{domain}:9200/_nlpcn/sql' -d 'select * from {index_name}'
```
- 其他版本
```
curl -u {username}:{password} -H "Content-Type: application/json" -XPOST 'http://{domain}:9200/_sql' -d 'select * from {index_name}'
```
