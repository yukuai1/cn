# 产品概述
分布式数据库 TiDB 是京东云联合 PingCAP 基于国内开源 NewSQL 数据库 TiDB 打造的一款同时支持 OLTP 和 OLAP 两种场景的分布式云数据库产品，实现了自动的水平伸缩，强一致性的分布式事务，部署简单，在线异步表结构变更不影响业务，同时兼容 MySQL 协议，使迁移使用成本降到极低。

## 分布式数据库 TiDB 主要特点 
1. 全新的分布式数据库，支持**PB级**数据容量，集群**QPS上百万**。
2. 真正的**多活架构**，多个节点可以同时提供数据读写服务，并且读写能力均可通过增加节点的方式进行水平扩展。
3. 整个集群**数据强一致**，所有节点读取的数据均为最新数据，无传统主从架构的数据延迟问题。
4. **与 MySQL 高度兼容**，使用 TiDB 像使用单机MySQL一样简单，可以从 MySQL 无缝切换到 TiDB，几乎无需修改代码。
5. 可直接在同一份数据上进行高效的数据查询、分析，简化了架构，提升了数据分析的实时性，同时降低了成本。
6. 全面支持IPV6。

## 支持地域及版本

|地域|版本|部署方式|
|-|-|-|
|华北-北京|4.0<br>5.4|单可用区|
|华东-上海|5.4|多可用区|


## 常用操作
- [创建实例](../Operation-Guide/Instance/Create-Instance.md)
- [创建账号](../Operation-Guide/Account/Create-Account.md)
- [连接实例](../Operation-Guide/Instance/Connect-Instance.md)
- [创建备份](../Operation-Guide/Backup/Create-Backup.md)
- [变更配置](../Operation-Guide/Instance/Modify-Instance-Spec.md)
 
