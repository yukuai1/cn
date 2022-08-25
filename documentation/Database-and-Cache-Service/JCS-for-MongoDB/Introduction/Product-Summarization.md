# 产品概述

云数据库MongoDB是京东云基于全球广受欢迎的MongoDB提供的高性能NoSQL数据库服务，完全兼容MongoDB协议，支持副本集与分片集群两种部署方式，采用高可用架构，支持自动容灾切换，确保业务可用性。同时提供弹性扩容、备份恢复、监控报警等功能，可降低管理维护成本，使您能专注于应用开发和业务发展。



## 主要特性

- 默认采用高可用架构，支持自动容灾切换。

- 提供便捷的数据库备份与恢复功能，备份与恢复可一键完成。

- 支持弹性扩容，实例配置可随时调整，满足业务需求同时降低使用成本。

- 提供详尽的性能监控及自动报警功能，减轻运维负担。

- 全面支持IPV6。



## 支持版本

目前支持MongoDB3.2版、3.4版、3.6版、4.0版。



## MongoDB存储方式

数据结构：MongoDB是文档型键值数据库，数据库存储结构由字段和值组成，对于文档型数据，MongoDB有较好的读写性能。



## MongoDB存储概念

- 文档：存储的基本单元，由多个键值对组成的BSON文件

- 集合：多个文档组合成的数据表

- 数据库：数据库中可以包含多个集合，在单一实例中可根据实例存储空间创建多个数据库。




## 支持的架构

| 实例架构 | 说明                                                         |
| -------- | ------------------------------------------------------------ |
| 副本集   | 提供三节点、五节点、七节点的副本集架构，支持变更节点数量     |
| 分片集群 | 基于副本集组成的分片集群实例，包含Mongos、Config Server、Shard三个组件 |



## 支持的地域和可用区

| 地域      | 地域标示   | 可用区  | 可用区标示  |
| --------- | ---------- | ------- | ----------- |
| 华北-北京 | cn-north-1 | 可用区A | cn-north-1a |
| 华北-北京 | cn-north-1 | 可用区B | cn-north-1b |
| 华北-北京 | cn-north-1 | 可用区C | cn-north-1c |
| 华东-上海 | cn-east-2  | 可用区A | cn-east-2a  |
| 华东-上海 | cn-east-2  | 可用区B | cn-east-2b  |
| 华东-上海 | cn-east-2  | 可用区C | cn-east-2c  |

## 常用操作

- 快速上手
  - [创建副本集实例](../Getting-Started/Getting-Started-Replica/Create-ReplicaSet-Instance.md)
  - [创建分片集群实例](../Getting-Started/Get-Started-Shard/Create-Sharding-Instance.md)
  - [设置白名单](../Getting-Started/Set-WhiteList.md)
- 数据迁移
  - [将数据导入到云](../Getting-Started/Import-Data.md)
  - [从云导出数据](../Getting-Started/Export-Data.md)
- 备份与恢复
  - [设置自动备份策略](../Operation-Guide/Database-backup-managment/Auto-Backup.md)
  - [手动创建备份](../Operation-Guide/Backup/Create-Backup.md)
  - [数据恢复](../Operation-Guide/Restore-Backup/ReplicaSet/Restore-Instance-By-Backup.md)
- 运维管理
  - [查看监控信息](../Operation-Guide/Monitoring/Monitoring.md)
  - [设置报警规则](../Operation-Guide/Monitoring/Alarm-Rules.md)

## 计费

云数据库 MongoDB 支持 包年包月 和 按配置 计费两种计费类型。详细说明请参见[计费概述](../Pricing/Billing-overall.md)。