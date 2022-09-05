# batchIpBlackList


## 描述
批量添加域名ip黑名单

## 请求方式
POST

## 请求地址
https://cdn.jdcloud-api.com/v1/batchIpBlackList


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domains**|String[]|True| |域名列表。最多30个|
|**ipList**|String[]|True| |ip列表。最多50个|
|**forbidTime**|Long|False| |封禁时长，单位分钟。默认1440|
|**action**|String|True| |forbid or resume.代表封禁和解封。|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Object| |
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|

