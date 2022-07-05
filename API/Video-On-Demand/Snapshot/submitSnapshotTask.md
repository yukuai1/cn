# submitSnapshotTask


## 描述
提交截图作业


## 请求方式
POST

## 请求地址
https://vod.jdcloud-api.com/v1/snapshotJobs:submit


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**videoIds**|String[]|False| |视频ID列表|
|**templateIds**|String[]|False| |转码模板ID列表|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](submitsnapshottask#result)|提交截图作业结果|
|**requestId**|String|请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**jobs**|[SnapshotJobSummary[]](submitsnapshottask#snapshotjobsummary)|任务信息|
### <div id="snapshotjobsummary">SnapshotJobSummary</div>
|名称|类型|描述|
|---|---|---|
|**jobId**|String|job ID|
|**videoId**|String|视频ID|
|**status**|String|任务状态。<br>- submitted<br>- processing<br>- succeeded<br>- failed<br>|
|**tasks**|[TaskSummary[]](submitsnapshottask#tasksummary)|任务列表|
|**createTime**|String|创建时间|
|**updateTime**|String|修改时间|
### <div id="tasksummary">TaskSummary</div>
|名称|类型|描述|
|---|---|---|
|**taskId**|String|任务ID|
|**snapshotType**|String|模板类型。取值范围：<br>  sample - 采样截图模板<br>  sprite - 雪碧图模板<br>|
|**status**|String|任务状态。<br>- submitted<br>- processing<br>- succeeded<br>- failed<br>|
|**errorCode**|String|错误码|
|**errorMessage**|String|错误信息|
|**createTime**|String|创建时间|
|**updateTime**|String|修改时间|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|

## 请求示例
POST
```
https://vod.jdcloud-api.com/v1/snapshotJobs:submit

```

```
{
    "templateIds": [
        "0Fs76bzmoJNvLI5dPIJ", 
        "nzHFdY3nwOdeRKfwrXE"
    ], 
    "videoIds": [
        "e9b5c0b3-ae1c-4e6d-9e89-0ae446f9ba1e"
    ]
}
```

## 返回示例
```
{
    "requestId": "9v7cxE88n673KxUceo686JffpfU84151", 
    "result": {
        "failedTemplateIds": [], 
        "failedVideoIds": [], 
        "jobs": [
            {
                "createTime": "2022-02-25T10:26:05.320Z", 
                "jobId": "9a40cc90b64449408b8a045956f4892f", 
                "status": "submitted", 
                "tasks": [
                    {
                        "createTime": "2022-02-25T10:26:05.329Z", 
                        "snapshotType": "sprite", 
                        "status": "submitted", 
                        "taskId": "52b68b8cd93342b7b548f10604378af4"
                    }, 
                    {
                        "createTime": "2022-02-25T10:26:05.342Z", 
                        "snapshotType": "sample", 
                        "status": "submitted", 
                        "taskId": "2c3bce3aae944c109c857a7f389a3aa6"
                    }
                ], 
                "videoId": "e9b5c0b3-ae1c-4e6d-9e89-0ae446f9ba1e"
            }
        ]
    }
}
```
