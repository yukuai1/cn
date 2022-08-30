# 分片集群内网连接

京东云MongoDB允许用户通过多种方式连接MongoDB实例，本文介绍如何通过默认开启的内网连接MongoDB。



## 前提条件

- MongoDB实例状态为运行，且计费状态正常。

- 需对白名单进行配置，京东云MongoDB数据库实例在创建时默认将VPC的CIDR地址加入白名单。

- 若您未设置密码，请优先设置密码，具体路径请参考[修改密码](../Reset-Password.md)文档。

- Shard连接仅支持单点连接方式。

## 使用说明

- 京东云MongoDB分片集群默认开放Mongos内网连接地址，若需要直接访问Mongod或Config Server，您需要按需进行开启。



## 内网链接查看步骤

1. 打开[MongoDB控制台](https://mongodb-console.jdcloud.com/mongodb)，在实例列表页面找到目标实例

2. 点击需要进行连接的实例进入实例信息页

3. 点击上方标签栏的数据库连接进入管理界面，进入后选择内网连接

   ![img](../../../../../image/mongodb/openShardIntranet.png)

   

4. 分片集群由Mongos、Config Server和Mongod组成，在本页面可选择默认连接Mongos或者开启Shard/Config Server的内网链接，以获得其内网域名。

   - 若您当前实例从未开启Shard的内网或外网连接，您需要针对Shard单独设置账号密码，当您点击开启内网连接后，您需要在弹窗内填写账号密码，账号不可为root；

   - 若您已经开启Shard的外网连接，您无须设置账号密码，使用外网连接开启时设置的账号密码即可。

![img](../../../../../image/mongodb/openShardIntranet-2.png)

具体参数说明如下：

| 字段               | 字段说明                                                     |
| ------------------ | ------------------------------------------------------------ |
| 副本集名称         | 副本集的唯一识别ID                                           |
| 内网域名           | 副本集内除隐藏节点外所有内网节点域名，默认节点1为Primary节点 |
| 外网域名（需开启） | 副本集内除隐藏节点外所有外网节点域名，默认节点1为Primary节点 |



## 连接方式示例

Mongo Shell连接：

```
mongo mongodb://user:****@jmongo-xxx.jmiss.jdcloud.com:27017/admin
```

如当前实例支持IPv6，需使用‘--ipv6’指定，命令样式如下：

```
mongo mongodb://user:****@jmongo-xxx.jmiss.jcloud.com:27017/admin --ipv6
```

Connection String URI连接：

```
mongodb://user:****@jmongo-xxx.jmiss.jdcloud.com:27017,jmongo-xxx.jmiss.jdcloud.com:27017/admin
```

请将user替换成您设置的账号，将\****替换成您所设定的密码，即连接Mongos使用root账号，其他节点连接需使用您的自定义账号。