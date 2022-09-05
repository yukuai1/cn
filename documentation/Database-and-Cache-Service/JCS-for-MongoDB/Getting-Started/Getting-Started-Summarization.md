# 快速入门概览

本文档介绍京东云MongoDB数据库实例创建和使用的整体流程，帮助您可快速掌握京东云MongoDB实例的创建、管理流程。



## 京东云MongoDB服务

京东云MongoDB数据库提供给您副本集和分片集群两种高可用架构，能够提供良好的实例控制、管理等基础功能，适用于多种业务场景。



## 副本集

京东云MongoDB提供可扩展的副本集部署架构，在副本集中包含一个可读写的Primary节点，多个Secondary节点，一个隐藏的Hidden节点，多个可选的ReadOnly节点。您可通过此种架构应对高并发数据读取的业务，并且通过可扩展的Secondary节点扩展副本集读取性能，以此减少节点的数据读取压力。



## 分片集群

在京东云MongoDB数据库的分片集群中，您可以按需选择Mongos和Shard的数量和配置以获得更好的水平扩展能力。对于MongoDB的Shard集群，其基础架构与副本集相同，京东云MongoDB仅提供三节点的部署模式，即一个Primary节点，一个Secondar节点和一个Hidden节点的架构。



## 流程导航

本文将从以下三个方面快速帮您熟悉京东云MongoDB数据库的创建和使用方式。

### 实例创建

- [创建副本集实例](./Get-Started-Replica/Create-ReplicaSet-Instance.md)
- [创建分片集群实例](./Get-Started-Shard/Create-Sharding-Instance.md)

### 实例管理

- [设置白名单](Set-WhiteList.md)
- [修改密码](Reset-Password.md)

### 数据库连接

- [副本集内网连接](./Getting-Started-Replica/Connect-ReplicaSet-Intranet.md)
- [副本集外网连接](./Getting-Started-Replica/Connect-ReplicaSet-Internet.md)
- [分片集群内网连接](./Get-Started-Shard/Connect-Sharding-Intranet.md)
- [分片集群外网连接](./Get-Started-Shard/Connect-Sharding-Internet.md)