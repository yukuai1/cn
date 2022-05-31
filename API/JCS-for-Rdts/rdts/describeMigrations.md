# describeMigrations


## 描述
迁移任务列表，可分页、可排序、可搜索、可过滤

## 请求方式
GET

## 请求地址
https://rdts.jdcloud-api.com/v2/regions/{regionId}/instance

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |迁移任务所在区域的Region ID。华北-北京(cn-north-1)，华东-上海(cn-east-2)，华南-广州(cn-south-1)|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False| |页码：取值范围[1,∞)，默认为1|
|**pageSize**|Integer|False| |分页大小：取值范围[10,100]，默认为10|
|**filters**|[Filter[]](describemigrations#filter)|False| |过滤条件：<br>- instanceIds：迁移任务ID，精确匹配，可选择多个<br>- migrationName：迁移任务名称，模糊匹配<br>- migrationStatuses：迁移任务状态，精确匹配，可选择多个（具体可参考迁移任务详情中的迁移状态）<br>|
|**sorts**|[Sort[]](describemigrations#sort)|False| |排序属性：<br>- createdTime：按创建时间排序(asc表示按时间正序，desc表示按时间倒序)<br>|

### <div id="sort">Sort</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |排序条件的名称|
|**direction**|String|False| |排序条件的方向|
### <div id="filter">Filter</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤条件的名称|
|**operator**|String|False| |过滤条件的操作符，默认eq|
|**values**|String[]|True| |过滤条件的值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](describemigrations#result)|结果|
|**requestId**|String|本次请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**instances**|[ListItem[]](describemigrations#listitem)|分页后的实例列表|
|**totalCount**|Integer|迁移任务总数|
### <div id="listitem">ListItem</div>
|名称|类型|描述|
|---|---|---|
|**instanceId**|String|迁移任务ID|
|**migrationName**|String|迁移名称|
|**migrationStatus**|String|迁移状态(creating：创建中，validated：验证通过，invalid：验证失败，starting：启动中，waitMigrate：待迁移，migrating：迁移中，migrated：迁移成功，createFailed：创建失败，startFailed：启动失败，migrateFailed：迁移失败，error：异常错误，deleting：删除中，migrateTimeout：迁移超时)|
|**currentStep**|String|当前迁移步骤：<br>- clientFlowInSource：初始化状态，client流量位于源端；<br>- migrateAndCheck：迁移数据并且校验，client流量仍位于源端；<br>- clientFlowInProxy：client的流量位于迁移代理上；<br>- clientFlowRedirect：迁移代理切换client的流量；<br>- clientFlowInTarget：client流量切换到目的端；<br>- migrateFinish：迁移完成状态；<br>|
|**currentStepStatus**|String|当前迁移步骤状态，init初始化，running运行中，success成功，fail失败|
|**failedReason**|String|失败原因|
|**createdTime**|String|创建时间(ISO 8601标准的UTC时间，格式为：YYYY-MM-DDTHH:mm:ssZ)|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
