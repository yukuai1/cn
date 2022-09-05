# 产品规格

京东云云数据库MongoDB目前支持以下规格



## 副本集规格实例

### 本地盘SSD存储类型

| 规格代码         | 规格     | 最大连接数 | 最大IOPS | 存储空间    |
| ---------------- | -------- | ---------- | -------- | ----------- |
| mongo.s1.small   | 1核2G    | 500        | 1000     | 50G-1000G   |
| mongo.s1.medium  | 2核4G    | 1000       | 2000     | 100G-1000G  |
| mongo.s2.medium  | 2核8G    | 2000       | 3000     | 100G-1000G  |
| mongo.s1.large   | 4核8G    | 2000       | 4000     | 200G-2000G  |
| mongo.s2.large   | 4核16G   | 4000       | 6000     | 200G-2000G  |
| mongo.s1.xlarge  | 8核16G   | 4000       | 8000     | 400G-2000G  |
| mongo.s2.2xlarge | 8核32G   | 8000       | 14000    | 600G-3000G  |
| mongo.s2.4xlarge | 16核64G  | 16000      | 16000    | 1000G-3000G |
| mongo.s2.8xlarge | 32核128G | 32000      | 20000    | 1500G-3000G |

### SSD云盘存储类型

| 规格代码            | 规格     | 最大连接数 | 最大IOPS               | 存储空间    |
| ------------------- | -------- | ---------- | ---------------------- | ----------- |
| mongo.s1.small      | 1核2G    | 500        | min{ 50 * 容量, 32000} | 50G-1000G   |
| mongo.s1.medium     | 2核4G    | 1000       | min{ 50 * 容量, 32000} | 100G-1000G  |
| mongo.s2.medium     | 2核8G    | 2000       | min{ 50 * 容量, 32000} | 100G-1000G  |
| mongo.s1.large      | 4核8G    | 2000       | min{ 50 * 容量, 32000} | 200G-2000G  |
| mongo.s2.large.node | 4核16G   | 4000       | min{ 50 * 容量, 32000} | 200G-2000G  |
| mongo.s1.xlarge     | 8核16G   | 4000       | min{ 50 * 容量, 32000} | 400G-2000G  |
| mongo.s2.2xlarge    | 8核32G   | 8000       | min{ 50 * 容量, 32000} | 600G-3000G  |
| mongo.s2.4xlarge    | 16核64G  | 16000      | min{ 50 * 容量, 32000} | 1000G-3000G |
| mongo.s2.8xlarge    | 32核128G | 32000      | min{ 50 * 容量, 32000} | 1500G-3000G |

## 分片集群实例规格

### 本地盘SSD存储类型

#### mongos

| 规格代码          | 规格     | 最大连接数 |
| ----------------- | -------- | ---------- |
| mongos.m1.small   | 1核2G    | 1000       |
| mongos.m1.medium  | 2核4G    | 2000       |
| mongos.m1.large   | 4核8G    | 4000       |
| mongos.m1.xlarge  | 8核16G   | 8000       |
| mongos.m1.2xlarge | 8核32G   | 16000      |
| mongos.m1.4xlarge | 16核64G  | 32000      |
| mongos.m1.8xlarge | 32核128G | 64000      |

#### congfig server

| 规格代码       | 规格  | 最大连接数 | 最大IOPS | 存储空间 |
| -------------- | ----- | ---------- | -------- | -------- |
| mongo.m1.small | 1核2G | 500        | 1000     | 20G      |

#### shard

| 规格代码         | 规格     | 最大连接数 | 最大IOPS | 存储空间    |
| ---------------- | -------- | ---------- | -------- | ----------- |
| mongo.m1.small   | 1核2G    | 500        | 1000     | 50G-1000G   |
| mongo.m1.medium  | 2核4G    | 1000       | 2000     | 100G-1000G  |
| mongo.m1.large   | 4核8G    | 2000       | 4000     | 200G-2000G  |
| mongo.m1.xlarge  | 8核16G   | 4000       | 8000     | 400G-2000G  |
| mongo.m1.2xlarge | 8核32G   | 8000       | 14000    | 600G-3000G  |
| mongo.m1.4xlarge | 16核64G  | 16000      | 16000    | 1000G-3000G |
| mongo.m1.8xlarge | 32核128G | 32000      | 20000    | 1500G-3000G |



### SSD 云盘存储类型

#### mongos

| 规格代码          | 规格     | 最大连接数 |
| ----------------- | -------- | ---------- |
| mongos.m1.small   | 1核2G    | 1000       |
| mongos.m1.medium  | 2核4G    | 2000       |
| mongos.m1.large   | 4核8G    | 4000       |
| mongos.m1.xlarge  | 8核16G   | 8000       |
| mongos.m1.2xlarge | 8核32G   | 16000      |
| mongos.m1.4xlarge | 16核64G  | 32000      |
| mongos.m1.8xlarge | 32核128G | 64000      |

#### config server

| 规格代码       | 规格  | 最大连接数 | 最大IOPS | 存储空间 |
| -------------- | ----- | ---------- | -------- | -------- |
| mongo.m1.small | 1核2G | 500        | 1000     | 20G      |

#### shard

| 规格代码         | 规格     | 最大连接数 | 最大IOPS               | 存储空间    |
| ---------------- | -------- | ---------- | ---------------------- | ----------- |
| mongo.m1.small   | 1核2G    | 500        | min{ 50 * 容量, 32000} | 50G-1000G   |
| mongo.m1.medium  | 2核4G    | 1000       | min{ 50 * 容量, 32000} | 100G-1000G  |
| mongo.m1.large   | 4核8G    | 2000       | min{ 50 * 容量, 32000} | 200G-2000G  |
| mongo.m1.xlarge  | 8核16G   | 4000       | min{ 50 * 容量, 32000} | 400G-2000G  |
| mongo.m1.2xlarge | 8核32G   | 8000       | min{ 50 * 容量, 32000} | 600G-3000G  |
| mongo.m1.4xlarge | 16核64G  | 16000      | min{ 50 * 容量, 32000} | 1000G-3000G |
| mongo.m1.8xlarge | 32核128G | 32000      | min{ 50 * 容量, 32000} | 1500G-3000G |

## 相关参考

- [实例价格](../Pricing/Price-Of-Instance.md)
- [创建副本集实例](../Getting-Started/Getting-Started-Replica/Create-ReplicaSet-Instance.md)
- [创建分片集群实例](../Getting-Started/Get-Started-Shard/Create-Sharding-Instance.md)
- [产品概述](../Introduction/Product-Summrization)