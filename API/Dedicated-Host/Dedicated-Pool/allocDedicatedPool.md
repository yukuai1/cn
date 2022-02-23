# allocDedicatedPool


## 描述
创建一个专有资源池。<br>
专有资源池为专有宿主机的集合，为用户提供独享且跨机架的宿主机资源池，基于资源独享及故障隔离实现业务安全、高可用部署。<br>

详细操作说明请参考帮助文档：[创建专有资源池](https://docs.jdcloud.com/cn/dedicated-host/create-dp)

## 接口说明
- 专有资源池需要指定专有宿主机规格，目前每一个专有资源池只能指定一种专有宿主机规格。
- 专有资源池创建完成后不可修改支持的专有宿主机规格及可用区信息。

## 请求方式
POST

## 请求地址
https://dh.jdcloud-api.com/v1/regions/{regionId}/dedicatedPools

|名称|类型|是否必需|示例值|描述|
|---|---|---|---|---|
|**regionId**|String|是|cn-north-1 |地域ID|

## 请求参数
|名称|类型|是否必需|示例值|描述|
|---|---|---|---|---|
|**dedicatedHostType**|String|是|g2.c76 |支持的专有宿主机规格，每个专有资源池只能且必须指定一个专有宿主机规格<br>|
|**name**|String|否|dp-test |专有宿主机池名称<br>|
|**az**|String[]|否|cn-north-1a |指定专有宿主机池支持的可用区，可指定多个。<br>|
|**description**|String|否| |专有宿主机池的描述信息。<br>|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](allocDedicatedPool#user-content-Result)| |
|**requestId**|String| |

### <div id="user-content-Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**dedicatedPoolId**|String| |

## 请求示例
POST

```
/v1/regions/cn-north-1/dedicatedPools
{
  "dedicatedHostType":"g2.c76",
  "name":"dp-test",
  "az":["cn-north-1a"]
}
```



## 返回示例
```
{
    "requestId": "e645a983805b5af503b1ba535b23ddf0",
    "result": {
        "dedicatedPoolId": "pool-4yj****jd"
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
|**429**|Quota exceeded|
|**500**|Internal server error|
|**503**|Service unavailable|
