# Elasticsearch日志
云搜索Elasticsearch通过京东云日志服务提供Elasticsearch日志的查询和展示，日志类型包括主日志、搜索慢日志、索引慢日志、GC日志的查询和展示，各类型日志的日志内容主要由time、content 组成。您可以通过输入关键字和设置时间范围，筛选出需要查询的日志内容，快速定位集群问题，辅助集群运维。</br>

- Time：日志的产生时间。</br>
- Content：日志具体内容。</br>

## 前提条件
- 已开通了京东云的日志服务。</br>
- 已创建了云搜索Elasticsearch集群实例。</br>

## 操作步骤
1. 登陆 [京东云Elasticsearch控制台](https://es-console.jdcloud.com/clusters)。</br>
2. 在集群管理页，单击 **集群名称** 进入集群详情页。 </br>
3. 选择 **日志服务** 页签。日志服务开关，默认关闭，关闭状态下日志服务未生效。您可切换开/关状态以打开或关闭Elasticsearch日志服务功能。</br>
![ES_Logging_On](../../../../image/Elasticsearch/Logging/ES_Logging_On.png)</br>
4. 日志服务开关打开时，日志服务生效，系统会自动在京东云日志服务创建日志集es-log-{ClusterID}和4种日志主题：主日志（master-log）、索引慢日志（index-slow-log）、搜索慢日志（search-slow-log）、GC日志（gc-log）；日志服务开关关闭后，系统将删除自动创建的日志集和日志主题。</br>
![ES_Logging_On_1](../../../../image/Elasticsearch/Logging/ES_Logging_On_1.png)</br>
5. 主日志、搜索慢日志、索引慢日志、GC日志4种日志内容均最长可支持近7天日志查询，点击日志内容展示日志上下文。</br>
![ES_Logging](../../../../image/Elasticsearch/Logging/ES_Logging.png)</br>

## 日志说明

### 主日志
主日志主要展示集群的运行日志，包括日志产生的时间、级别、日志所在的节点和日志内容等，包括INFO、DEBUG、WARN等不同级别。
当您需要查看集群中各节点的运行状况及查询写入情况，例如节点之间的连通性、Full GC情况、创建或删除索引情况、集群级别的查询报错等信息时，可查看主日志进行排查。

### 慢日志
#### 开启和调整慢日志


### GC日志


