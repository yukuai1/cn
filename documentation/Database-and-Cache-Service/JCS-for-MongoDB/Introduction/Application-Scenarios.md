# 应用场景

以下说明云数据库 MongoDB 的适用场景。

## 同城容灾
云数据库 MongoDB 支持多可用区部署模式，您可以将实例的多个节点分别部署在不同的可用区，以提供同城容灾能力。当因不可抗力导致某一可用区不能提供服务时，MongoDB 服务可自动切换到另一可用区，确保服务的可用性。

![同城容灾](../../../../image/mongodb/mogno-001.png)


## 分服应用
依托云数据库 MongoDB 完善的备份机制和根据时间点创建实例的能力，您可以快速基于某一实例的数据创建新的 MongoDB 实例，以满足游戏等分区服务类应用的快速滚服和合服的需求。

![分服应用](../../../../image/mongodb/mongo-002.png)

## 相关参考

- [产品优势](../Introduction/Product-Advantages.md)
- [价格总览](../Pricing/Price-Of-Instance.md)
- [计费概览](../Pricing/Billing-overall.md)
- [创建副本集实例](../Getting-Started/Getting-Started-Replica/Create-ReplicaSet-Instance.md)
- [创建分片集群实例](../Getting-Started/Get-Started-Shard/Create-Sharding-Instance.md)

