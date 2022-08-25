# 内网连接副本集实例

京东云MongoDB允许用户通过多种方式连接MongoDB实例，本文介绍如何通过默认开启的内网连接MongoDB。



## 前提条件

- MongoDB实例状态为运行，且计费状态正常。

- 需对白名单进行配置，京东云MongoDB数据库实例在创建时默认将VPC的CIDR地址加入白名单。

- 若您未设置密码，请优先设置密码，具体路径请参考密码修改文档。



## 内网链接查看步骤

1. 打开[MongoDB控制台](https://mongodb-console.jdcloud.com/mongodb)，在实例列表页面找到目标实例；

1. 点击需要进行连接的实例进入**实例详情**页；

1. 下滑当前页，在**连接信息模块**可得到副本集的内网域名地址，默认节点1为主节点。



## 连接方法示例

Mongo Shell连接：

```
mongo mongodb://root:****@jmongo-xxx.jmiss.jdcloud.com:27017/admin
```

如当前实例支持IPv6，需使用‘--ipv6’指定，命令样式如下：

```
mongo mongodb://root:****@jmongo-xxx.jmiss.jcloud.com:27017/admin --ipv6
```

Connection String URI连接：

```
mongodb://root:****@jmongo-xxx.jmiss.jdcloud.com:27017,jmongo-xxx.jmiss.jdcloud.com:27017/admin?replicaSet=mgset-1671110841
```

请在使用时将\****替换为您所设置的密码。

