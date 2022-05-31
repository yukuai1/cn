# releaseDedicatedPool


## 描述
删除单个专有资源池。<br>

详细操作说明请参考帮助文档：[删除专有资源池](https://docs.jdcloud.com/cn/dedicated-host/delete-dp)

### 接口描述
- 专有资源池中必须没有专有宿主机时才可释放。
- 如出现不能删除的情况请 [提交工单](https://ticket.jdcloud.com/applyorder/submit) 或联系京东云客服。

<br>敏感操作，可开启<a href="https://docs.jdcloud.com/cn/security-operation-protection/operation-protection">MFA操作保护</a>

## 请求方式
DELETE

## 请求地址
https://dh.jdcloud-api.com/v1/regions/{regionId}/dedicatedPool/{dedicatedPoolId}

|名称|类型|是否必需|示例值|描述|
|---|---|---|---|---|
|**regionId**|String|是| |地域ID|
|**dedicatedPoolId**|String|是|pool-dei8****hd |专有资源池ID|

## 请求参数
无


## 返回参数
|名称|类型|示例值|描述|
|---|---|---|---|
|**requestId**|String|c2hmmaan8w06w19qcdfuic4w03f7ft2d|请求ID。|

## 请求示例
DELETE

```
/v1/regions/cn-north-1/dedicatedPool/pool-dei8****hd
```



## 返回示例
```
{
    "requestId": "a0633f72670e59f8c6db36b1ee257011"
}
```


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
