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
