## 从备份中恢复数据
备份完成后，您可以通过 _restore API 恢复数据到原 Elasticsearch 实例中。在 Kibana 控制台上，执行如下命令，从快照中恢复索引数据：</br>
> **说明**：恢复.开头的系统索引可能会导致 Kibana 访问失败，建议不要恢复系统索引。

</br>

- 恢复 auto_snapshot 仓库中，指定快照的所有索引（后台执行）。

```
POST _snapshot/auto_snapshot/<snapshot>/_restore
```

<snapshot>：备份快照的名称，例如 auto_snapshot_2022072xxxxxx。
 
- 恢复 auto_snapshot 仓库中，指定快照的所有索引，并等待任务处理完成。_restore API为异步调用，实例在确认可执行恢复操作后会立即返回，该恢复任务会在后台执行。您可以通过追加 wait_for_completion 参数，阻塞调用直到恢复完成再返回信息。

```
POST _snapshot/auto_snapshot/<snapshot>/_restore?wait_for_completion=true
```
 
 <snapshot>：备份快照的名称，例如 auto_snapshot_2022072xxxxxx。
   
- 恢复 auto_snapshot 仓库中，指定快照的指定索引。

```
POST _snapshot/auto_snapshot/<snapshot>/_restore
{
  "indices": "index_1,index_2",
} 
```
  
- 恢复 auto_snapshot 仓库中，指定快照的指定索引，并为恢复的索引重命名（后台执行）。

```
POST _snapshot/auto_snapshot/<snapshot>/_restore
{
  "indices": "index_1",
  "rename_pattern": "index_(.+)",
  "rename_replacement": "restored_index_$1"
} 
```
