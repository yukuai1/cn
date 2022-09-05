# 外网连接副本集实例

出于安全考虑，京东云MongoDB实例默认不开启外网链接，但用户可通过控制台和OpenAPI自行开启外网访问权限。

## 前提条件

- MongoDB实例状态为运行，且计费状态正常。

- MongoDB需要通过控制台或OpenAPI开启外网连接，如果您未开启外网连接，请先开启外网连接。

- 若您未设置密码，请优先设置密码，具体路径请参考[修改密码](../Reset-Password.md)文档。

## 操作步骤

1. 登录[MongoDB控制台](https://mongodb-console.jdcloud.com/mongodb)；
2. 在实例列表界面选中需要打开外网连接的实例，点击进入**实例详情**界面；
3. 在实例信息标签中找到**连接信息模块**，点击**开启外网访问**按钮即可开启外网访问；
4. 稍等3-5分钟后刷新页面可获得节点外网连接域名，默认节点1为主节点。



## 操作注意事项

- 由于外网域名生效需要一定时间，请耐心等待3-5分钟。

- 每次开启外网访问，访问域名会发生变化，若长时间保持外网访问，则访问域名固定。
- 目前外网连接仅支持单点连接方式。



## 外网连接方式示例

Mongo Shell连接：

```
mongo mongodb://root:****@jmongo-xxx.jmiss.jdcloud.com:27017/admin
```

如当前实例支持IPv6，需使用‘--ipv6’指定：

```
mongo mongodb://root:****@jmongo-xxx.jmiss.jcloud.com:27017/admin --ipv6
```

Connection String URI连接：

```
mongodb://root:****@jmongo-xxx.jmiss.jdcloud.com:27017/admin
```

使用时请将\****替换为您自己设置的密码。