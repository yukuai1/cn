# 管理数据库账号

您通过京东云MongoDB控制台创建实例时，系统会自动为您创建root账号并赋予相应权限。实例创建完成后，您可以通过登录root账号创建子账号。



## 账号控制权限

登录MongoDB实例，输入账号创建命令：db.createUser(user, writeConcern)。

user文档格式如下：

```
{ user: "<name>",
  pwd: "<cleartext password>",
  customData: { <any information> },
  roles: [
    { role: "<role>", db: "<database>" } | "<role>",
    ...
  ]
}
```



## 账户权限说明

在数据库管理中，root账号可通过赋予子账号不同的角色以限制各子账号的权限，以下列举常用的角色权限的相应字段。

| 权限级别         | 角色名称             | 权限说明                             |
| ---------------- | -------------------- | ------------------------------------ |
| 数据库用户角色   | read                 | 只读权限，仅可查询指定库             |
|                  | readWrite            | 读写权限，可对指定库数据进行增删改查 |
| 数据库管理员角色 | dbAdmin              | 允许在指定数据库中执行管理权限       |
|                  | dbOwner              | 数据库拥有者，拥有指定库的操作权限   |
|                  | userAdmin            | 允许在指定数据库创建用户             |
| 集群管理员角色   | clusterAdmin         | 管理集群的最高级别权限               |
|                  | clusterManager       | 管理和监控集群权限                   |
|                  | clusterMonitor       | 监控集群权限                         |
|                  | hostManager          | Server管理权限                       |
| 备份恢复角色     | backup               | 可备份数据库数据的权限               |
|                  | restore              | 基于备份恢复数据库数据的权限         |
| 所有库角色       | readAnyDatabase      | 实例所有数据库的只读权限             |
|                  | readWriteAnyDatabase | 实例所有数据库的读写权限             |
|                  | userAdminDatabase    | 实例数据库上账号管理权限             |
|                  | dbAdminAnyDatabase   | 实例所有数据库的完整权限             |
| 超级管理员角色   | root                 | 超级账号                             |



## 账号创建示例

在products库创建accountAdmin01账号

```
    use products
    db.createUser( { user: "accountAdmin01",
                     pwd: "changeMe",
                     customData: { employeeId: 12345 },
                     roles: [ { role: "clusterAdmin", db: "admin" },
                              { role: "readAnyDatabase", db: "admin" },
                              "readWrite"] },
                   { w: "majority" , wtimeout: 5000 } )
```

创建带角色的用户

```
    use products
    db.createUser(
       {
         user: "accountUser",
         pwd: "password",
         roles: [ "readWrite", "dbAdmin" ]
       }
    )
```

创建不带角色的用户

```
    use admin
    db.createUser(
       {
         user: "reportsUser",
         pwd: "password",
         roles: [ ]
       }
    )
```

创建带角色的管理员账号

```
  use admin
    db.createUser(
       {
         user: "appAdmin",
         pwd: "password",
         roles:
           [
             { role: "readWrite", db: "config" },
             "clusterAdmin"
           ]
       }
    )
```