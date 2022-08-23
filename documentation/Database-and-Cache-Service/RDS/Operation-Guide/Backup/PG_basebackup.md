# 实例级别全量备份pg_basebackup

使用PostgreSQL自带的工具pg_basebackup将整个实例的数据进行备份，并导出到本地保存。

## 背景

pg_basebackup可以将整个PostgreSQL实例的数据进行备份，在后续业务中可用于时间点恢复。更多详情请参见[pg_basebackup](https://www.postgresql.org/docs/12/app-pgbasebackup.html)。

本文使用CentOS 7操作系统和PostgreSQL 12版本为例进行演示。

## 前提条件

1. PostgreSQL实例已经设置白名单连接云服务器或本地服务器的IP。
2. 云服务器或本地服务器已安装与云数据库PostgreSQL相同版本的PostgreSQL实例。

## 注意事项

建议使用高权限账号进行备份，避免出现权限不足的问题。

## 操作步骤
> pg_basebackup无法备份单个数据库或数据库对象。备份单个数据库或数据库对象请参见[逻辑备份PostgreSQL数据](https://docs.jdcloud.com/cn/rds/PG_dump)。
>
1. 登陆云服务器或本地服务器，使用如下命令备份目标数据库。

   ```
   pg_basebackup -Ft -Pv -Xs -z -D <backupdir> -Z5 -h '<hostname>' -p <port> -U <username> -W
   ```

   

   参数说明如下。命令说明请参见[pg_basebackup](https://www.postgresql.org/docs/12/app-pgbasebackup.html)。

| 参数      | 说明                                                         |
| --------- | ------------------------------------------------------------ |
| backupdir | 导出的备份文件路径。系统会自动创建目录，但是如果该目录已经存在且不为空，则会报错。 |
| port      | 云数据库PostgreSQL实例端口。                                 |
| username  | 云数据库 PostgreSQL实例高权限账号名称。                      |
| hostname  | 云数据库 PostgreSQL实例连接地址。                            |

2. 命令行提示`Password:`时，输入PostgreSQL实例账号对应的密码，然后按回车键确认。