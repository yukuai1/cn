# JDCloud Redis Data Transfer Service API


## 简介
京东云Redis数据迁移服务接口


### 版本
v2


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**createMigration**|POST|创建一个迁移任务，指定并校验迁移配置|
|**createMigrationJob**|POST|创建迁移job，创建job之后无法修改迁移配置|
|**deleteMigration**|DELETE|删除迁移任务，迁移中的任务不能删除，迁移代理有流量不能删除|
|**describeMigration**|GET|查询迁移任务详情|
|**describeMigrations**|GET|迁移任务列表，可分页、可排序、可搜索、可过滤|
|**getMigrationProgress**|POST|查询迁移进度及数据校验状态|
|**modifyMigration**|PATCH|修改并验证迁移配置|
|**modifyMigrationName**|POST|修改迁移任务名|
|**restartMigrationJob**|POST|如果迁移超时、迁移失败，可重新迁移|
|**startMigrationJob**|POST|启动迁移job，开始迁移数据|
