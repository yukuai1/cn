# listSnapshotTasks


## 描述
查询视频截图任务列表
支持过滤查询：
  - createTime,ge 最早任务创建时间
  - createTime,le 最晚任务创建时间
  - status,in 任务状态IN查询
  - taskId,eq 任务ID精确查询


## 请求方式
GET

## 请求地址
https://vod.jdcloud-api.com/v1/snapshotTasks


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码；默认值为 1|
|**pageSize**|Integer|False|10|分页大小；默认值为 10；取值范围 [10, 100]|
|**filters**|[Filter[]](listsnapshottasks#filter)|False| | |

### <div id="filter">Filter</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤器属性名|
|**operator**|String|False| |过滤器操作符，默认值为 eq|
|**values**|String[]|True| |过滤器属性值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](listsnapshottasks#result)|查询视频截图任务列表信息结果|
|**requestId**|String|请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**pageNumber**|Integer|当前页码|
|**pageSize**|Integer|每页数量|
|**totalElements**|Integer|查询总数|
|**totalPages**|Integer|总页数|
|**content**|[SnapshotTaskSummary[]](listsnapshottasks#snapshottasksummary)|分页内容|
### <div id="snapshottasksummary">SnapshotTaskSummary</div>
|名称|类型|描述|
|---|---|---|
|**taskId**|String|任务ID|
|**jobId**|String|job ID|
|**videoId**|String|视频ID|
|**snapshotType**|String|模板类型。取值范围：<br>  sample - 采样截图模板<br>  sprite - 雪碧图模板<br>|
|**status**|String|任务状态。<br>- submitted<br>- processing<br>- succeeded<br>- failed<br>|
|**outputBucket**|String|输出对象存储空间|
|**outputFileKey**|String|截图输出路径，包含占位符的截图输出路径。当前支持的占位符包括：<br>  {FILENAME} - 输入视频的简单文件名，如 "我和我的祖国"<br>  {TASKID} - 该截图任务的ID，如 "7234584d911b4e0db2fa13545c764898"<br>  {YEAR} - 四位数字年份，如 "2020"<br>  {MONTH} - 两位数字月份，如 "04"<br>  {DAY} - 两位数字日期，如 "15"<br>若未设置，则使用默认的输出路径：snapshot/{YEAR}/{MONTH}/{DAY}/{FILENAME}/ ，最终解析出的路径如 snapshot/2020/04/15/我和我的祖国/<br>为保证输出文件的唯一性，避免覆盖，系统会按照一定规则生成文件名，规则如下：<br>对于普通截图，生成 {TASKID}.{SEQUENCEID}.{EXTNAME} 规则的文件名；<br>对于雪碧图，生成 {TASKID}.{SEQUENCEID}-sprite.{EXTNAME} 规则的文件名；<br>其中 SEQUENCEID 为左补0的6位数字截图序号，EXTNAME 为截图模板中截图格式 format 字段对应的文件扩展名<br>综述，若未设置此字段，则最终输出的普通截图形如：snapshot/2020/04/15/我和我的祖国/7234584d911b4e0db2fa13545c764898.000001.jpg ; 雪碧图形如：snapshot/2020/04/15/我和我的祖国/7234584d911b4e0db2fa13545c764898-sprite.jpg<br>|
|**spriteFileKey**|String|对于雪碧图，生成 {TASKID}-sprite.{EXTNAME} 规则的文件名；<br>|
|**errorCode**|String|错误码|
|**errorMessage**|String|错误信息|
|**createTime**|String|创建时间|
|**updateTime**|String|修改时间|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|

## 请求示例
GET
```
https://vod.jdcloud-api.com/v1/listSnapshotTasks

```

## 返回示例
```
{
    "requestId": "9XrC8X758354Q682xoe6m6KG2s6eh0xR", 
    "result": {
        "content": [
            {
                "createTime": "2022-02-25T10:26:05Z", 
                "errorCode": "", 
                "errorMessage": "", 
                "finishTime": "2022-02-25T10:26:23Z", 
                "jobId": "9", 
                "outputBucket": "vod-storage-72757", 
                "outputFileKey": "snapshot/20220225/52b68b8cd93342b7b548f10604378af4-{SEQUENCEID}.jpg", 
                "spriteFileKey": "snapshot/20220225/52b68b8cd93342b7b548f10604378af4-sprite.jpg", 
                "status": "succeeded", 
                "taskId": "52b68b8cd93342b7b548f10604378af4", 
                "videoId": "e9b5c0b3-ae1c-4e6d-9e89-0ae446f9ba1e"
            }, 
            {
                "createTime": "2022-02-25T10:26:05Z", 
                "errorCode": "", 
                "errorMessage": "", 
                "finishTime": "2022-02-25T10:27:55Z", 
                "jobId": "9", 
                "outputBucket": "vod-storage-72757", 
                "outputFileKey": "snapshot/20220225/2c3bce3aae944c109c857a7f389a3aa6-{SEQUENCEID}.jpg", 
                "spriteFileKey": "", 
                "status": "succeeded", 
                "taskId": "2c3bce3aae944c109c857a7f389a3aa6", 
                "videoId": "e9b5c0b3-ae1c-4e6d-9e89-0ae446f9ba1e"
            }, 
            {
                "createTime": "2022-02-24T10:42:32Z", 
                "errorCode": "", 
                "errorMessage": "", 
                "finishTime": "2022-02-24T10:42:42Z", 
                "jobId": "8", 
                "outputBucket": "vod-storage-72757", 
                "outputFileKey": "snapshot/20220224/f20dc3bf739142929a79766235c7c43b-{SEQUENCEID}.jpg", 
                "spriteFileKey": "snapshot/20220224/f20dc3bf739142929a79766235c7c43b-sprite.jpg", 
                "status": "succeeded", 
                "taskId": "f20dc3bf739142929a79766235c7c43b", 
                "videoId": "04998143-5480-4ca7-97fa-bf3af4aa8ebf"
            }, 
            {
                "createTime": "2022-02-24T10:42:32Z", 
                "errorCode": "", 
                "errorMessage": "", 
                "finishTime": "2022-02-24T10:42:41Z", 
                "jobId": "8", 
                "outputBucket": "vod-storage-72757", 
                "outputFileKey": "snapshot/20220224/5d32d4c1088b4017914a0c254033864a-{SEQUENCEID}.jpg", 
                "spriteFileKey": "", 
                "status": "succeeded", 
                "taskId": "5d32d4c1088b4017914a0c254033864a", 
                "videoId": "04998143-5480-4ca7-97fa-bf3af4aa8ebf"
            }, 
            {
                "createTime": "2022-02-24T10:30:51Z", 
                "errorCode": "", 
                "errorMessage": "", 
                "finishTime": "2022-02-24T10:31:01Z", 
                "jobId": "7", 
                "outputBucket": "vod-storage-72757", 
                "outputFileKey": "snapshot/20220224/5d44160b9e814bcd8702ed49a62a9e80-{SEQUENCEID}.jpg", 
                "spriteFileKey": "snapshot/20220224/5d44160b9e814bcd8702ed49a62a9e80-sprite.jpg", 
                "status": "succeeded", 
                "taskId": "5d44160b9e814bcd8702ed49a62a9e80", 
                "videoId": "04998143-5480-4ca7-97fa-bf3af4aa8ebf"
            }, 
            {
                "createTime": "2022-02-23T13:48:34Z", 
                "errorCode": "", 
                "errorMessage": "", 
                "finishTime": "2022-02-23T13:48:46Z", 
                "jobId": "6", 
                "outputBucket": "vod-storage-72757", 
                "outputFileKey": "snapshot/20220223/1736d3f2af93462bb1318cc3a7f01166-{SEQUENCEID}.jpg", 
                "spriteFileKey": "", 
                "status": "succeeded", 
                "taskId": "1736d3f2af93462bb1318cc3a7f01166", 
                "videoId": "e9b5c0b3-ae1c-4e6d-9e89-0ae446f9ba1e"
            }, 
            {
                "createTime": "2022-02-23T13:41:38Z", 
                "errorCode": "", 
                "errorMessage": "", 
                "finishTime": "2022-02-23T13:41:44Z", 
                "jobId": "5", 
                "outputBucket": "vod-storage-72757", 
                "outputFileKey": "snapshot/20220223/9cf527a1e2094679b35026c5eeb9ecc7-{SEQUENCEID}.jpg", 
                "spriteFileKey": "snapshot/20220223/9cf527a1e2094679b35026c5eeb9ecc7-sprite.jpg", 
                "status": "succeeded", 
                "taskId": "9cf527a1e2094679b35026c5eeb9ecc7", 
                "videoId": "e9b5c0b3-ae1c-4e6d-9e89-0ae446f9ba1e"
            }, 
            {
                "createTime": "2022-02-23T08:51:56Z", 
                "errorCode": "", 
                "errorMessage": "", 
                "finishTime": "2022-02-23T08:52:10Z", 
                "jobId": "2", 
                "outputBucket": "vod-storage-72757", 
                "outputFileKey": "snapshot/20220223/63e4c8805648430091c92c5fb86596b4-{SEQUENCEID}.jpg", 
                "spriteFileKey": "", 
                "status": "succeeded", 
                "taskId": "63e4c8805648430091c92c5fb86596b4", 
                "videoId": "e9b5c0b3-ae1c-4e6d-9e89-0ae446f9ba1e"
            }, 
            {
                "createTime": "2022-02-21T10:16:33Z", 
                "errorCode": "", 
                "errorMessage": "", 
                "jobId": "1", 
                "outputBucket": "vod-storage-72757", 
                "outputFileKey": "snapshot/20220221/1f627b472391450cbc824f1afa0dfc74-{SEQUENCEID}.jpg", 
                "spriteFileKey": "", 
                "status": "succeeded", 
                "taskId": "1f627b472391450cbc824f1afa0dfc74", 
                "videoId": "e9b5c0b3-ae1c-4e6d-9e89-0ae446f9ba1e"
            }
        ], 
        "pageNumber": 1, 
        "pageSize": 20, 
        "totalElements": 9, 
        "totalPages": 1
    }
}
```
