## 查看备份快照
开启备份功能后，您可以登陆对应京东云搜索 Elasticsearch 集群的 **Kibana 控制台**，在 **Dev Tools** 中通过 _snapshot API查看备份快照的信息。</br>

### 查看快照仓库
- 查看快照仓库。
```
GET _snapshot/
```
- 执行成功后，返回如下结果。
```
{
  "auto_snapshot" : {
    "type" : "s3",
    "settings" : {
      "bucket" : "elasticsearch-snapshot-cn-north-1",
      "base_path" : "es-xxxxxxxxxx/xxxxxxxx",
      "endpoint" : "s3-xxxxxx.cn-north-1.jdcloud-oss.com",
      "protocol" : "http",
      "compress" : "true"
    }
  }
}
```

### 查看快照仓库中的所有快照信息
- 查看快照仓库。
```
GET _snapshot/auto_snapshot/_all
```
- 执行成功后，返回如下结果。
```
{
  "snapshots" : [
    {
      "snapshot" : "auto_snapshot_20220728160035",
      "uuid" : "iBG9RgCvQqG2m2MuP6xxxx",
      "version_id" : 7090399,
      "version" : "7.9.3",
      "indices" : [
        "logs-20220711",
        "template_05_20220717",
      ],
      "data_streams" : [ ],
      "include_global_state" : false,
      "state" : "SUCCESS",
      "start_time" : "2022-07-28T16:00:36.397Z",
      "start_time_in_millis" : 1659024036397,
      "end_time" : "2022-07-28T16:00:39.399Z",
      "end_time_in_millis" : 1659024039399,
      "duration_in_millis" : 3002,
      "failures" : [ ],
      "shards" : {
        "total" : 45,
        "failed" : 0,
        "successful" : 45
      }
    },
    {
      "snapshot" : "manualsnaposhot_20220729024048",
      "uuid" : "t0YLBSnaSL-7CCaf9Qxxxx",
      "version_id" : 7090399,
      "version" : "7.9.3",
      "indices" : [
        "logs-20220711",
        "template_05_20220717",
      ],
      "data_streams" : [ ],
      "include_global_state" : false,
      "state" : "SUCCESS",
      "start_time" : "2022-07-29T02:40:51.737Z",
      "start_time_in_millis" : 1659062451737,
      "end_time" : "2022-07-29T02:40:54.138Z",
      "end_time_in_millis" : 1659062454138,
      "duration_in_millis" : 2401,
      "failures" : [ ],
      "shards" : {
        "total" : 45,
        "failed" : 0,
        "successful" : 45
      }
    }
  ]
}
```
其中 **state** 为快照状态，实例的快照共有以下5种状态。
| 快照状态 | 说明 |
| :----- | :----- |
| IN_PROGRESS | 快照正在执行。 |
| SUCCESS | 快照执行结束，且所有 shard 中的数据都存储成功。 |
| FAILED | 快照执行结束，但部分索引中的数据存储不成功。 |
| PARTIAL | 部分数据存储成功，但至少有1个 shard 中的数据没有存储成功。|
| INCOMPATIBLE | 	快照与 Elasticsearch 实例的版本不兼容。|

### 查看快照仓库中的指定快照的详细信息
- 查看快照仓库。
```
GET _snapshot/auto_snapshot/<snapshot>
```
- 执行成功后，返回如下结果。
```
{
  "snapshots": [
    {
      "snapshot" : "<snapshot>",
      "uuid" : "t0YLBSnaSL-7CCaf9Qxxxx",
      "version_id" : 7090399,
      "version" : "7.9.3",
      "indices" : [
        "logs-20220711",
        "template_05_20220717",
      ],
      "data_streams" : [ ],
      "include_global_state" : false,
      "state" : "SUCCESS",
      "start_time" : "2022-07-29T02:40:51.737Z",
      "start_time_in_millis" : 1659062451737,
      "end_time" : "2022-07-29T02:40:54.138Z",
      "end_time_in_millis" : 1659062454138,
      "duration_in_millis" : 2401,
      "failures" : [ ],
      "shards" : {
        "total" : 45,
        "failed" : 0,
        "successful" : 45
      }
    }
  ]
}
```

### 查看快照仓库中的指定快照的详细信息
- 您也可以通过拽取 _status API 数据查看快照的详细信息。
```
GET _snapshot/auto_snapshot/<snapshot>/_status
```
响应包括快照的总体状况，但也包括下钻到每个索引和每个分片的统计值，分片的不同完成状态展示如下：</br>

| 分片的不同完成状态 | 说明 |
| :----- | :----- |
| INITIALIZING | 分片在检查集群状态看看自己是否可以被快照。这个一般是非常快的。 |
| STARTED | 数据正在被传输到仓库。 |
| FINALIZING | 数据传输完成；分片现在在发送快照元数据。 |
| DONE | 快照完成. |
| FAILED | 快照处理的时候碰到了错误，这个分片/索引/快照不可能完成了。检查您的日志获取更多信息。|

