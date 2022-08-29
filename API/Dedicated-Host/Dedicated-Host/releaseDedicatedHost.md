# releaseDedicatedHost


## 描述
释放一台专有宿主机实例。

详细操作说明请参考帮助文档：[删除专有宿主机](https://docs.jdcloud.com/cn/dedicated-host/delete-dh)

## 接口说明
- 不可以删除包年包月未到期的实例。
- 不可以删除没有计费信息的实例，如实例无计费信息，说明在实例创建过程中出现了异常，请联系客服处理。
- 实例状态必须为`available`（可用）、`unavailable`（不可用）、`under-assessment`（维护中），同时专有宿主机上必须没有云主机实例才可删除。<br>
- 如出现不能删除的情况请 [提交工单](https://ticket.jdcloud.com/applyorder/submit) 或联系京东云客服。

<br>敏感操作，可开启<a href="https://docs.jdcloud.com/cn/security-operation-protection/operation-protection">MFA操作保护</a>

## 请求方式
DELETE

## 请求地址
https://dh.jdcloud-api.com/v1/regions/{regionId}/dedicatedHost/{dedicatedHostId}

|名称|类型|是否必需|示例值|描述|
|---|---|---|---|---|
|**regionId**|String|是|cn-north-1 |地域ID|
|**dedicatedHostId**|String|是|host-eumm****d6 |专有宿主机ID|

## 请求参数
无


## 返回参数
|名称|类型|示例值|描述|
|---|---|---|---|
|**requestId**|String|c2hmmaan8w06w19qcdfuic4w03f7ft2d|请求ID。|

## 请求示例
DELETE

```
/v1/regions/cn-north-1/dedicatedHost/host-eumm****d6
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
