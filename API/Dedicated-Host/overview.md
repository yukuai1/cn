# 专有宿主机


## 简介
专有宿主机相关接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**allocDedicatedHosts**|POST|创建一台或多台指定机型的专有宿主机|
|**describeDedicatedHosts**|GET |查询一台或多台专有宿主机的详细信息 |
|**modifyDedicatedHostAttribute**|POST| 修改一台专有宿主机的属性，支持修改专有宿主机的名称和描述 |
|**releaseDedicatedHost**|GET |根据 id 删除一台专有宿主机，需确保专有宿主机上的云主机实例已全部删除  |
|**allocDedicatedPool**|POST|创建一个专有资源池|
|**describeDedicatedPools**|GET |查询一个或多个专有资源池的详细信息 |
|**modifyDedicatedPoolAttribute**|POST| 修改专有资源池的属性，支持修改专有资源池的名称、描述和可用区 |
|**releaseDedicatedPool**|GET |根据 id 删除一个专有资源池  |
|**describeDedicatedHostType**|GET |查询专有宿主机规格 |
|**describeQuotas**|GET |查询专有宿主机、专有资源池的配额 |
