# describeDedicatedPools


## 描述
查询一个或多个专有资源池的详细信息。

## 接口描述

- 使用 `filters` 过滤器进行条件筛选，每个 `filter` 之间的关系为逻辑与（AND）的关系。
- 单次查询最大可查询100条专有资源池数据。
- 尽量一次调用接口查询多条数据，不建议使用该批量查询接口一次查询一条数据，如果使用不当导致查询过于密集，可能导致网关触发限流。
- 由于该接口为 `GET` 方式请求，最终参数会转换为 `URL` 上的参数，但是 `HTTP` 协议下的 `GET` 请求参数长度是有大小限制的，使用者需要注意参数超长的问题。

## 请求方式
GET

## 请求地址
https://dh.jdcloud-api.com/v1/regions/{regionId}/dedicatedPools

|名称|类型|是否必需|示例值|描述|
|---|---|---|---|---|
|**regionId**|String|是|cn-north-1  |地域ID|

## 请求参数
|名称|类型|是否必需|示例值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|否 |1|页码；默认为1|
|**pageSize**|Integer|否|20|分页大小；默认为20；取值范围[10, 100]|
|**filters**|[Filter[]](describeDedicatedPools#user-content-filter)|否| |filters 中支持使用以下关键字进行过滤<br> `dedicatedPoolId`: 专有资源池ID，精确匹配，支持多个<br> `name`: 专有宿主机名称，模糊匹配，支持单个<br> `dedicatedHostType`: 专有宿主机规格，精确匹配，支持多个<br>|

### <div id="user-content-filter">Filter</div>
|名称|类型|是否必需|示例值|描述|
|---|---|---|---|---|
|**name**|String|是|dedicatedPoolId |过滤条件的名称|
|**operator**|String|否|eq |过滤条件的操作符，默认eq|
|**values**|String[]|是|pool-iu9y****sy |过滤条件的值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](describeDedicatedPools#user-content-Result)| |
|**requestId**|String| |

### <div id="user-content-Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**dedicatedPools**|[DedicatedPool[]](describeDedicatedPools#user-content-dedicatedpool)| |
|**totalCount**|Number| |
### <div id="user-content-dedicatedpool">DedicatedPool</div>
|名称|类型|描述|
|---|---|---|
|**dedicatedPoolId**|String|专有资源池ID|
|**name**|String|专有资源池名称|
|**dedicatedHostType**|String|专有资源池支持的机型|
|**description**|String|专有资源池描述|
|**az**|String[]|专有资源池选定的AZ列表|
|**capacity**|[ResourceCapacity](describeDedicatedPools#user-content-ResourceCapacity)|专有资源池资源使用信息|
|**supportedInstanceType**|String[]|专有宿主机支持的云主机实例规格|
|**dedicatedHosts**|[DedicatedHostsBreif](describeDedicatedPools#user-content-DedicatedHostsBreif)|专有资源池下的专有宿主机简要信息|
|**instanceIds**|String[]|专有资源池中的云主机ID列表|
|**createTime**|String|创建时间|
### <div id="user-content-DedicatedHostsBreif">DedicatedHostsBreif</div>
|名称|类型|描述|
|---|---|---|
|**count**|Integer|专有宿主机个数|
|**dedicatedHost**|[DedicatedHostBreif[]](describeDedicatedPools#user-content-dedicatedhostbreif)|专有宿主机信息|
### <div id="user-content-dedicatedhostbreif">DedicatedHostBreif</div>
|名称|类型|描述|
|---|---|---|
|**dedicatedHostId**|String|专有宿主机ID|
|**az**|String|专有宿主机所在的可用区|
|**logicRack**|Integer|专有宿主机所在的逻辑机架|
### <div id="user-content-ResourceCapacity">ResourceCapacity</div>
|名称|类型|描述|
|---|---|---|
|**totalVCPUs**|Integer|专有宿主机总VCPU数|
|**totalMemoryMB**|Integer|专有宿主机总内存大小，单位MB|
|**totalDiskGB**|Integer|专有宿主机总本地磁盘大小，单位GB|
|**totalGPUs**|Integer|专有宿主机总GPU个数|
|**usedVCPUs**|Integer|专有宿主机已分配的VCPU数|
|**usedMemoryMB**|Integer|专有宿主机已分配的内存大小，单位MB|
|**usedDiskGB**|Integer|专有宿主机已分配的本地磁盘大小，单位GB|
|**usedGPUs**|Integer|专有宿主机已分配的GPU个数|
|**localDiskType**|String|专有宿主机本地盘类型|
|**instanceCount**|Integer|专有宿主机上的云主机个数|

## 请求示例
GET

```
/v1/regions/cn-north-1/dedicatedPools?filters.1.name=dedicatedPoolId&filters.1.values.1=pool-p2ae****0c
```

## 返回示例
```
{
    "requestId": "48dbee68a69d67e72fee62cb5bd23620",
    "result": {
        "totalCount": 1,
        "dedicatedPools": [
            {
                "dedicatedPoolId": "pool-p2ae****0c",
                "name": "lmy",
                "dedicatedHostType": "g2.c76",
                "description": "",
                "az": [
                    "cn-north-1c"
                ],
                "capacity": {
                    "totalVCPUs": 76,
                    "totalMemoryMB": 311296,
                    "totalDiskGB": 1743,
                    "totalGPUs": 0,
                    "usedVCPUs": 2,
                    "usedMemoryMB": 8192,
                    "usedDiskGB": 0,
                    "usedGPUs": 0,
                    "localDiskType": "",
                    "instanceCount": 2
                },
                "supportedInstanceType": [
                    "g.n2.medium",
                    "g.n2.large",
                    "g.n2.xlarge",
                    "g.n2.2xlarge",
                    "g.n2.4xlarge",
                    "g.n2.8xlarge",
                    "g.n2.16xlarge",
                    "g.n2.18xlarge",
                    "c.c2.large",
                    "c.c2.xlarge",
                    "c.c2.2xlarge",
                    "c.c2.3xlarge",
                    "c.c2.4xlarge",
                    "c.n2.large",
                    "c.n2.xlarge",
                    "c.n2.2xlarge",
                    "c.n2.4xlarge",
                    "c.n2.8xlarge",
                    "c.n2.16xlarge",
                    "c.n2.18xlarge",
                    "m.n2.large",
                    "m.n2.xlarge",
                    "m.n2.2xlarge",
                    "m.n2.4xlarge",
                    "m.n2.8xlarge"
                ],
                "dedicatedHosts": {
                    "count": 1,
                    "dedicatedHost": [
                        {
                            "dedicatedHostId": "host-nrj0****o0",
                            "az": "cn-north-1c",
                            "logicRack": "1"
                        }
                    ]
                },
                "instanceIds": [
                    "i-wluy****9d",
                    "i-ioyy****nx"
                ],
                "createTime": "2021-09-07 17:22:17"
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
