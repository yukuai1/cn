# 从备份中恢复数据
备份完成后，您可以通过 _restore API 恢复数据到原 Elasticsearch 实例中。在 Kibana 控制台上，执行如下命令，从快照中恢复索引数据：</br>
> **说明**：恢复.开头的系统索引可能会导致 Kibana 访问失败，建议不要恢复系统索引。

</br>

## 恢复所有索引
恢复所有索引（包含.开头的系统索引）
```
POST _snapshot/auto_snapshot/<snapshot>/_restore
```
</br>

- 假设 snapshot 中包含5个索引，那么这5个索引都会被恢复到集群中。
- _restore API会立刻返回，恢复进程会在后台进行。如果您希望调用阻塞直到恢复完成，可以添加wait_for_completion参数。

```
POST _snapshot/auto_snapshot/<snapshot>/_restore?wait_for_completion=true
```

恢复所有索引（除.开头的系统索引）
```
POST _snapshot/auto_snapshot/<snapshot>/_restore
{
  "indices":"*,-.jd_es_auth*,-.kibana*",
  "ignore_unavailable":"true"
}
```
</br>
   
## 恢复快照中的指定索引。
如果您需要在不替换现有数据的前提下，恢复旧版本的数据来验证内容，或者进行其他处理，可恢复指定的索引，并重命名该索引。

```
POST _snapshot/auto_snapshot/<snapshot>/_restore
{
  "indices": "index_1",
  "rename_pattern": "index_(.+)",
  "rename_replacement": "restored_index_$1"
} 
```

| 参数 | 说明 |
| :----- | :----- |
| indices | 只恢复index_1索引，忽略快照中的其他索引。 |
| rename_pattern | 查找正在恢复的索引，该索引名称需要与提供的模板匹配。 |
| rename_replacement | 重命名查找到的索引。 |
</br>

## 查看快照恢复信息
您可以通过_recovery API来监控快照恢复的状态、进度等信息：
- 查看指定索引的恢复状态
```
GET restored_index_1/_recovery
```

- 您可以通过_recovery API来监控快照恢复的状态、进度等信息：
```
GET /_recovery/
```
