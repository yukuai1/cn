# describeQuotas


## 描述
查询资源配额。

## 接口说明
- 调用该接口可查询专有宿主机、专有资源池的配额。


## 请求方式
GET

## 请求地址
https://dh.jdcloud-api.com/v1/regions/{regionId}/dhQuotas

|名称|类型|是否必需|示例值|描述|
|---|---|---|---|---|
|**regionId**|String|是|cn-north-1 |地域ID|

## 请求参数
|名称|类型|是否必需|示例值|描述|
|---|---|---|---|---|
|**filters**|[Filter[]](describeQuotas#user-content-filter)|否| |resourceTypes - 资源类型，支持多个[dedicatedHost，dedicatedPool]<br>|

### <div id="user-content-filter">Filter</div>
|名称|类型|是否必需|示例值|描述|
|---|---|---|---|---|
|**name**|String|是| |过滤条件的名称|
|**operator**|String|否| |过滤条件的操作符，默认eq|
|**values**|String[]|是| |过滤条件的值|

## 返回参数
|名称|类型|示例值|描述|
|---|---|---|---|
|**result**|[Result](describeQuotas#user-content-result)| |响应结果。|
|**requestId**|String|c2hmmaan8w06w19qcdfuic4w03f7ft2d|请求ID。|

### <div id="user-content-result">Result</div>
|名称|类型|描述|
|---|---|---|
|**quotas**|[Quota[]](describeQuotas#user-content-quota)|配额列表|
### <div id="user-content-quota">Quota</div>
|名称|类型|描述|
|---|---|---|
|**resourceType**|String|资源类型。可能值：<br> `dedicatedHost`: 专有宿主机 <br> `dedicatedPool`: 专有资源池|
|**limit**|Integer|配额上限|
|**used**|Integer|已用配额|

## 请求示例
GET

```
/v1/regions/cn-north-1/dhQuotas

```



## 返回示例
```
{
    "requestId": "d441c7c05a7522dd956394a16e433d95",
    "result": {
        "quotas": [
            {
                "resourceType": "dedicatedHost",
                "limit": 10,
                "used": 0
            },
            {
                "resourceType": "dedicatedPool",
                "limit": 10,
                "used": 0
            }
        ]
    }
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
